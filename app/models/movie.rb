class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify
  validates :title, presence: true
  validates :inventory, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :available_inventory, numericality: { greater_than_or_equal_to: 0 }

  def available_inventory
    curr_rentals = self.rentals.select {
      |rental| rental.checked_out == true
    }
    return self.inventory - curr_rentals.length
  end

  private

  # def movie_errors
  #   self.errors.add(:available_inventory, :out_of_stock, message: "there is no availability for this movie") if self.movie.available_inventory <= 0
  # end
end
