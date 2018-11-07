class AddRentalsCountToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :rentals_count, :integer, default: 0

    #DIFFERENT WAY OF DOING ABOVE, RESET COUNTER CACHE
    # change_table :movies do |t|
    #   t.integer :rentals_count, default: 0
    # end


    #ROLLBACK IF FAIL [POSSIBLY BUILT IN ALREADY]
    # reversible do |dir|
    #   dir.up { data }
    # end


    #INCREASE COUNTER CACHE FOR ALL MOVIES
    # def data
    #   execute <<-SQL.squish
    #   UPDATE movies
    #   SET rentals_count = (SELECT count(1)
    #   FROM rentals
    #   WHERE rentals.movie_id = movies.id)
    #   SQL
    # end
  end
end
