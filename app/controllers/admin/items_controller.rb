class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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

  def destroy #テスト用
    @item = Item.find(params[:id])
    item.destroy
    flash[:notice] = "削除成功！successfully !"
    redirect_to '/index'
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :genre_id, :genre_id, :price, :is_active)
  end
end
