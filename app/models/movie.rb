class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify

  validates :title, presence: true

  def available_inventory
    return self.inventory - self.rentals_count
  end
end
