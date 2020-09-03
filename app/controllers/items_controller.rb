class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :edit, :update, :show]

  def index
    @items = Item.all.order("created_at DESC")
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

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render 'edit'
    end
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image,:product,:discription,:price,:category_id,:product_condition_id,:shipping_fee_burde_id,:shipping_region_id,:days_until_shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
