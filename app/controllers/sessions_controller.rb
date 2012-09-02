class SessionsController < ApplicationController

  def new
  end
  
  
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    
    respond_to do |format|
      if user
        format.html { redirect_back_or_to root_url, :notice => "Logged in!" }
        
        ## TODO: Get this part to work!
        format.js do
          render :update do |page|
            page << "jQuery('#absent_user').html('<strong>You\'re logged in and good to go!</strong>');"
            page << "jQuery('#not_signed_in_warning').hide();"
            page.replace_html('upper_login', :partial => 'sessions/form')
          end
        end
      else
        format.html {
          flash.now[:warning] = "Email or password was invalid."
          render :new
        }
        format.js do
          render :update do |page|
            page << "jQuery('#login_error_message').show().html('Email or password was invalid.');"
          end
        end
      end
    end
  end
  
  
  def destroy
    logout
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Logged out!" }
      format.js do
        render :update do |page|
          page.replace_html('upper_login', :partial => 'sessions/form')
        end
      end
    end
  end
end
