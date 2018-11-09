class Customer < ApplicationRecord
  has_many :movies, :through => :rentals
  has_many :rentals, dependent: :nullify
  validates :name, presence: true

  # def movies_checked_out_count
  #   find_checked_out_count
  # end
  #
  # private

  def movies_checked_out_count
    return self.rentals.select {
      |rental| rental.checked_out == true
    }.length
  end

  private
end
