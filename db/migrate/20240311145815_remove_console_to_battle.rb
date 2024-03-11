class RemoveConsoleToBattle < ActiveRecord::Migration[7.1]
  def change
    remove_column :battles, :console, :string
    add_reference :battles, :console, null: false, foreign_key: true
  end
end
