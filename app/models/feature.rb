class Feature < ActiveRecord::Base
  has_many :ad_features, :dependent => :destroy
  ### TODO: PAPERCLIP
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def to_s
    return name
  end
  
  
  def self.select_options(options={})
    conds = "TRUE"
    conds += " AND utility IS TRUE" if options[:utility]
    conds += " AND utility IS NOT TRUE" if options[:non_utility]
    
    order = (options[:order_by])? options[:order_by]: "name ASC"
    select = self.all(:conditions => conds, :order => order).map {|u| [u.to_s, u.id]}
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
