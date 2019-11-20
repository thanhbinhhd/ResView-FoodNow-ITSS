class FoodsController < ApplicationController
  def destroy
    @food  = Food.find_by(id: params[:id])
    @food.destroy!
    redirect_to admin_food_list_path
  end

  def show
    @food = Food.find_by(id: params[:id])
    render json: {data: @food}
  end

  def create
    @food = Restaurant.find_by(id: params[:food][:restaurant_id]).foods.build
    @food.name = params[:food][:name]
    @food.price = params[:food][:price]
    @food.image = params[:food][:image]
    @food.save!
    redirect_to admin_food_list_path
  end

  def update
    @food = Food.find_by(id: params[:id])
    @food.update_attribute(:name, params[:name])
    @food.update_attribute(:price, params[:price])
    render json: {data: @food}
  end

end
