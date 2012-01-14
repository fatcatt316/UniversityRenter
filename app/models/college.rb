class College < ActiveRecord::Base
  has_many :communities
  has_many :listings
  
  has_one :address, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :address, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  validates_presence_of :name, :short_name, :description
  validates_uniqueness_of :name
  validates_presence_of :address
  
  cattr_accessor :current_college
  
  def to_s 
    return name
  end
  
  
  def self.select_options(options={})
    order = (options[:order_by])? options[:order_by]: "name ASC"
    select = self.all(:order => order).map{|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
