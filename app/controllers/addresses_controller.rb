class AddressesController < ApplicationController
  # AJAX ACTIONS
  def get_city_and_state
    postal_result = params[:zip_code].blank? ? {} : PostalCodeLookup.usps_lookup(params[:zip_code])
    state = postal_result.nil? ? nil : State.find_by_abbreviation(postal_result[:state])

    respond_to do |format|
      format.js {
        id = params[:div_id]
        render :update do |page|
          page << "div = document.getElementById('zip_#{id}');"
          page << "div.value = '#{params[:zip_code]}';"
          if postal_result
            page << "document.getElementById('city_#{id}').innerHTML = '#{postal_result[:city]}';"
            page << "document.getElementById('#{id}_city').value = '#{postal_result[:city]}';"
          end
          if state
            page << "document.getElementById('state_#{id}').innerHTML = '#{postal_result[:state]}';"
            page << "document.getElementById('#{id}_state_id').value = '#{state.id}';"            
          end
        end
      }
    end
  end
end
