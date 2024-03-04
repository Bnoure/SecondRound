class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :city
      t.string :address
      t.time :open_hour
      t.time :close_hour
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
