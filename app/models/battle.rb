class Battle < ApplicationRecord
  belongs_to :winning_game, class_name: "Game", optional: true
  belongs_to :user
  belongs_to :console
end
