class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify
  after_initialize :create_checkout

  validates :title, presence: true
end
