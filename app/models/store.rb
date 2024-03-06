class Store < ApplicationRecord
  belongs_to :user
  has_many :games, dependent: :destroy
  has_one_attached :picture
  validates :name, presence: true
  validates :city, presence: true
  validates :address, presence: true

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_address?

  scope :filter_by_game_title, ->(query) { joins(:games).where("title ILIKE ?", "%#{query}}%") }
  scope :filter_by_localisation, ->(localisation) { near(localisation) }
end
