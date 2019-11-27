class AdminsController < ApplicationController
  layout 'admin_application'

  before_action :check_login

  def dashboards
    render "admins/dashboard"
  end

  def restaurants
      @all_res = Restaurant.all.asc
      @restaurant = Restaurant.new
      render "admins/restaurant_list"
  end

  def users
    @users = User.all
    render "admins/user_list"
  end

  def transactions
    @transactions = Transaction.all
    render "admins/transaction_list"
  end

  def foods
    @restaurants = Restaurant.all
    @foods = Food.all
    @food = Food.new
    render "admins/food_list"
  end

  private

  def check_login
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
