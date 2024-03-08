import { Controller } from "@hotwired/stimulus";
import Swing from "swing";

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["cardBattle1", "cardBattle2"];

  connect() {
    this.initializeSwing(this.cardBattle1Target);
    this.initializeSwing(this.cardBattle2Target);
  }

  initializeSwing(container) {
    const stack = Swing.Stack();
    const cardElements = container.querySelectorAll('.battle-card');

    cardElements.forEach((cardElement) => {
      let count  = 0
      let card = stack.createCard(cardElement);

      stack.on('dragstart', (e) => {
        this.throwOutConfidenceElement = e.target.querySelector('.no').style;
      });

      stack.on('dragmove', (e) => {
        this.throwOutConfidenceElement.opacity = e.throwOutConfidence;
      });

      stack.on('dragend', (e) => {
        if (e.throwOutConfidence != 1) {
          this.throwOutConfidenceElement.opacity = 0;
        }
        if(count == 5)
      });
    });
  }
}
