class Customer < ApplicationRecord
  has_many :movies, :through => :rentals
  has_many :rentals
  validates :postal_code, presence: true
  validates :name, presence: true
end
