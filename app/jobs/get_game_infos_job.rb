class GetGameInfosJob < ApplicationJob
  queue_as :default

  retry_on ArgumentError, wait: 5.seconds, attempts: 1

  def perform(game, game_user_photo, game_uuid)
    game_infos_service = GetGameInfos.new(game_user_photo: game_user_photo)
    game_infos = game_infos_service.call
    game.update_with_api_data(game_infos)
    AttachGamePicture.new(game: game).call if game.english_title.present?
    ActionCable.server.broadcast("get_game_infos_channel_#{game_uuid}", { gameId: game.id } )
  end
end
