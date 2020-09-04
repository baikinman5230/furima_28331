class TransactionsController < ApplicationController
  before_action :move_to_index

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: transaction_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    unless current_user.id != @item.user_id
      redirect_to root_path
    end
    unless @item.item_purchase == nil
      redirect_to root_path
    end
  end
end
