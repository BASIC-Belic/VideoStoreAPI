require "test_helper"

describe Customer do
  describe Customer do

    before do
      @user = Customer.first
      @user.registered_at = DateTime.today
      @user.save
    end

    describe 'relations' do
      it "has 0 or 1 movies" do
        expect(@user).must_respond_to :movies
        @user.movies.each do |movie|
          expect(movie).must_be_kind_of Movie
        end
      end

      it 'belongs to 0 or 1 movies' do
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
