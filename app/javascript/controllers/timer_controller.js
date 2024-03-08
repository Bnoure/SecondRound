import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static values = { limitDate: String }
  connect() {
    this.element.innerHTML = "Loading..."
    this.timer()
    setInterval(this.timer.bind(this), 1000)

  }

  timer(){
    const lasttime = this.limitDateValue
    const dategood = new Date(lasttime)
    const now = new Date()
    const diff = dategood - now
    const days = Math.floor(diff / (1000 * 60 * 60 * 24))
    const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
    const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60))
    const seconds = Math.floor((diff % (1000 * 60)) / 1000)
    this.element.innerHTML = `${days}d ${hours}h ${minutes}m ${seconds}s`
  }
}
