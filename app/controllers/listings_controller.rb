class ListingsController < ApplicationController
  
  def index
    params[:search] ||= {}
    params[:search][:college_id_eq] ||= session[:college_id] if session[:college_id]
    
    if session[:college_id] != params[:search][:college_id_eq]
      session[:college_id] = params[:search][:college_id_eq]
      @current_college = College.find_by_id(params[:search][:college_id_eq]) unless params[:search][:college_id_eq].blank?
    end
    
    
    # @listings_search = Listing.all(params[:search])
    # @listings = @listings_search.paginate(:page => params[:page] || 1, :per_page => 2)
    @listings = Listing.paginate(:per_page => 2, :page => params[:page])
    
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
    @map = @listing.address.try(:map)
  end


  def new
    @listing = Listing.new(params[:listing])
    @listing.build_address
  end


  def edit
    @listing = Listing.find(params[:id])
    @listing.build_address unless @listing.address
  end


  def create
    @listing = Listing.new(params[:listing])

    ### TODO: AdStatus

    if @listing.save
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @listing.update_features(params[:feature_ids])
      flash[:notice] = 'Listing was successfully created.'
      redirect_to(@listing)
    else
      @listing.build_address unless @listing.address
      render :action => "new"
    end
  end


  def update
    @listing = Listing.find_by_id(params[:id])    
    
    params[:feature_ids] ||= {} # TODO: Better way to do this

    if @listing.update_attributes(params[:listing])
      @listing.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Listing was successfully updated.'
      redirect_to(@listing)
    else
      render :action => "edit"
    end
  end


  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to(listings_url)
  end
end
