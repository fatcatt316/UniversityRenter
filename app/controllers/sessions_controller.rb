class SessionsController < ApplicationController

  def new
  end
  
  
  def create
    # TODO: csrf_token was getting cleared out.  Find a better way to do this.
    csrf_token = session[:_csrf_token]
    user = login(params[:email], params[:password], params[:remember_me])
    session[:_csrf_token] = csrf_token
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
      format.js
    end
  end
end
