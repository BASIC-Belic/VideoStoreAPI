class ApplicationController < ActionController::API

  def render_errors(status,errors)
    render json: {errors: errors }, status: status
  end

  #helper method to find movie for seed and in general 
  def self.find_available_movie
    return Movie.find{ |m| m.calculate_available > 0 }
  end
end
