class ListingsController < ApplicationController
  before_filter :require_user, only: [:edit, :update, :destroy]
  
  def index
    filter = {}
    filter[:college_id] = current_college.try(:id)
    
    @colleges = College.order(:name).all if current_college.blank?
    @listings = Listing.search(filter).paginate(:page => (params[:page] || 1), :per_page => 20)
    
    respond_to do |format|
      format.html # index.html.erb
      format.js {
        render :update do |page|
          page.replace_html 'listings_list', :partial => 'listings/list', :locals => {:listings => @listings}
        end
      }
    end
  end


  def show
    @listing = Listing.find_by_id(params[:id])
    @map = @listing.address.blank? ? nil : @listing.address.to_gmaps4rails do |address, marker|
      marker.infowindow render_to_string(:partial => "/addresses/marker_infowindow", :locals => { :address => address })
    end
  end


  def new
    params[:listing] ||= {}
    params[:listing][:contact_email] ||= current_user.email if current_user
    params[:listing][:available_on] ||= Date.today
    
    @listing = Listing.new(params[:listing])
    @listing.build_address
    @user = User.new if current_user.blank?
  end


  def edit
    @listing = Listing.find(params[:id])
    unless @listing.editable?(current_user)
      flash[:warning] = "Whoops, looks like you can't edit that ad!"
      return redirect_to listings_path
    end
    @listing.build_address unless @listing.address
  end


  def create
    @listing = Listing.new(params[:listing])
    @listing.ad_status = current_user.present? ? AdStatus.find_by_name("Approved") : AdStatus.find_by_name("Pending")
    @listing.creator = current_user
    
    if @listing.save
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @listing.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Listing was successfully created.'
      flash[:notice] += ' Since you weren\'t signed in, your ad will need to be approved before it shows up.' if current_user.blank?
      redirect_to college_listings_path(@listing.college)
    else
      @user = User.new if current_user.blank?
      @listing.build_address unless @listing.address
      render :action => "new"
    end
  end


  def update
    @listing = Listing.find(params[:id])
    unless @listing.editable?(current_user)
      flash[:warning] = "Whoops, looks like you can't edit that ad!"
      return redirect_to listings_path
    end
    
    params[:feature_ids] ||= {} # TODO: Better way to do this
    if @listing.update_attributes(params[:listing])
      @listing.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Listing was successfully updated.'
      redirect_to college_listing_path(@listing.college, @listing)
    else
      render :action => "edit"
    end
  end


  def destroy
    @listing = Listing.find_by_id(params[:id])
    if @listing && @listing.destroyable?(current_user)
      @listing.destroy
    else
      flash[:warning] = "Whoa now, you can't be deleting that."
    end
    redirect_to(listings_url)
  end
end
