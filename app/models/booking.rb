class Booking < ApplicationRecord
  belongs_to :game
  belongs_to :user
  enum :status, { pending: 1, done: 2, rejected: 3 }
  # validates :game_id, uniqueness: { scope: :user_id }
  after_create :set_limit_date

  private

  def set_limit_date
    date = created_at + 3.days
    update(limit_date: date)
    
  end
end
