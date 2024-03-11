import { Controller } from "@hotwired/stimulus";
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs';

/* import Swing from "swing"; */

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["cardBattle1", "cardBattle2", "button"];

  connect() {
    setTimeout(() => this.initializeSwiper1(), 0);
    setTimeout(() => this.initializeSwiper2(), 0);
  }


  initializeSwiper1() {
    this.cardBattle1Targets.forEach((element) => {
      new Swiper(element, {
        direction: 'horizontal',
        allowSlideNext: true,
        speed: 200,
        simulateTouch: true, // Permet le swipe avec la souris
        touchStartPreventDefault: false, // Permet de commencer à swiper sans avoir à cliquer d'abord
        on: {
          slideChange: function () {
            console.log('slide changed');
          },
        },
      });
    });
  }

  initializeSwiper2() {
    this.cardBattle2Targets.forEach((element) => {
      const swiper = new Swiper(element, {
        direction: 'horizontal',
        allowSlideNext: true,

        speed: 200,
        simulateTouch: true, // Permet le swipe avec la souris
        touchStartPreventDefault: false, // Permet de commencer à swiper sans avoir à cliquer d'abord
        on: {
          slideChange: function () {
            console.log('slide changed to index:');
          },
        },
      });
    });
  }

  flipCard(event) {
    const card = event.target.closest('.battle-card');
    const cardInner = card.querySelector('.battle-card-inner');
    cardInner.classList.toggle('is-flipped');
    const button = card.querySelector('.flip-button');
    if (cardInner.classList.contains('is-flipped')) {
      button.textContent = 'Hide Details';
    } else {
      button.textContent = 'Show Details';
    }
  }
}
