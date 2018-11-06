require "test_helper"

describe Movie do

  describe 'relations' do

    before do

      @movie = Movie.first
      @movie2 = Movie.last
      @customer = Customer.first
      @rental_empty = Rental.create
      @rental = Rental.create(movie: @movie, customer: @customer)

    end
    #
    # it 'each movie can have 0 rentals'
    # expect(@movie2).must_respond_to :rentals
    # expect(@movie2.rentals.length).must_equal 0

    it 'each movie can have 1 rentals' do

      expect(@movie).must_respond_to  :rentals
      expect(@movie.rentals.length).must_equal 1

    end




  end

end
