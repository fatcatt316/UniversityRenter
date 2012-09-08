class CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end


  def show
    @community = Community.find(params[:id])
    @map = @community.address.blank? ? nil : @community.address.to_gmaps4rails do |address, marker|
      marker.infowindow render_to_string(:partial => "/addresses/marker_infowindow", :locals => { :address => address })
    end
  end
  
  
  # Ajax action
  def update_dropdown
    college = College.find_by_id(params[:college_id])

    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html('community_dropdown', :partial => 'dropdown', 
            :locals => {:college => college, :search_box => params[:search_box]} )
        end
      }
    end    
  end


  def new
    @community = Community.new(params[:community])
    @community.build_address
  end


  def edit
    @community = Community.find(params[:id])
    @community.address ||= @community.build_address
  end


  def create
    @community = Community.new(params[:community])

    if @community.save
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @community.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Community was successfully created.'
      redirect_to(@community)
    else
      @community.build_address
      render :action => "new"
    end
  end


  def update
    @community = Community.find(params[:id])

    if @community.update_attributes(params[:community])
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @community.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Community was successfully updated.'
      redirect_to(@community)
    else
      @community.address ||= @community.build_address
      render :action => "edit"
    end
  end


  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    redirect_to(communities_url)
  end
end
