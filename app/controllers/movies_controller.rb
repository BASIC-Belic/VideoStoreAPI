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
    movie = Movie.find_by(id: params[:id])
    if movie
      render json: jsonify(movie)
    else
      # render json: {}, status: :not_found
      render_error(:not_found, { movie_id: ["no such movie"] })
    end
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
    return movie_data.as_json(only: [:title, :overview, :release_date, :inventory, :movies_checked_out_count])
  end

  def movie_params
    params.permit(:title, :release_date, :overview, :inventory)
  end

end
