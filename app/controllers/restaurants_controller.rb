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

end
