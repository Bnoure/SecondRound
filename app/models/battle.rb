class Battle < ApplicationRecord
  belongs_to :winning_game, class_name: "game", optional: true
  belongs_to :user
  validates :console, presence: true
end
