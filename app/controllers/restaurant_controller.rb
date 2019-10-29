class RestaurantController < ApplicationController
  def index
    @all_res = Restaurant.all.asc
  end

  def show
    @res = Restaurant.find_by(id: params[:id])
  end
end
