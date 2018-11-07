require "test_helper"

describe Movie do

  before do
    @empty_movie = movies(:zero)
    @semi_full_movie = movies(:two)
    @full_movie = movies(:one)
  end

  describe 'validations' do
  end

  describe 'relations' do
    #
    # it 'each movie can have 0 rentals'
    # expect(@movie2).must_respond_to :rentals
    # expect(@movie2.rentals.length).must_equal 0

    it 'each movie can have 1 rentals' do

      expect(@full_movie).must_respond_to  :rentals
      expect(@full_movie.rentals.length).must_equal 1
    end
  end

  describe 'available_inventory' do

    it 'will return 0 if movie has no available inventory to start with' do
      expect(@empty_movie.inventory).must_equal 0
      expect(@empty_movie.available_inventory).must_equal 0
    end

    it 'will subtract all movies and return 0 if all movies rented out' do
      inventory = @full_movie.inventory
      rentals = @full_movie.rentals.length

      expect(@full_movie.available_inventory).must_equal inventory - rentals
      expect(@full_movie.available_inventory).must_equal 0
    end

    it 'will return correct available inventory if some rentals on movie' do
      inventory = @semi_full_movie.inventory
      rentals = @semi_full_movie.rentals.length

      expect(@semi_full_movie.available_inventory).must_equal inventory - rentals

    end
    #
    # it 'will return [something] for negative???' do
    # end
  end
end
