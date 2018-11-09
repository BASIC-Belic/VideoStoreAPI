require "test_helper"

describe Rental do

  describe 'relations' do

    it 'a movie has many rentals' do
      movie = movies(:one)
      rental = Rental.where(movie: movie)
      expect(rental.count).must_equal 1

    end

    it 'a customer has many rentals' do

      customer = customers(:one)
      rental2 = Rental.where(customer: customer)
      expect(rental2.count).must_equal 2

    end
  end
  #   validations: movie presence true, customer presence true


  describe 'validations' do

    it 'a rental is valid when movie and customer presence is true' do

      @rental = Rental.first
      is_valid = @rental.valid?
      expect( is_valid ).must_equal true
    end

    it 'is invalid without a movie' do
        # binding.pry
      @rental = Rental.first
      @rental.movie = nil

      is_valid = @rental.valid?
      expect ( is_valid ).must_equal false
    end

    it 'a rental is invalid without a customer' do
      @rental = Rental.first
      @rental.customer = nil

      is_valid = @rental.valid?
      expect (is_valid ).must_equal false
    end

  end

end
