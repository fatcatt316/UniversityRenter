class SessionsController < ApplicationController

  def new
  end
  
  
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    
    respond_to do |format|
      format.html do
        if user
          redirect_back_or_to root_url, notice: "Logged in!"
        else
          flash.now[:warning] = "Wrong email or password."
          render :new
        end
      end
      format.js
    end
  end
  
  
  def destroy
    logout
    respond_to do |format|
      format.html { redirect_to root_url, notice: "Logged out!" }
      format.js do
        render :update do |page|
          page.replace_html('upper_login', partial: 'sessions/form')
        end
      end
    end
  end
end
