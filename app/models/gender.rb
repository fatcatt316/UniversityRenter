class Gender < ActiveRecord::Base
  has_many :users
  has_many :listings, foreign_key: "preferred_gender_id"
  
  validates_uniqueness_of :name
  validates_presence_of :name
  
  def to_s
    "#{name}"
  end
  
  
  def self.select_options(options={})
    order = (options[:order_by]) ? options[:order_by]: "name ASC"
    select = self.order(order).all.map {|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
