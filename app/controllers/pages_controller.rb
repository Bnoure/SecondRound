class PagesController < ApplicationController

  def home
    @hide_nav = true
    @user = current_user
    # @last_booking_date = current_user.last_booking&.limit_date
    @last_battle = Battle.last
    @winning_game = @last_battle&.winning_game
    @booking_last = Booking.where(user: current_user).last

  end
end
