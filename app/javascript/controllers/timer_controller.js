import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static values = { time: String }
  connect() {
    console.log(this.timeValue)
    console.log('Hello, Stimulus!')
  }

  timer(){
    // this.current
    // let countDownDate = ;
  }
}
