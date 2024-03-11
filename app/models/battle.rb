class Battle < ApplicationRecord
  belongs_to :winning_game, class_name: "game", optional: true
  belongs_to :user
  belongs_to :console
end
