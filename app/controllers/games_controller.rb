class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :price, :category, :year, :condition, :console, :store_id)
  end
end
