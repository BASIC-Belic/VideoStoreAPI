require "test_helper"

describe Customer do
  describe Customer do

    before do

      @user = Customer.first
      @user.name = "User"
      @movie = Movie.first
      @rental = Rental.create(customer: @user, movie: @movie)

      @user.registered_at = DateTime.now
      @user.save

      @no_movies_user = Customer.last
      @no_movies_user.name = "No Movies User"
      @no_movies_user.registered_at = DateTime.now
      @no_movies_user.save


    end

    describe 'relations' do
      it 'belongs to rentals' do
        expect(@rental.customer_id).must_equal @user.id
      end

      it "can have 0 movies through rentals" do
        expect(@no_movies_user.valid?).must_equal true
        expect(@no_movies_user).must_respond_to :rentals
        expect(@no_movies_user.rentals.empty?).must_equal true
      end

      it "can have 1 or more movies through rentals" do

        expect(@user.valid?).must_equal true
        expect(@user).must_respond_to :rentals
        expect(@user.rentals.length).must_equal 1
        expect(@user.rentals[0].movie_id).must_equal @movie.id

        @user.rentals.each do |rental|
          expect(rental).must_be_kind_of Rental
        end
      end
    end

    describe 'validations' do
      it 'will be valid' do
      end

      it 'will not be valid' do
      end
    end

  end

end
