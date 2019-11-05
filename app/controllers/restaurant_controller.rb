class RestaurantController < ApplicationController
  def index
    @all_res = Restaurant.all.asc
  end

  def show
    @res = Restaurant.find_by(id: params[:id])
    @foods = @res.foods.all
    @res_imgs = @res.res_images.all
    @res_comments = @res.comments.paginate(:page => params[:page], :per_page => 5)
  end
end
