class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify

  validates :title, presence: true

  def calculate_available
    return self.inventory - self.rentals_count
  end
end
