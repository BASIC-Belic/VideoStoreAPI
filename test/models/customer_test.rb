require "test_helper"
describe Customer do

  before do
    @user = customers(:one)
    @user.registered_at = DateTime.now
    @user.save

    @no_movies_user = customers(:two)
    @no_movies_user.registered_at = DateTime.now
    @no_movies_user.save
  end

  describe 'relations' do
    it 'belongs to rentals' do
      rental = Rental.find_by(id: @user.rentals[0].id)
      expect(rental).must_be_kind_of Rental
      expect(rental.customer_id).must_equal @user.id
    end

    it "can have 0 movies through rentals" do
      expect(@no_movies_user.valid?).must_equal true
      expect(@no_movies_user).must_respond_to :rentals
      expect(@no_movies_user.rentals.empty?).must_equal true
    end

    it "can have 1 or more movies through rentals" do

      movie = Movie.find_by(id: @user.rentals[0].movie_id)

      expect(@user.valid?).must_equal true
      expect(@user).must_respond_to :rentals
      expect(@user.rentals.length).must_be :>=, 1
      expect(@user.rentals[0].movie_id).must_equal movie.id

      @user.rentals.each do |rental|
        expect(rental).must_be_kind_of Rental
      end
    end
  end

  describe 'validations' do
    it 'will be valid with name' do
      expect(@user.valid?).must_equal true
      expect(@user).wont_be_nil
    end

    it 'will not be valid' do
    end
  end

  let(:add_valid_rental) {
    rental = Rental.new(movie: movies(:two), customer: @no_movies_user)
    rental.save
    @no_movies_user.reload
  }

  let(:checked_in_valid_rental) {
    rental = @no_movies_user.rentals[0]
    rental.checked_out = false
    rental.save
    rental.reload
    @no_movies_user.reload

  }

  describe 'movies_checked_out_count' do

    it 'will be zero for customer with no rentals' do
      expect(@no_movies_user.rentals).must_equal []
      expect(@no_movies_user.movies_checked_out_count).must_equal 0
    end

    it 'will display number of checked out rentals for customer with rentals' do

      expect(@user.rentals.count).must_equal 2
      expect(@user.rentals[0].checked_out).must_equal true
      expect(@user.rentals[1].checked_out).must_equal true

      num_checked_out_rentals = @user.rentals.count

      expect(@user.movies_checked_out_count).must_equal   num_checked_out_rentals

    end

    it 'will increase if valid rental added' do

      expect(@no_movies_user.rentals.count).must_equal 0
      expect(@no_movies_user.movies_checked_out_count).must_equal 0

      add_valid_rental

      expect(@no_movies_user.rentals[0].checked_out).must_equal true
      expect(@no_movies_user.rentals[0]).must_be_kind_of Rental
      expect(@no_movies_user.rentals[1]).must_be_nil
      expect(@no_movies_user.movies_checked_out_count).must_equal 1
    end

    it 'will not increase if invalid rental added' do


      # HOW TO DO THIS WITHOUT THROWING ERROR?
      # expect(@no_movies_user.rentals.count).must_equal 0
      # expect(@no_movies_user.movies_checked_out_count).must_equal 0
      #
      # rental = Rental.new(movie: "movie", customer: @no_movies_user)
      # rental.save
      # @no_movies_user.reload
      #
      # expect(@no_movies_user.rentals.count).must_equal 0
      # expect(@no_movies_user.movies_checked_out_count).must_equal 0
    end

    it 'will decrease if rental checked in' do

      expect(@user.rentals.count).must_equal 2
      expect(@user.movies_checked_out_count).must_equal 2

      # rental = @user.rentals.order(:id)[0]
      rental = @user.rentals[0]
      rental.checked_out = false
      rental.save

      expect(rental.checked_out).must_equal false
      expect(@user.rentals[0]).must_be_kind_of Rental
      expect(@user.rentals[1]).must_be_kind_of Rental
      expect(@user.rentals[2]).must_be_nil
      expect(@user.movies_checked_out_count).must_equal 1
    end
  end

end
