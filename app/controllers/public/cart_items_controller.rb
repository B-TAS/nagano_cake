class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.deatroy
    redirect_to request.referer
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to request.referer
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end

end
