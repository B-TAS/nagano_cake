class Admin::OrderDetailsController < ApplicationController

def update
  @order_detail = OrderDetail.find(params[:id])
  @order = @order_detail.order

  if @order_detail.update(order_detail_params)
    @order.update(status: 2) if @order_detail.making_status == "in_production"

    @order_details = @order.order_details.reload
    if @order_details.all? { |detail| detail.making_status == "production_complete" }
      @order.update(status: 3)
    end
  end

  redirect_to admin_order_path(@order)
end


  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
