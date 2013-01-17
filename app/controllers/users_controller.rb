class UsersController < ApplicationController
  before_filter :admin_only, except: [:signup, :finalize_signup]
  before_filter :require_user, except: [:signup, :finalize_signup, :edit, :update]
  
  def index
    @users = User.order(:email).paginate(:page => (params[:page] || 1), :per_page => 20)
  end
  
  
  def signup
    @user = User.new
  end


  def finalize_signup
    @user = User.new(params[:user])
    
    respond_to do |format|
      if verify_recaptcha(:model => @user, :message => "Incorrect captcha message") && @user.save
        auto_login(@user)
        format.html { redirect_to root_url, :notice => "You're logged in and good to go!" }
      else
        format.html { render :signup, :warning => "Please fix your errors!" }
      end
      format.js
    end
  end
  
  
  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, :notice => "User created!"
    else
      render :new, :warning => "Dangit, fix your errors!"
    end
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  
  def edit
    @user = User.find(params[:id])
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      render :action => "edit"
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to(users_url)
  end
end
