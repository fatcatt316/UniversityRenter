class UsersController < ApplicationController
  before_filter :admin_only, except: [:signup, :finalize_signup]
  before_filter :require_user, except: [:signup, :finalize_signup, :edit, :update]
  
  def index
    @users = User.order(:email).paginate(page: (params[:page] || 1), per_page: 20)
  end
  
  
  def signup
    @user = User.new
  end


  def finalize_signup
    @user = User.new(user_params)
    
    respond_to do |format|
      if @user.save
        auto_login(@user)
        format.html { redirect_to root_url, notice: "You're logged in and good to go!" }
      else
        format.html do
          flash.now[:warning] = "Please fix your mistakes!<br>#{@user.errors.full_messages.join('<br>')}"
          render :signup
        end
      end
      format.js
    end
  end
  
  
  def new
    @user = User.new
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: "User created!"
    else
      render :new, warning: "Dangit, fix your errors!"
    end
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  
  def edit
    @user = User.find(params[:id])
    unless @user.editable?(current_user)
      flash[:warning] = "Hey now, you can't edit that person!"
      return redirect_to listings_url
    end
  end
  
  
  def update
    @user = User.find(params[:id])
    unless @user.editable?(current_user)
      flash[:warning] = "Hey now, you can't edit that person!"
      return redirect_to listings_url
    end
    if @user.update_attributes(user_params)
      flash[:notice] = 'User was successfully updated.'
      redirect_to(@user)
    else
      render action: "edit"
    end
  end


  def destroy
    @user = User.find(params[:id])
    unless current_user.admin?
      flash[:warning] = "Hey now, you can't edit that person!"
      return redirect_to listings_url
    end
    @user.destroy

    redirect_to(users_url)
  end
  
  private
  
    def user_params
      if current_user.try(:admin?)
        params.require(:user).permit!
      else
        params.require(:user).permit(:gender_id, :email, :remember_me_token, :password, :password_confirmation, :full_name)
      end
    end

end
