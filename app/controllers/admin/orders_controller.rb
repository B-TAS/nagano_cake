class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @customer = @order.customer
    @order_details = OrderDetail.all
  end

  # private

  # def customer_params
  #   params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postcode, :address, :phone_number, :email, :is_deleted)
  # end
end
