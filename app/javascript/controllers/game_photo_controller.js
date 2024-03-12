import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-photo"
export default class extends Controller {
  static targets = [ "submit" ]

 displayPhoto(event) {
    const file = event.target.files[0]
    const reader = new FileReader()

    reader.onload = (e) => {
    const preview = document.getElementById('preview')
    preview.src = e.target.result
    preview.classList.remove('d-none')
    this.submitTarget.classList.remove('d-none')
    }
    reader.readAsDataURL(file)
  }
}
