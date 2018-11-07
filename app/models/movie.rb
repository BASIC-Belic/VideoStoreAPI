class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify
  validates :title, presence: true

  def available_inventory
     num_curr_rentals = self.rentals.select {
       |rental| rental.checked_out == true
     }
     return self.inventory - num_curr_rentals
  end
end
