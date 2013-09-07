class State < ActiveRecord::Base
  has_many :addresses
  
  validates_uniqueness_of :name, :abbreviation
  validates_presence_of :name, :abbreviation
  
  def to_s
    "#{name}"
  end
  
  
  def self.select_options(options={})
    select = self
    if options[:having_colleges]
      select = select.joins(:addresses).where("addresses.subject_type = 'College'")
    end
    
    select = select.order("name ASC").all.map{|state| [state.name, state.id] }
    select = [""].concat(select) if options[:include_blank]
    return select
  end
end
