import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = [ "inputLocation", "outputLocation" ]

  connect() {
    console.log("Hello, Stimulus!")
  }

  inputEnable() {
    console.log("inputEnable")
    console.log(event.currentTarget)
    event.currentTarget.classList.add("d-none")
    this.inputLocationTarget.classList.remove("d-none")
  }

  currentLocation() {
    console.log("currentLocation")
    this.inputLocationTarget.classList.add("d-none")
    this.outputLocationTarget.classList.remove("d-none")
  }
}
