class Game < ApplicationRecord
  belongs_to :store
  has_many :bookings, dependent: :destroy
  has_many :battles, class_name: "battle", foreign_key: "winning_game_id"
  has_one_attached :picture
  Validates :title, presence: true
  Validates price, presence: true
  Validates console, presence: true
  Validates condition, presence: true
end
