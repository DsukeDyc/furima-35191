class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :type_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipdate_id, :price, :user_id)
  end
end
