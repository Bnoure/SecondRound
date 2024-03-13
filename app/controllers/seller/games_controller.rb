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
    @game = @game_infos.nil? ? Game.new : Game.build_with_api_data(@game_infos)
    @game.store = Store.find(game_params[:store_id])
    @game_picture_service = AttachGamePicture.new(game: @game).call if @game.english_title.present?
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
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to seller_stores_path
  end

  private

  def game_params
    params.require(:game).permit(:game_user_photo, :title, :description, :price, :category, :year, :condition,
                                 :console_id, :store_id)
  end
end
