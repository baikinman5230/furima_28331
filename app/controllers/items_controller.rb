class ItemsController < ApplicationController
  def index
    
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

  private

  def item_params
    params.permit(:image,:product,:discription,:price,:category_id,:product_condition_id,:shipping_fee_burde_id,:shipping_region_id,:days_until_shipping_id)
  end
end
