class Movie < ApplicationRecord
  has_and_belongs_to_many :customers
  has_many :customers, :through => :rentals
end
