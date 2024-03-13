import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="get-game-infos"
export default class extends Controller {
  static values = {
    gameUuid: String
  }
  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GetGameInfosChannel", game_uuid: this.gameUuidValue },
      { received: data => window.location.href = `/seller/games/${data.game.id}/edit` }
    )
  }
}
