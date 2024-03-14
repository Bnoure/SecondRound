import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game-photo"
export default class extends Controller {
  static targets = [ "submit", "form", "title", "button", "retake" ]

 displayPhoto(event) {
    const file = event.target.files[0]
    const reader = new FileReader()

    reader.onload = (e) => {
    const preview = document.getElementById('preview')
    preview.src = e.target.result
    preview.classList.remove('d-none')
    this.submitTarget.classList.remove('d-none')
    this.retakeTarget.classList.remove('d-none')
    this.titleTarget.classList.add('d-none')
    this.formTarget.classList.add('d-none')
    this.buttonTarget.classList.add('d-none')
    }
    reader.readAsDataURL(file)

  }

  retake() {
    const preview = document.getElementById('preview')
    preview.classList.add('d-none')
    this.submitTarget.classList.add('d-none')
    this.retakeTarget.classList.add('d-none')
    this.titleTarget.classList.remove('d-none')
    this.formTarget.classList.remove('d-none')
    this.buttonTarget.classList.remove('d-none')
  }
}
