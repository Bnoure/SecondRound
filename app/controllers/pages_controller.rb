class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :xavier]

  def home
  end

  def xavier
  end
end
