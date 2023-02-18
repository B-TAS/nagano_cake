class Admin::GenresController < ApplicationController
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to repuest.referer
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private
  
end
