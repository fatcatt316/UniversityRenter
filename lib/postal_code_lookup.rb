require 'uri'
require 'net/http'
require 'rexml/document'

class PostalCodeLookup

  def self.usps_lookup(postal_code)
    begin
      
      base = "http://production.shippingapis.com/ShippingAPI.dll?"
      svc  = "API=CityStateLookup&XML=" 
      xml  = '<CityStateLookupRequest USERID="417SCIME1006"><ZipCode ID="0"><Zip5>' + postal_code + '</Zip5></ZipCode></CityStateLookupRequest>'
      url  = base + svc + URI::encode(xml)
      
      resp = Net::HTTP.get_response(URI.parse(url)).body      
      doc  = REXML::Document.new(resp)
      
      city = doc.elements['CityStateLookupResponse/ZipCode/City']
      state = doc.elements['CityStateLookupResponse/ZipCode/State']

      return { :postal_code => postal_code, 
               :city        => city.text.titleize,
               :state       => state.text}
    rescue StandardError => se
      # NOOP - error with web service or possible no match
      return nil
    rescue Interrupt => i
      # NOOP - web service times out - not a StandardError
      return nil
    end
  end
  
end