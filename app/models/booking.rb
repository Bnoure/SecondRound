class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user
  enum :status, { new: 1, pending: 2, done: 3, rejected: 9 }
  validates :date, presence: true
  validates :status, presence: true

end
