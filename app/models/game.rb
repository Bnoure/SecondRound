class Game < ApplicationRecord
  belongs_to :store
  belongs_to :console
  has_many :bookings, dependent: :destroy
  has_many :battles, class_name: "battle", foreign_key: "winning_game_id"
  has_one_attached :picture
  validates :store, presence: true
  attr_accessor :game_user_photo

  scope :filter_by_title, ->(query) { where("title ILIKE ?", "%#{query}%") }

  def self.build_with_api_data(api_data)
    new(
      title: api_data[:title],
      year: api_data[:year].to_i,
      description: api_data[:description],
      category: api_data[:category],
      console: Console.find_or_create_by(name: api_data[:console]),
    )
  end
end
