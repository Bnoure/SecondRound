class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user
  enum :status, { pending: 1, done: 2, rejected: 3 }
  # validates :game_id, uniqueness: { scope: :user_id }
  after_create :set_date

  private

  def set_date
    date = Date.today + 3.days
    update(date: date)
  end
end
