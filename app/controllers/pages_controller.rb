class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:dashboard, :emma, :xavier, :nour,:noure]


  def home
    @hide_nav = true
    @user = current_user
    @last_booking_date = current_user.last_booking&.limit_date
    @last_battle = Battle.last
    @winning_game = @last_battle&.winning_game
    @booking_last = Booking.last
  end

  def dashboard
  end

  def emma
  end

  def xavier
  end

  def noure
    @fight_page = true
    # @background_image = Dir.glob("app/assets/images/background/*").sample.sub('app/assets/images/', '')
    @hide_nav = true
    @first_games = Game.all.sample(5)
    @second_games = Game.where.not(id: @first_games).sample(5)
  end


  def nour
    @hide_nav = true
    @first_games = Game.all.sample(5)
    @second_games = Game.where.not(id: @first_games).sample(5)
  end
end
