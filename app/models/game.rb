class Game < ApplicationRecord
  belongs_to :store
  has_many :battles, class_name: "battle", foreign_key: "winning_game_id"
end
