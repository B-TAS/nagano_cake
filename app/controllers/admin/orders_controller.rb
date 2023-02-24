class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

   def update
    @order = Order.find(params[:id])
    @order.update(order_params)
  end

  private

  def order_params
  params.require(:order).permit(:status, order_details_attributes: [:making_status, :id])
  end
end