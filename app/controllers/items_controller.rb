class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image,:product,:discription,:price,:category_id,:product_condition_id,:shipping_fee_burde_id,:shipping_region_id,:days_until_shipping_id).merge(user_id: current_user.id)
  end
end
