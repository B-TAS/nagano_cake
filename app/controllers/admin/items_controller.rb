class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private
  def item_params
    params.require(:list).permit(:name, :introduction, :genre_id, :genre_id, :price, :is_active)
  end
end
