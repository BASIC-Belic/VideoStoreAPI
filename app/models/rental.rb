class Rental < ApplicationRecord
  belongs_to :movie
  belongs_to :customer
  after_initialize :create_due_date
  after_initialize :create_checkout_date
  #/rentals/check-out


  private

  def create_checkout_date
    self.checkout_date = Date.today
  end

  def create_due_date
    self.due_date = Date.today + 7
  end
end
