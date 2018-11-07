class ApplicationController < ActionController::API

  def render_errors(status,errors)
    render json: {errors: errors }, status: status
  end

  #helper method to find movie for seed and in general
  def self.find_available_movie
    return Movie.find do |m| m.available_inventory > 0
    end
  end
end
