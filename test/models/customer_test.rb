require "test_helper"

describe Customer do
  describe Customer do

    before do
      @user = Customer.first
    end

    describe 'relations' do
      it "has 0 or 1 movies" do
        expect(@user).must_respond_to :movies
        # @user.items.each do |item|
        #   expect(item).must_be_kind_of Item
        # end
      end
    end
  end

end
