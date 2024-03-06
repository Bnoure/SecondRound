class StoresController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @stores = Store.all
    @stores = @stores.filter_by_game_title(params[:query]) if params[:query].present?
    @stores = @stores.filter_by_localisation(params[:localisation]) if params[:localisation].present?
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
