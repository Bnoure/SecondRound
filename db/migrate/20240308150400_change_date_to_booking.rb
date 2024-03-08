class ChangeDateToBooking < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :date, :limit_date
  end
end
