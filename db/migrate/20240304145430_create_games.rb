class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :category
      t.integer :price
      t.string :console
      t.text :description
      t.integer :year
      t.string :condition
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
