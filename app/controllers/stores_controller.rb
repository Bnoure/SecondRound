class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @stores = Store.all
    @games = Game.where("title ILIKE ?", "%#{params[:query]}%") if params[:query].present?
    @stores = @games.each do |game|
      puts game.store
    end
  end

  def new
    @store = Store.new
  end

  def show
    @store = Store.find(params[:id])
  end

  def create
  end
end
