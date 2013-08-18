class Address < ActiveRecord::Base
  acts_as_gmappable
  
  belongs_to :subject, :polymorphic => true
  belongs_to :state
    
  validates_presence_of :line1, :state, :city, :zip
  
  def to_s
    "#{line1}\n#{city}, #{state.abbreviation} #{zip}"
  end
  
  
  def location_string
    return [line1, city, state.try(:abbreviation), zip].compact.join(', ')
  end
  
  
  def gmaps4rails_address
    return location_string
  end
  
  
  def google_api_address
    return location_string
  end
  
  
  def self.city_select_options(options={})
    cities = order("city DESC").group(:city)
    cities = cities.where(:state_id => options[:state_id]) if options[:state_id].present?
    cities = cities.select("addresses.city").all.map{|city| [city.city, city.city] }
    if options[:include_blank]
      blank_option = cities.size.zero? ? "None found!" : ""
      cities = [blank_option].concat(cities)
    end
    return cities
  end
end
