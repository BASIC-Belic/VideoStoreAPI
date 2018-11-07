class AddCheckedOutToRental < ActiveRecord::Migration[5.2]
  def change
    add_column :rentals, :checked_out, :boolean
  end
end
