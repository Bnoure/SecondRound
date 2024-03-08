import { Controller } from "@hotwired/stimulus";
import Swing from "swing";

// Connects to data-controller="swipe"
export default class extends Controller {

  connect() {
    this.stack = Swing.Stack();
    this.cardElements = this.element.querySelectorAll('.battle-card');

    this.cardElements.forEach((cardElement) => {
      var card = this.stack.createCard(cardElement);

      this.stack.on('dragstart', (e) => {
        this.throwOutConfidenceElement = e.target.querySelector('.no').style;
      });

      this.stack.on('dragmove', (e) => {
        this.throwOutConfidenceElement.opacity = e.throwOutConfidence;
      });

      this.stack.on('dragend', (e) => {
        if (e.throwOutConfidence != 1) {
          this.throwOutConfidenceElement.opacity = 0;
        }
      });
    });
  }


}
