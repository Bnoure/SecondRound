class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home, :dashboard, :emma, :xavier, :nour]


  def home
    @hide_nav = true
  end

  def dashboard
  end

  def emma
  end

  def xavier
  end

  def nour
  end
end
