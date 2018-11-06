class Movie < ApplicationRecord
  has_many :customers, :through => :rentals
<<<<<<< HEAD

  has_many :rentals

=======
  has_many :rentals
>>>>>>> 330f92fd289d4c776758cd86d760b00e27ed86d8
end
