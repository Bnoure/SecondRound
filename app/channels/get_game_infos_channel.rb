class GetGameInfosChannel < ApplicationCable::Channel
  def subscribed
    stream_from "get_game_infos_channel_#{params[:game_uuid]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
