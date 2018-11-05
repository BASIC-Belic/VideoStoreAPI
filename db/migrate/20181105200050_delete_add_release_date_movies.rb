class DeleteAddReleaseDateMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :release_date, :string
    add_column :movies, :release_date, :date
  end
end
