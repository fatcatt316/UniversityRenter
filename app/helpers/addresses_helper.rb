module AddressesHelper
  def google_maps_url(address) # https://www.google.com/maps/preview#!q=34+Brookcliff+Dr%2C+Asheville%2C+NC
    "https://www.google.com/maps/preview#!q=#{address.location_string}"
  end
end
