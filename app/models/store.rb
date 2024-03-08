class Store < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_one_attached :picture
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :filter_by_game_title, ->(query) { joins(:games).where("games.title ILIKE ?", "%#{query}%") }
  scope :filter_by_console, ->(console_id) { joins(games: :console).where(consoles: { id: console_id }) }
  scope :filter_by_localisation, ->(localisation) { near(localisation, 50) }
end
