class AddDeleteCustomersRegisteredAt < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :registered_at, :string
    add_column :customers, :registered_at, :datetime
  end
end
