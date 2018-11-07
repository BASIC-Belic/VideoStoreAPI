class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify

  validates :title, presence: true
end
