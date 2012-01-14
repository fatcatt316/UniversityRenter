class Community < ActiveRecord::Base
  has_many :listings

  has_one :address, :as => :subject, :dependent => :destroy
  accepts_nested_attributes_for :address, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  has_many :ad_features, :as => :subject, :dependent => :destroy
  has_many :features, :through => :ad_features
  
  has_many :documents, :as => :owner, :dependent => :destroy
  accepts_nested_attributes_for :documents, :reject_if => lambda { |a| a.values.all?(&:blank?) }, :allow_destroy => true
  
  belongs_to :college
  
  validates_presence_of :name, :college
  validates_presence_of :address
  validates_uniqueness_of :name, :scope => :college_id
  validates_numericality_of :price_per_month, :allow_nil => true
  validates_format_of :email, :with => /^\S+@\w+\.\w+/, :on => :create, :message => "is invalid"
  
  def to_s 
    return name
  end
  
  
  def primary_document
    return documents.select{|d| d.primary}.first
  end
  
  
  def self.select_options(options={})
    cond = "TRUE"
    cond_crit = []
    
    unless options[:college_id].blank?
      cond += " AND communities.college_id = ?"
      cond_crit << options[:college_id]
    end
    
    order = (options[:order_by])? options[:order_by]: "name ASC"
    select = self.all(:conditions => [cond] + cond_crit, :order => order).map{|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
