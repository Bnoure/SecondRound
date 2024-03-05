class BattlesController < ApplicationController
  def index
    @battles = Battle.where(user_id: current_user.id)
  end

  def show
    @battle = Battle.find(params[:id])
  end

  def new
    @battle = Battle.new
  end

  def create
    @battle = Battle.new(battle_params)
  end

  private

  def battle_params
    params.require(:battle).permit(:console, :winning_game_id, :user_id)
  end
end
