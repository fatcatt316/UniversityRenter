class CollegesController < ApplicationController
  before_filter :admin_only, :except => [:index, :show, :select]

  def index
    @colleges = College.all
  end

  # NOT IN USE  
  def select
    college              = College.find_by_id(params[:id])
    session[:college_id] = college.try(:id)    
    flash[:warning]      = "Dang, try picking a college again." if college.blank?
    redirect_to listings_path
  end


  def show
    @college = College.find(params[:id])
  end


  def new
    @college = College.new
    @college.build_address
  end


  def edit
    @college = College.find(params[:id])
    @college.address ||= @college.build_address
  end


  def create
    @college = College.new(params[:college])

    if @college.save
      flash[:notice] = 'College was successfully created.'
      redirect_to(@college)
    else
      @college.build_address
      render :action => "new"
    end
  end


  def update
    @college = College.find(params[:id])
    if @college.update_attributes(params[:college])
      flash[:notice] = 'College was successfully updated.'
      redirect_to(@college)
    else
      render :action => "edit"
    end
  end

  # TODO: Admin only
  def destroy
    @college = College.find(params[:id])
    @college.destroy

    redirect_to(colleges_url)
  end
end
