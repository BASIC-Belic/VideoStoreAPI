class Customer < ApplicationRecord
  has_many :movies, :through => :rentals
  has_many :rentals, dependent: :nullify
  validates :name, presence: true
end
