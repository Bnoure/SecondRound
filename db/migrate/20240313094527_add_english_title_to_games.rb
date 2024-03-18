class AddEnglishTitleToGames < ActiveRecord::Migration[7.1]
  def change
    add_column :games, :english_title, :string
  end
end
