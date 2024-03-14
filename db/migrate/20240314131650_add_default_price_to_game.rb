class AddDefaultPriceToGame < ActiveRecord::Migration[7.1]
  def change
    change_column :games, :price, :integer, default: 0
    change_column :games, :condition, :string, default: "Neuf"
  end
end
