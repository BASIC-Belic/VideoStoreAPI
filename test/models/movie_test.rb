require "test_helper"

describe Movie do

  before do
    @movie = Movie.first
    @movie2 = Movie.last
    @customer = Customer.first
    @rental = Rental.create(movie: @movie, customer: @customer)

    #
    # @empty_movie = Movie.find{ |r| r.rentals.length == 0 }
    # @full_movie = Movie.find{ |r| r.rentals.length == r.inventory }
    # @semi_full_movie = Movie.find{ |r|
    #    (r.rentals.length != r.inventory) && (r.rentals.length >= 1) }

  end

  describe 'validations' do
  end

  describe 'relations' do
    #
    # it 'each movie can have 0 rentals'
    # expect(@movie2).must_respond_to :rentals
    # expect(@movie2.rentals.length).must_equal 0

    it 'each movie can have 1 rentals' do

      expect(@movie).must_respond_to  :rentals
      expect(@movie.rentals.length).must_equal 1
    end
  end

  describe 'available_inventory' do

    # it 'will return 0 if movie has no available inventory' do
    #   expect(@empty_movie.available_inventory).must_equal 0
    # end
    #
    # it 'will return correct available inventory if some rentals on movie' do
    #   expect(@semi_full_movie.available_inventory).wont_equal inventory
    #   expect(@semi_full_movie.available_inventory).must_be :>=, @semi_full_movie.inventory
    # end
    #
    # it 'will return value inventory length if all movies have current rentals' do
    #   expect(@full_movie.available_inventory).must_equal @full_movie.inventory
    # end
    #
    # it 'will return [something] for negative???' do
    # end
  end
end
