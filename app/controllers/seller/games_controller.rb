class Seller::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game_infos_service = GetGameInfos.new(game_user_photo: game_params[:game_user_photo])
    @game_infos = @game_infos_service.call
    @game = Game.build_with_api_data(@game_infos) if @game_infos
    @game.store = Store.find(game_params[:store_id])
    # @game_picture_service = AttachGamePicture.new(game: @game)
    # @game_picture_service.call if @game.title
    if @game.save
      redirect_to edit_seller_game_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to seller_games_path
  end

  private

  def game_params
    params.require(:game).permit(:game_user_photo, :title, :description, :price, :category, :year, :condition,
                                 :console, :store_id)
  end
end
