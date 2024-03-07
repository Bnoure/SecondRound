import { Controller } from "@hotwired/stimulus";
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs';

// Connects to data-controller="swipe"
export default class extends Controller {
  static targets = ["button1", "button2", "cardBattle1", "cardBattle2"];
  swiper1 = null;

  connect() {
    this.initializeSwiper();
  }

  initializeSwiper() {
    setTimeout(() => {
      this.swiper1 = new Swiper(this.cardBattle1Target, {
        slidesPerView: 1,
        spaceBetween: 100,
        navigation: {
          nextEl: this.button1Target,
        },
      });
    }, 0);
  }

  next1() {
    this.swiper1.slidePrev();
  }
}
