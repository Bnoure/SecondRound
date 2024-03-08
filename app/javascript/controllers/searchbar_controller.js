import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchbar"
export default class extends Controller {
  static targets = [ "inputLocation", "outputLocation", "iconLocation" ]

  connect() {
    console.log("Hello, Stimulus!");
    this.search()
  }

  inputEnable(event) {
    console.log("inputEnable")
    console.log(event.currentTarget)
    this.iconLocationTarget.classList.remove("d-none");
    this.inputLocationTarget.classList.add("inputGroup");
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
    console.log(this.element)
    this.inputLocationTarget.classList.remove("inputGroup");
    this.iconLocationTarget.classList.add("d-none");
  }

  success(pos) {
    console.log(pos.coords);
    const crd = pos.coords;

    const url = `/location?latitude=${crd.latitude}&longitude=${crd.longitude}`

    fetch(url)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      const address = data.final_address;
      this.outputLocationTarget.value = address;
    });
    // redirect with coordinates in params
    // location.assign(`/locations/?place=${crd.latitude},${crd.longitude}`)
    // location.assign(`/locations/?coordinates=${crd.latitude},${crd.longitude}`)
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }
}
