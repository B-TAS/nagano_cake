class Public::OrdersController < ApplicationController
  def index
    @orders   = Order.all
    @catr_items = Cart_items.find(params[:id][:item_id])
  end

  def show

  end


  def new
    @order = Order.new
    @addresses = Delivery.where(customer_id: current_customer.id)
  end

  def index
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_details = order.order_details.new
      order_details.item_id = cart_item.item_id
      order_details.amount = cart_item.amount
      order_details.price = (cart_item.item.price * 1.1).to_i
      order_details.making_status = "not_make"
      order_details.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
  end

  def show
  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      # ご自身の住所
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:select_address] == "1"
      # 登録済の配送先
      @address = Delivery.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.name = @address.name
    end
  end

  private

  def order_params
    params.require(:order).permit(:order_method, :postcode, :address, :name, :status, :total_price, :postage)
  end
end
