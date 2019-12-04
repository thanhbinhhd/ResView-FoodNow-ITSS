class TransactionsController < ApplicationController
  layout 'admin_application', only: [:new]

  def new
    @restaurants = Restaurant.all
  end

  def create
    @res = Restaurant.find_by(id: params[:transaction][:restaurant_id])
    @tran = @res.transactions.build
    @tran.price = params[:transaction][:price].to_f
    @tran.save!
    if @res.deadline < Time.now
      deadline = @tran.created_at
    else
      deadline = @res.deadline
    end

    case @tran.price
    when 100000
      deadline += 1.months
    when 200000
      deadline += 3.months
    when 350000
      deadline += 6.months
    end
    @res.update_attributes(deadline: deadline)
    flash[:success] = "Create transaction successfully!"
    redirect_to admin_transaction_list_path
  end
end
