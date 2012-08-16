class AddressesController < ApplicationController
  
  
  def select_state
    @colleges = College.search(:state_id => params[:state_id]).all
    
    respond_to do |format|
      format.js { render :locals => { :state_id => params[:state_id] } }
    end
  end
  
  
  def select_city
    @colleges = College.search(:state_id => params[:state_id], :city => params[:city]).all
  end
  
  
  def get_city_and_state
    postal_result = params[:zip_code].blank? ? {} : PostalCodeLookup.usps_lookup(params[:zip_code])
    state = State.find_by_abbreviation(postal_result[:state]) if postal_result

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
