class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [  :dashboard, :emma, :xavier, :nour]


  def home
    @hide_nav = true
    @hide_top = true
    @last_booking_date = current_user.last_booking&.limit_date
  end

  def dashboard
  end

  def emma
  end

  def xavier
  end

  def nour
    @hide_nav = true
    @first_games = Game.all.sample(5)
    @second_games = Game.where.not(id: @first_games).sample(5)
  end
end
