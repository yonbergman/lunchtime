class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all

    respond_to do |format|
      format.html
      format.json { render :json => @restaurants }
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])
    if @restaurant.save
      respond_to do |format|
          format.html { redirect_to restaurants_path }
          format.json { render :json => @restaurants }
      end
    else
      respond_to do |format|
          format.html { render :action => "new" }
          format.json { render :json => {:errors => @restaurants.errors} }
      end
    end
  end

  ## PUT /babies/1
  #def update
  #  @baby = Baby.find(params[:id])
  #  if @baby.update_attributes(params[:baby])
  #    redirect_to(@baby, :notice => 'Baby was successfully updated.')
  #  else
  #    render :action => "edit"
  #  end
  #end

end
