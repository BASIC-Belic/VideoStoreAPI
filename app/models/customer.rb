class Customer < ApplicationRecord
  has_many :movies, :through => :rentals
  has_many :rentals, dependent: :nullify
  validates :name, presence: true

  private

  def movies_checked_out_count
    return self.rentals.count
  end
end
