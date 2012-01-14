class Address < ActiveRecord::Base
  # include Geokit::Geocoders
  belongs_to :subject, :polymorphic => true
  belongs_to :state
    
  validates_presence_of :line1, :state, :city, :zip
  
  def to_s
    str = ""
    str += "#{self.line1}\n" if self.line1.present?
    str += "#{self.city}, #{self.state.try(:abbreviation)} " if self.city
    str += self.zip if self.zip
    return str
  end
  
  
  def location_string
    return [line1, city, state.try(:abbreviation), zip].compact.join(', ')
  end
  
  
  # def latitude_and_longitude
  #   result = MultiGeocoder.geocode(location_string)
  #   return result.success ? result.ll.split(",") : nil
  # end
  
  
  # def map(options={})
  #   map = nil
  #   coordinates = latitude_and_longitude
  #   return nil unless coordinates 
  # 
  #   # http://www.killswitchcollective.com/articles/65_google_maps_on_rails
  #   # http://github.com/queso/ym4r-gm
  #   map = GMap.new("map")
  #   map.control_init(:large_map => true, :map_type => true)
  #   title = CGI::escapeHTML(self.subject.to_s)
  #   map.center_zoom_init(coordinates,12)
  #   map_link = "http://maps.google.com/maps?f=q&hl=en&saddr=&daddr=#{location_string.gsub(' ','+')}&geocode=&q=#{location_string.gsub(' ','+')}"
  #   map.overlay_init(GMarker.new(coordinates,:title => title, :info_window => "<a href=#{map_link}>#{title}</a>"))
  #   return map
  # end
  
  
  def google_api_address
    return "#{self.line1}+#{self.line2}+#{self.city}+#{self.state}+#{self.zip}".gsub(" ", "+")
  end
end
