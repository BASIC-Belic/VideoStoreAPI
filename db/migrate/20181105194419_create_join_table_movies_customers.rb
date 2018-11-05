class CreateJoinTableMoviesCustomers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movies, :customers do |t|
      t.references :movie, index: true, null: false, foreign_key: true
      t.references :customer, index: true, null: false, foreign_key: true
      t.index [:movie_id, :customer_id]
      t.index [:customer_id, :movie_id]
    end
  end
end
