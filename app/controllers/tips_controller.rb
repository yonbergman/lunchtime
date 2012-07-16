class TipsController < ApplicationController
  before_filter :load_restaurant

  def index
    @tips = @restaurant.tips

    respond_to do |format|
      format.html
      format.json { render :json => @tips }
    end
  end

  def create
    @tip = @restaurant.tips.build(params[:tip])
    if @tip.save
      respond_to do |format|
          format.html { redirect_to restaurants_path }
          format.json { render :json => @tip }
      end
    else
      respond_to do |format|
          format.html { render :action => "new" }
          format.json { render :json => {:errors => @tip.errors} }
      end
    end
  end

  private

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
