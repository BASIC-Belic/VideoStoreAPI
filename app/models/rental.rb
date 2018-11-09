class Rental < ApplicationRecord
  belongs_to :movie, counter_cache: true
  belongs_to :customer
  after_initialize :create_checkout
  validates :movie, presence: true
  validates :customer, presence: true

  private

  def create_checkout
    self.checkout_date = Date.today
    self.due_date = Date.today + 7
    self.checked_out = true
    return self.valid?
  end
end
