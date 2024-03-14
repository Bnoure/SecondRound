class Game < ApplicationRecord
  belongs_to :store
  belongs_to :console, optional: true
  has_many :bookings, dependent: :destroy
  has_many :battles, class_name: "Battle", foreign_key: "winning_game_id"
  has_one_attached :picture
  validates :store_id, presence: true
  attr_accessor :game_user_photo, :game_uuid

  CONDITIONS = ["Neuf", "Parfait Etat", "Bon Etat", "Etat Correct"]
  scope :filter_by_title, ->(query) { where("title ILIKE ?", "%#{query}%") }

  def update_with_api_data(api_data)
    update(
      title: api_data[:title],
      year: api_data[:year].to_i,
      description: api_data[:description],
      category: api_data[:category],
      english_title: api_data[:english_title]
    )
  end
end
