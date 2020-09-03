class TransactionsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @transaction = TransactionAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @transaction = TransactionAddress.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
      return redirect_to root_path
    else
      render 'index'
    end
  end
 
  private
 
  def transaction_params
    params.permit(:token, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_9e7575041fbd3a09dbcc76b3"
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end
end
