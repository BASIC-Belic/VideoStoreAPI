class Customer < ApplicationRecord
  has_many :movies, :through => :rentals
  has_many :rentals
  validates :name, presence: true
end
