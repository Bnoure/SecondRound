class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :home, :dashboard, :emma, :xavier, :nour]


  def home
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
