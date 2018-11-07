class CustomersController < ApplicationController

  def index

    customers = Customer.all

    if customers
      render json: jsonify(customers), status: :ok
    end
  end

  private

  def jsonify(customer_data)
    return customer_data.as_json(only: [:id, :name, :address, :city, :state, :postal_code, :phone, :registered_at, :movies_checked_out_count])
  end

  def customer_params
    params.require(:customer).permit(:name)
  end
end
