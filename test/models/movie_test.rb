require "test_helper"

describe Movie do

  describe 'relations' do

    before do
      # set up movie variables
      @movie = Movie.first
      @movie2 = Movie.last
      @movie.release_date = Date.today
      @movie.save
      @movie2.release_date = Date.today
      @movie2.save

      @customer = Customer.first
      @movie2.customer_ids << @customer.id
      # customer variable
      customer_id = @movie2.customer_ids[0]
      @customer = Customer.find_by(id: customer_id)
    end

    it 'each movie can have 1 customer'do

    expect(@movie2.customer_ids.include? @customer.id).must_equal true
  end


  it 'each movie can have 0 customers' do
    
    expect(@movie).must_respond_to  :customers
    expect(@movie.customers.length).must_equal 0

  end




end

end
