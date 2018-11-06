class MoviesController < ApplicationController

  def index
  end

  def show
  end

  def create
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end

end
