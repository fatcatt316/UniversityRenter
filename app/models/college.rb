class College < ActiveRecord::Base
  has_many :communities
  has_many :listings
  
  has_one :address, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :address, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  validates_presence_of :name, :short_name, :description
  validates_uniqueness_of :name
  validates_presence_of :address
  
  
  def to_s 
    return name
  end
  
  
  def city_state
    return "#{address.city}, #{address.state.abbreviation}"
  end
  
  
  def can_edit?(user=nil)
    return user && user.admin?
  end
  
  
  def self.select_options(options={})
    order = (options[:order_by])? options[:order_by]: "name ASC"
    select = self.all(:order => order).map{|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
  
  
  def self.search(options={})
    joins = []
    college_search = self
    
    joins << :address if options[:state_id].present? || options[:city].present?
    
    if options[:state_id]
      college_search = college_search.where("addresses.state_id = ?", options[:state_id])
    end
    if options[:city]
      college_search = college_search.where("addresses.city = ?", options[:city])
    end
    
    joins.each do |join|
      college_search = college_search.joins(join)
    end
    
    options[:order] ||= :name
    college_search = college_search.order(options[:order])
    
    return college_search
  end
end
