class RemoveInventoryAvailFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :available_inventory, :integer
  end
end
