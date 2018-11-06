class MoviesController < ApplicationController

  def index
    movies = Movie.all

    if movies
      render json: jsonify(movies), status: :ok
    else
      render_errors(:not_found, { movies: ["No movies found."]})
    end
  end

  def show
  end

  def create
    movie = Movie.new(movie_params)
    
    if movie.save
      render json: { id: movie.id }
    else
      render_errors(:bad_request, movie.errors.messages)
    end
  end

  private

  def jsonify(movie_data)
    return movie_data.as_json(only: [:title, :overview, :release_date, :inventory])
  end

  def movie_params
    params.require(:movie).permit(:title, :release_date, :overview, :inventory)
  end

end
