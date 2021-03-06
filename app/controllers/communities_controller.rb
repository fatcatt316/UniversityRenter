class CommunitiesController < ApplicationController
  before_filter :admin_only, except: [:index, :show, :contact, :send_email, :update_dropdown]

  def index
    if current_college
      @communities = Community.where(college_id: current_college.id).order(:name).all
    else
      @communities = Community.joins(:college).order("colleges.name ASC, communities.name ASC").all
    end
  end


  def show
    @community = Community.find(params[:id])
    @map = @community.address.blank? ? nil : @community.address.to_gmaps4rails do |address, marker|
      marker.infowindow render_to_string(partial: "/addresses/marker_infowindow", locals: { address: address })
    end
  end
  
  
  def contact
    @community = Community.find(params[:id])
  end
  
  
  def send_email
    ## Add on "From UniversityRenter" to the subject, and add a link in the body to UR
    @community = Community.find(params[:id])
    CommunityMailer.email_community(@community, params[:from], params[:subject], params[:body]).deliver
  end
  
  
  # Ajax action
  def update_dropdown
    @college = College.find_by_id(params[:college_id])
  end


  def new
    @community = Community.new
    @community.build_address
  end


  def edit
    @community = Community.find(params[:id])
    @community.address ||= @community.build_address
  end


  def create
    @community = Community.new(community_params)

    if @community.save
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @community.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Community was successfully created.'
      redirect_to college_community_url(@community.college, @community)
    else
      render action: :new
    end
  end


  def update
    @community = Community.find(params[:id])

    if @community.update_attributes(community_params)
      params[:feature_ids] ||= {} # TODO: Better way to do this
      @community.update_features(params[:feature_ids].keys)
      flash[:notice] = 'Community was successfully updated.'
      redirect_to college_community_url(@community.college, @community)
    else
      @community.address ||= @community.build_address
      render action: :edit
    end
  end


  def destroy
    @community = Community.find(params[:id])
    @community.destroy

    redirect_to(communities_url)
  end
  
  private
  
    def community_params
      if current_user.try(:admin?)
        params.require(:community).permit!
      end
    end
end
