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

  # PUT /features/1
  # PUT /features/1.xml
  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to(@feature, :notice => 'Feature was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /features/1
  # DELETE /features/1.xml
  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to(features_url) }
      format.xml  { head :ok }
    end
  end
end
