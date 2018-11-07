class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  after_initialize :create_checkout
  #/rentals/check-out
  validates :movie, presence: true
  validates :customer, presence: true, uniqueness: {
    scope: :movie, "Customer has already rented this movie."
  }

  private

  def create_checkout
    self.checkout_date = Date.today
    self.due_date = Date.today + 7
    self.checked_out = true
  end
end
