class BattlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @battles = Battle.where(user_id: current_user.id).where.not(winning_game_id: nil)
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
    @fight_page = true
    @hide_nav = true
    @battle = Battle.find(params[:id])
    @first_games = Game.where(console_id: @battle.console_id).sample(5)
    @second_games = Game.where(console_id: @battle.console_id).where.not(id: @first_games).sample(5)
  end

  def set_winner
    @battle = Battle.find(params[:id])
    @battle.winning_game_id = params[:winning_game_id]
    if @battle.save
      render json: @battle
    else
      render json: { error: 'Failed to set winner' }, status: :unprocessable_entity
    end
  end

  def destroy
    @battle = Battle.find(params[:id])
    @battle.destroy
    redirect_to battles_path, notice: 'Battle was successfully destroyed.'
  end

  private



  def battle_params
    params.require(:battle).permit(:console_id, :winning_game_id)
  end
end
