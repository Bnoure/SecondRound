import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { limitDate: String, createdDate: String }

  connect() {
    this.element.innerHTML = "Loading..."
    this.timer()
  }

  timer() {
    const lasttime = new Date(this.limitDateValue).toISOString()
    const createdDate = this.createdDateValue
    const dategood = new Date(lasttime)

    const now = new Date

    const diff = dategood - now
    const days = Math.floor(diff / (1000 * 60 * 60 * 24))
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60))
    const seconds = Math.floor((diff % (1000 * 60)) / 1000)
    this.element.innerHTML = `${days}j ${hours}h ${minutes}m ${seconds}s`

    // Si le temps n'est pas écoulé, on relance le timer
    if (diff > 0) {
      setTimeout(this.timer.bind(this), 1000)
    }
  }
}
