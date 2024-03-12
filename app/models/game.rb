class Game < ApplicationRecord
  belongs_to :store
  belongs_to :console
  has_many :bookings, dependent: :destroy
  has_many :battles, class_name: "Battle", foreign_key: "winning_game_id"
  has_one_attached :picture
  validates :title, presence: true
  validates :price, presence: true
  validates :console, presence: true
  validates :condition, presence: true

  scope :filter_by_title, ->(query) { where("title ILIKE ?", "%#{query}%") }
end
