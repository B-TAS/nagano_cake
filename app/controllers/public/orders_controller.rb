class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def create

  end

  def show
  end

  def confirm
    @order = Order.new(order_params)
    @address = Delivery.find(params[:order][:address_id])
    @order.postcode = @address.postcode
    @order.address = @address.address
    @order.name = @address.name
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :name)
  end


end
