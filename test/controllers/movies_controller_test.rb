require "test_helper"

describe MoviesController do

  MOVIE_PARAMS = %w(title release_date overview inventory id available_inventory).sort!

  def check_response(expected_type:, expected_status: :success)
    must_respond_with expected_status
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type
    return body
  end

  before do
    @movie = Movie.first
    @customer = Customer.first
    @rental = Rental.create(movie: @movie, customer: @customer)
  end

  describe 'index' do

    it "is a real and working route" do
      get movies_path

      must_respond_with :success
      expect(response.header['Content-Type']).must_include 'json'

      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Array
      expect(body.length).must_equal Movie.count

      body.each do |movie|
        expect(movie.keys.sort).must_equal MOVIE_PARAMS
      end
    end

    it "returns an empty array when there are no movies" do

      Movie.destroy_all
      get movies_path

      must_respond_with :success
      body = check_response(expected_type: Array)
      expect(body).must_equal []
    end

    #check nullify test

  end


  describe 'show' do

    it "retrieves info on a valid movie" do
      get movie_path(@movie.id)
      body = check_response(expected_type: Hash)
      expect(body.keys.sort).must_equal MOVIE_PARAMS
    end
  end

  let(:movie_params){
    {
        id: Movie.first.id
    }
  }

  let(:create_movie_params){
    {
        title: "title",
        release_date: "1/11/99",
        inventory: 7,
        overview: "Overview"
    }
  }

  describe 'create' do

    it 'creates a new movie given valid data' do
      expect {
        post movies_path, params: create_movie_params
      }.must_change 'Movie.count', 1

      body = check_response(expected_type: Hash)

      expect(body.keys).must_equal ["id"]
      expect(Movie.last.id).must_equal body["id"]
    end

    it 'returns an error for invalid movie data for missing name' do

      movie_params[:id] = nil

      expect {
        post movies_path, params: movie_params
      }.wont_change 'Movie.count'

      body = check_response(expected_type: Hash, expected_status: :bad_request)
      expect(body).must_include "errors"
      expect(body["errors"]).must_include "title"
      expect(Movie.last.id).wont_equal body["id"]
    end
  end
end
