class Public::HomesController < ApplicationController
  def top
    @items = Item.all.order(created_at: :desc)
    @genre = Genre.all
  end

  def about
  end
end
