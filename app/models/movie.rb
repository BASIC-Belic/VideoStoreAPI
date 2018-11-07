class Movie < ApplicationRecord
  has_many :rentals, dependent: :nullify

  validates :title, presence: true

  private

  def decrement_inventory(self)
    self.available_inventory -= 1
  end
end
