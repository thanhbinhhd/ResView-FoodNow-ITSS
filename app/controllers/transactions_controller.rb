class TransactionsController < ApplicationController
  layout 'admin_application', only: [:new]

  def new
    @restaurants = Restaurant.all
  end

  def create
    @tran = Restaurant.find_by(id: params[:transaction][:restaurant_id]).transactions.build
    @tran.price = params[:transaction][:price].to_f
    @tran.save!
    redirect_to admin_transaction_list_path
  end
end
