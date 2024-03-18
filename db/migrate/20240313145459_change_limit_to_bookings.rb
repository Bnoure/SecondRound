class ChangeLimitToBookings < ActiveRecord::Migration[7.1]
  def change

    change_column :bookings, :limit_date, :datetime

    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
