import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = [ "inputLocation", "outputLocation", "locationDot" ]

  connect() {
    this.search()
  }

  inputEnable(event) {
    this.inputLocationTarget.classList.add("inputGroup");
    this.locationDotTarget.classList.add("d-none");
  }

  search() {
    const options = {
      enableHighAccuracy: true,
      maximumAge: 10000,
      timeout: 5000
    }
    const locData = localStorage.getItem("locData")
    if (locData) {
      const locDataParsed = JSON.parse(locData)
      this.#setFullAddress(locDataParsed)
    } else {
      navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
    }
    this.inputLocationTarget.classList.remove("inputGroup");
    this.locationDotTarget.classList.remove("d-none");
  }

  success(pos) {
    const crd = pos.coords;
    const locData = {
      latitude: pos.coords.latitude,
      longitude: pos.coords.longitude
    }

    localStorage.setItem("locData", JSON.stringify(locData))

    this.#setFullAddress(crd)
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }

  #setFullAddress(locData) {
    const url = `/location?latitude=${locData.latitude}&longitude=${locData.longitude}`

    fetch(url)
    .then(response => response.json())
    .then((data) => {
      const address = data.final_address;
      this.outputLocationTarget.value = address;
    });
  }
}
