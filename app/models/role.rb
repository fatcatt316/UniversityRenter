class Role < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  
  
  def to_s
    "#{name}"
  end
  
  
  def self.of_type(type)
    return self.find_by_name(type.to_s.capitalize)
  end
  
  
  def self.select_options(options={})
    order = (options[:order_by])? options[:order_by]: "name ASC"
    select = self.find(:all, order: order).map {|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
