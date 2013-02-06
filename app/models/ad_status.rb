class AdStatus < ActiveRecord::Base
  has_many :listings
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def to_s
    return name
  end
  
  def self.approved
    return self.where("name = 'Approved'").first
  end
  
  
  def self.select_options(options={})
    options[:order_by] ||= "name ASC"
    select = self.order(options[:order_by]).all.map{|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
