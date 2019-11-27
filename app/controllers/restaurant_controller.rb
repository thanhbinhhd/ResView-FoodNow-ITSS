class RestaurantController < ApplicationController
  before_action :check_admin, only: %i(create destroy edit update)
  def index
    if params[:name]
      @all_res = Restaurant.has_deadline.where('name LIKE ? or address LIKE ?', "%#{params[:name]}%", "%#{params[:name]}%")
    else
      @all_res = Restaurant.has_deadline.all.asc
    end

  end

  def show
    @res = Restaurant.find_by(id: params[:id]).has_deadline
    @foods = @res.foods.all
    @res_imgs = @res.res_images.all
    @res_comments = @res.comments.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    @restaurant.deadline = Time.now
    if @restaurant.save
      redirect_to admin_root_path
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

  def check_admin
    if !admin_signed_in?
      redirect_to new_admin_session_path
    end
  end
end
