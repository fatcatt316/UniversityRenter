class AdStatus < ActiveRecord::Base
  has_many :listings
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def to_s
    "#{name}"
  end
  
  def approved?
    name == "Approved"
  end
  
  def denied?
    name == "Denied"
  end
  
  def pending?
    name == "Pending"
  end
  
  def retired?
    name == "Retired"
  end
  
  def self.approved
    where("name = 'Approved'").first
  end
  
  def self.retired
    where("name = 'Retired'").first
  end
  
  def self.accessible_status?(current_user, ad_status_id)
    return true if current_user.admin?
    ad_status = where(id: ad_status_id).first
    ad_status && editable_status_names.include?(ad_status.name)
  end
  
  def self.editable_status_names
    ["Approved", "Retired"]
  end
  
  def self.select_options(options={})
    options[:order_by] ||= "name ASC"
    select = order(options[:order_by]).all.map{|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
