require "test_helper"

describe Customer do
  describe Customer do

    before do
      @user = Customer.first
      @user.registered_at = DateTime.now
      @user.save

      @no_movies_user = Customer.find_by(movies.length == 0)
      @no_movies_user.registered_at = DateTime.now
      @no_movies_user.save
    end

    describe 'relations' do

      it "can have 0 movies" do
        expect(@no_movies_user.valid?).must_equal true
        expect(@no_movies_user).must_respond_to :movies
        expect(@no_movies_user.movies.empty?).must_equal true
      end

      it "can have 1 or more movies" do
        expect(@user.valid?).must_equal true
        expect(@user).must_respond_to :movies
        @user.movies.each do |movie|
          expect(movie).must_be_kind_of Movie
        end
      end

      it 'belongs to 0 or many movies' do
        movie_ids = Customer.first.movie_ids
        movie_ids.each do |id|
          movie = Movie.find_by(id: id)
          expect(movie).must_be_kind_of Movie
        end

        customer_ids = Movie.first.customer_ids
        customer_ids.each do |id|
          customer = Customer.find_by(id: customer_id)
          expect(customer).must_be_kind_of Customer
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
