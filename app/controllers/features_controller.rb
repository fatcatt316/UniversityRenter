class FeaturesController < ApplicationController

  def index
    @features = Feature.all
  end


  def show
    @feature = Feature.find(params[:id])
  end


  def new
    @feature = Feature.new
  end


  def edit
    @feature = Feature.find(params[:id])
  end


  def create
    @feature = Feature.new(params[:feature])

    if @feature.save
      redirect_to(@feature, :notice => 'Feature was successfully created.')    
    else
      render :action => "new"
    end
  end


  def update
    @feature = Feature.find(params[:id])

    if @feature.update_attributes(params[:feature])
      redirect_to(@feature, :notice => 'Feature was successfully updated.')
    else
      render :action => "edit"
    end
  end


  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy
    redirect_to(features_url)
  end
end
