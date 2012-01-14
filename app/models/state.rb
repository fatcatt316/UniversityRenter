class State < ActiveRecord::Base
  has_many :addresses
  
  validates_uniqueness_of :name, :abbreviation
  validates_presence_of :name, :abbreviation
  
  def to_s
    return name
  end
end
