class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_college  
  
  def current_college    
    @current_college ||= College.find_by_id(session[:college_id]) if session[:college_id].present?
    return @current_college
  end
  
  
  private
  
  
  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      return redirect_to listings_path
    end
  end
  
  
  def admin_only
    unless current_user && current_user.admin?
      flash[:notice] = "This page is not meant for you"
      return redirect_to listings_path
    end
  end
  
  # def not_authenticated
  #   redirect_to login_url, :alert => "First log in to view this page."
  # end
end
