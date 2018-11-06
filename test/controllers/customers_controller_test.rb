require "test_helper"
# :id, :name, :address, :city, :state, :postal_code, :phone, :registered_at])
describe CustomersController do

  CUSTOMER_FIELDS = %w(id name address city state postal_code phone registered_at).sort!

  # helper method to refactor the json

  def check_response(expected_type, expected_status: :success)
    must_respond_with :success
    expect(response.header['Content-Type']).must_include 'json'

    body = JSON.parse(response.body)
    expect(body).must_be_kind_of expected_type

    return body

  end

  describe "index" do

    it "is a real working route" do
      get customers_path

      must_respond_with :success
      expect(response.header['Content-Type']).must_include 'json'
      body = JSON.parse(response.body)
      expect(body).must_be_kind_of Array
      expect(body.length).must_equal Customer.count

      body.each do |customer|
        expect(customer.keys.sort).must_equal CUSTOMER_FIELDS
      end



    end


  end

end
