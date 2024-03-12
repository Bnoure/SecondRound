import { Controller } from "@hotwired/stimulus"
import Swal from "sweetalert2"

export default class extends Controller {
  static values = {
    icon: String,
    title: String,
    html: String,
    buttonText: String,
    showCancelButton: Boolean,
    cancelButtonText: String,
    gameId: Number
  }

  initSweetalert(event) {
    event.preventDefault(); // Prevent the form to be submited after the submit button has been clicked
    Swal.fire({
      title: "Are you sure?",
      text: "You won't be able to revert this!",
      icon: "warning",
      showCancelButton: true,
      confirmButtonColor: "#3085d6",
      cancelButtonColor: "#d33",
      confirmButtonText: "Yes, delete it!"
    }).then((result) => {
      if (result.isConfirmed) {
        fetch(`/games/${this.gameIdValue}/bookings`, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
          },
          body: JSON.stringify({ booking: { game_id: this.gameIdValue } })
        })
        .then(response => response.json())
        .then((data) => {
          if (data.status === "created") {
            window.location.href = `/bookings/${data.booking_id}`;
          }
        });
      }
    });
  }
}