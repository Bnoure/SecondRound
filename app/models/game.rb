class Game < ApplicationRecord
  belongs_to :store
  has_many :bookings, dependent: :destroy
  has_many :battles, class_name: "battle", foreign_key: "winning_game_id"
  has_one_attached :picture
  validates :title, presence: true
  validates :price, presence: true
  validates :console, presence: true
  validates :condition, presence: true
end
