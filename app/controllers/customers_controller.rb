class CustomersController < ApplicationController

  def index
  end

  private

  def customer_params
    params.require(:customer).permit(:name)
  end
end
