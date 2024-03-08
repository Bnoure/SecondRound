class RemoveConsoleToGames < ActiveRecord::Migration[7.1]
  def change
    remove_column :games, :console, :string
  end
end
