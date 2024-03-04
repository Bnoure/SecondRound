class Battle < ApplicationRecord
  belongs_to :winning_game, class_name: "game"
  belongs_to :user
end
