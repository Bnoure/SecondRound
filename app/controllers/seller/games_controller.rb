class Seller::GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
    @game_uuid = SecureRandom.uuid
  end

  def create
    @game = Game.new
    @encoded_photo = encode_image
    @game.store = Store.find(game_params[:store_id])
    if @game.save
      GetGameInfosJob.perform_later(@game, @encoded_photo, game_params[:game_uuid])
    else
      render :new, status: :unprocessable_entity
    end

    head :ok
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

  def encode_image
    file_content = File.read(game_params[:game_user_photo].tempfile)
    Base64.strict_encode64(file_content)
  end

  def game_params
    params.require(:game).permit(:game_user_photo, :title, :description, :price, :category, :year, :condition,
                                 :console_id, :store_id, :game_uuid)
  end
end
