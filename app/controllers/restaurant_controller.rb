class RestaurantController < ApplicationController
  before_action :check_admin, only: %i(create destroy edit update)
  def index
    if params[:name]
      if params[:category] == '0'
        @all_res = Restaurant.has_deadline.where('name LIKE ? or address LIKE ?',
            "%#{params[:name]}%", "%#{params[:name]}%").paginate(:page => params[:page], :per_page => 5)
      else
        @all_res = Restaurant.has_deadline.where('category_id = ? and (name LIKE ? or address LIKE ?)',
            "#{params[:category]}", "%#{params[:name]}%", "%#{params[:name]}%").paginate(:page => params[:page], :per_page => 5)
      end
    else
      @all_res = Restaurant.has_deadline.all.asc.paginate(:page => params[:page], :per_page => 5)
    end

    @all_cate = Category.all

  end

  def show
    @res = Restaurant.find_by(id: params[:id])
    @foods = @res.foods.all
    @res_imgs = @res.res_images.all
    @res_comments = @res.comments.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def create
    @restaurant = Category.find(rand(1..5)).restaurants.build(restaurant_params)
    @restaurant.deadline = Time.now
    if @restaurant.save
      params[:image]['image'].each do |a|
          @res_images = @restaurant.res_images.create!(:image => a)
       end
      flash[:success] = "Create new restaurant is successfully!"
      redirect_to admin_restaurant_list_path
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.destroy!
    flash[:success] = "destroy successfully!"
    redirect_to request.referrer || admin_root_path
  end

  def edit
    @restaurant = Restaurant.find_by(id: params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.update_attributes(restaurant_params)
    flash[:success] = "Update success!"
    redirect_to admin_restaurant_list_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :description,
                    image_attributes: [:id, :restaurant_id, :image])
  end

  def check_admin
    if !admin_signed_in?
      flash[:error] = "Login to access this page! Please!"
      redirect_to new_admin_session_path
    end
  end
end
