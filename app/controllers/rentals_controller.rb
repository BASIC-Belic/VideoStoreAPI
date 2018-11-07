class RentalsController < ApplicationController

  def create
    movie = Movie.find_by(id: rental_params[:movie_id].to_i)
    customer = Customer.find_by(id: rental_params[:customer_id].to_i)

    # this first case might not be necessary bc the error messages would prevent saving a duplicate
    # if movie && customer
    #   rental = Rental.find_by(customer: customer, movie: movie)
    if customer
      rental = Rental.new( customer: customer, movie: movie, postal_code: customer.postal_code )
    else
      rental = Rental.new( customer: customer, movie: movie )
    end

    if rental.save
      rental.update(checked_out: true)
      render json: { id: rental.id }
    else
      render_errors(:bad_request, rental.errors.messages)
    end
  end

  def update
    rental = Rental.find_by(rental_params)

    if rental
      rental.update(checkout_out: false)
      render json: { id: rental.id }
    else
      render_errors(:not_found, { rental: ["Rental not found."]})
    end
  end

  private

  def rental_params
    params.permit(:movie_id, :customer_id)
  end
end
