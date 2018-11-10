require "test_helper"

describe RentalsController do

  before do
    @customer = customers(:one)
    @movie = movies(:four)
    @checked_out_rental = rentals(:RentalOne)
  end

  RENTAL_PARAMS = %w(movie_id customer_id).sort!

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  let(:create_rental_params){
    {
      customer_id: @customer.id,
      movie_id: @movie.id
    }
  }

  let(:existing_rental_params){
    {
      customer_id: @checked_out_rental.id,
      movie_id: @checked_out_rental.id
    }
  }

  describe 'create' do

    it 'creates a new rental given valid data' do
      expect {
        post checkout_rental_path, params: create_rental_params
      }.must_change 'Rental.count', 1

      body = check_response(expected_type: Hash)

      expect(body.keys).must_include "id"
      expect(body.keys).must_include "checked_out"
      expect(body["checked_out"]).must_equal true
      expect(Rental.last.id).must_equal body["id"]
    end

    it 'returns an error for invalid rental data' do
      invalid_rental_params = { customer_id: nil, movie_id: @movie.id }

      expect{
        post checkout_rental_path, params: invalid_rental_params
      }.wont_change 'Rental.count'

      body = check_response(expected_type: Hash, expected_status: :bad_request)
      expect(body).must_include "errors"
      # expect(body["errors"]).must_include "movie"
      expect(body["errors"]).must_include "customer"
      expect(Rental.last.id).wont_equal body["id"]
    end
  end

  # patch 'rentals/check-in', to: 'rentals#update', as: 'checkin_rental'

  describe 'update' do

    it 'updates checked_out to false given exiting rental data' do
      # expect{
      #   post checkin_rental_path, params: existing_rental_params
      # }.wont_change 'Rental.count'
      #
      #
      # body = check_response(expected_type: Hash)
      #
      # expect(body.keys).must_include "id"
      # expect(body.keys).must_include "checked_out"
      # expect(body["checked_out"]).must_equal false
      # expect(@checked_out_rental.id).must_equal body["id"]

    end

    it 'gives an error and status not found f given non existent rental data' do

      # body = check_response(expected_type: Hash, expected_status: :bad_request)
      # expect(body).must_include "errors"
      # # expect(body["errors"]).must_include "movie"
      # expect(body["errors"]).must_include "customer"
      # expect(Movie.last.id).wont_equal body["id"]

    end


  end



end
