class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path    
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :type_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipdate_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

end
