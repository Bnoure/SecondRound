import { Controller } from "@hotwired/stimulus";
import Swing from "swing";

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["cardBattle1", "cardBattle2"];

  connect() {
    this.initializeSwing(this.cardBattle1Targets);
    this.initializeSwing(this.cardBattle2Targets);
  }

  initializeSwing(cardElements) {
    const config = {
      throwOutConfidence: (yOffset, element) => {
        const yConfidence = Math.min(Math.abs(yOffset) / element.offsetHeight, 1);
        return Math.max(xConfidence, yConfidence);
      },
    };
    const stack = Swing.Stack();
    console.log(cardElements)

    cardElements.forEach((cardElement) => {
      let count  = 0
      let card = stack.createCard(cardElement);

      stack.on('dragstart', (e) => {
        this.throwOutConfidenceElement = e.target
      });

      stack.on('dragmove', (e) => {
        console.log(e)
        this.throwOutConfidenceElement.opacity = e.throwOutConfidence;
      });

      stack.on('dragend', (e) => {
        if (e.throwOutConfidence != 1) {
          this.throwOutConfidenceElement.classList.add("d-none");
        }

      });
    });
  }
}
