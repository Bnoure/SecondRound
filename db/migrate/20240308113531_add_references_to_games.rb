class AddReferencesToGames < ActiveRecord::Migration[7.1]
  def change
    add_reference :games, :console, foreign_key: true
  end
end
