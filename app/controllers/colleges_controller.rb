class CollegesController < ApplicationController


  def index
    @colleges = College.all
  end

  # NOT IN USE  
  # def select
  #   if params[:college_id] && @college = College.find_by_id(params[:college_id])
  #     session[:college_id] = @college.id
  #     redirect_to ads_path
  #   else
  #     session[:college_id] = nil
  #     flash[:warning] = "Dang, try picking a college again."
  #     redirect_to colleges_path
  #   end
  # end


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
