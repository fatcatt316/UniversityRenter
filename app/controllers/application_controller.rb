class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :setup_side_menu_items

  helper_method :current_college  
  
  def current_college
    if @current_college.blank?
      session[:college_id] = params[:college_id] if params[:college_id].present?
      @current_college = College.find_by_id(session[:college_id]) if session[:college_id].present?
    end
    return @current_college
  end
  
  
  # Used to redirect links that were to the old, static UniversityRenter (such as universityrenter.com/ncsu, or universityrenter.com/ncsu/averyClose)
  def legacy_redirect
    community = Community.where("lower(legacy_url) = ?", params[:legacy_community_name].to_s.downcase).first
    
    if community
      redirect_to community, status: 301
    elsif college = College.where("lower(short_name) = ?", params[:legacy_college_name].to_s.downcase).first
      redirect_to college, status: 301
    else
      flash[:notice] = "The link you clicked is out of date!  We couldn't figure out where you wanted to go..."
      redirect_to listings_url, status: 301
    end
  end
  
  # Override this action as needed in controllers.
  def setup_side_menu_items
    @site_menu_items ||= []
  end
  
  
  private
  
  
  def require_user
    unless current_user
      flash[:notice] = "You must be logged in to access this page"
      return redirect_to listings_url
    end
  end
  
  
  def admin_only
    unless current_user && current_user.admin?
      flash[:notice] = "This page is not meant for you"
      return redirect_to listings_url
    end
  end
end