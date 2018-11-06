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
  end

  private

    def jsonify(movie_data)
      return movie_data.as_json(only: [:title, :overview,  :release_date, :inventory, ])
    end
  def movie_params
    params.require(:movie).permit(:title)
  end

end
