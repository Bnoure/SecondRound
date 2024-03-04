class CreateBattles < ActiveRecord::Migration[7.1]
  def change
    create_table :battles do |t|
      t.string :console
      t.references :winning_game, foreign_key: {to_table: :games}
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
