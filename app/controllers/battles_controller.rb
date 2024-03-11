class BattlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :edit]

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
     @battle.user = current_user

    if @battle.save
      redirect_to edit_battle_path(@battle)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @hide_nav = true
    @battle = Battle.find(params[:id])
    @first_games = Game.where(console_id: @battle.console_id).sample(5)
    @second_games = Game.where(console_id: @battle.console_id).where.not(id: @first_games).sample(5)
  end

  private

  def battle_params
    params.require(:battle).permit(:console_id, :winning_game_id)
  end
end
