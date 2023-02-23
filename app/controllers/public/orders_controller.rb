class Public::OrdersController < ApplicationController
  def index
    @orders   = Order.all
    @catr_items = Cart_items.find(params[:id][:item_id])
    @current_cart_items =
  end

  def show

  end

  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
  end
end
