class RentalsController < ApplicationController

  def create

    movie = Movie.find_by(id: rental_params[:movie_id].to_i)
    customer = Customer.find_by(id: rental_params[:customer_id].to_i)

    rental = Rental.new( customer: customer, movie: movie )

    if rental.save
      rental.update(postal_code: customer.postal_code)
      rental.update(checked_out: true)
      render json: { id: rental.id, checked_out: rental.checked_out }
    else
      render_errors(:bad_request, rental.errors.messages)
    end
  end

  def update
    rental = Rental.find_by(rental_params)

    if rental
      rental.update(checked_out: false)
      render json: { id: rental.id, checked_out: rental.checked_out }
    else
      render_errors(:not_found, { rental: ["Rental not found."]})
    end
  end

  private

  def rental_params
    params.permit(:movie_id, :customer_id)
  end
end
