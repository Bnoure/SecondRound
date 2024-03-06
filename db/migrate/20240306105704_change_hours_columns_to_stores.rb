class ChangeHoursColumnsToStores < ActiveRecord::Migration[7.1]
  def change
    remove_column :stores, :open_hour, :time
    add_column :stores, :open_hour, :integer
    remove_column :stores, :close_hour, :time
    add_column :stores, :close_hour, :integer
  end
end
