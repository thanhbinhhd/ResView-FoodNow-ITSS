class RestaurantController < ApplicationController
  def index
    if params[:name]
      @all_res = Restaurant.where('name LIKE ?', "%#{params[:name]}%")
    else
      @all_res = Restaurant.all.asc
    end

  end

  def show
    @res = Restaurant.find_by(id: params[:id])
    @foods = @res.foods.all
    @res_imgs = @res.res_images.all
    @res_comments = @res.comments.paginate(:page => params[:page], :per_page => 5)
  end
  
  def create
    @restaurant = Restaurant.create(restaurant_params)
    if @restaurant.save
      redirect_to admin_root_path # todo admin root
    end
  end
  
  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy!
    redirect_to request.referrer || admin_root_path
  end
  
  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end
  
  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.update_attributes(restaurant_params)
  end
  
  
  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description)
  end
end
