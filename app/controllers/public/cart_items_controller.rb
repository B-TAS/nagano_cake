class Public::CartItemsController < ApplicationController

  def index
    @cart_items = CartItem.all
  end

  def create
    @add_item = CartItem.new(cart_item_params)
    @add_item.save!
    redirect_to cart_item_path
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
