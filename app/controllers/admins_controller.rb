class AdminsController < ApplicationController
  layout 'admin_application'

  before_action :check_login, only: [:home]
  def home
      @all_res = Restaurant.all.asc
      @restaurant = Restaurant.new
  end

  def users
    @users = User.all
    render "admins/user_list"
  end

  def transactions
    @transactions = Transaction.all
    render "admins/transaction_list"
  end
  private

  def check_login
    redirect_to new_admin_session_path unless admin_signed_in?
  end
end
