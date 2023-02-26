class Public::ItemsController < ApplicationController

  def index
    @items = Item.all.page(params[:page]).per(8)
    @genre = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new(item_id: @item.id)
    @genre = Genre.all
  end
end
