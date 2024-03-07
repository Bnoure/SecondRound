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

  search() {
    const options = {
      enableHighAccuracy: true,
      maximumAge: 10000,
      timeout: 5000
    }
    console.log("search")
    const test = navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
    console.log(test)
    this.inputLocationTarget.classList.add("d-none")
    this.outputLocationTarget.classList.remove("d-none")
    console.log(this.element)
  }

  success(pos) {
    console.log(pos.coords);
    const crd = pos.coords;

    const url = `/location?latitude=${crd.latitude}&longitude=${crd.longitude}`

    fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      address = data.final_address;
    });
    // redirect with coordinates in params
    // location.assign(`/locations/?place=${crd.latitude},${crd.longitude}`)
    // location.assign(`/locations/?coordinates=${crd.latitude},${crd.longitude}`)
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
}
