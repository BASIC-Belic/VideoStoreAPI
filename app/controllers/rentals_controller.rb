class RentalsController < ApplicationController

  def create
    movie = Movie.find_by(id: rental_params[:movie_id].to_i)
    customer = Customer.find_by(id: rental_params[:customer_id].to_i)

    rental = Rental.new(customer: customer, movie: movie)

    if rental.save
      render json: { id: rental.id }
    else
      render_errors(:bad_request, rental.errors.messages)
    end
  end

  private

  def rental_params
    params.permit(:movie_id, :customer_id)
  end
end
