class Seller::BookingsController < ApplicationController
  def index
    @bookings = Booking.joins(game: :store).where(stores: { user: current_user })
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to seller_bookings_path
  end
end
