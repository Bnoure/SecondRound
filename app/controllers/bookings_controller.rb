class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)

  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
    @store = Store.find(@booking.game.store_id)
    @marker =
      {
        lat: @store.latitude,
        lng: @store.longitude,
        info_window: render_to_string(partial: "shared/info_window", locals: {store: @store})
      }
  end

  def create
    @booking = Booking.new(game_id: params[:game_id])
    @booking.user = current_user
    if @booking.save
      render json: { status: "created", booking_id: @booking.id }
    end
  end
end
