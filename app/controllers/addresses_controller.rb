class AddressesController < ApplicationController
  
  def get_city_and_state
    @postal_result = params[:zip_code].blank? ? {} : PostalCodeLookup.usps_lookup(params[:zip_code])
    @state = State.find_by_abbreviation(@postal_result[:state]) if @postal_result
  end
end
