class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify

  validates :title, presence: true

  def calculate_inventory
    Rental.where()
  end
end
