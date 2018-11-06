class AddParamsToRentals < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :postal_code, :integer
    add_column :rentals, :checkout_date, :date
    add_column :rentals, :due_date, :date
  end
end
