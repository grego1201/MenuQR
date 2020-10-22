class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    @restaurant.save
    redirect_to @restaurant
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params['restaurant'].permit('name'))

    redirect_to restaurants_path
  end

  private

   def restaurant_params
     params.require(:restaurant).permit(:name)
   end
end
