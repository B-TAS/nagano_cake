class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Book.new(item_params)
    if @item.save
      flash[:notice] = "投稿成功！successfully !"
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(@item_params)
      flash[:notice] = "更新成功！successfully !"
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:list).permit(:name, :introduction, :genre_id, :genre_id, :price, :is_active)
  end
end
