import { Controller } from "@hotwired/stimulus";
import Swiper from 'https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.mjs'

export default class extends Controller {

  static targets = ["swiper1", "swiper2", "card"];
  clickCount = 0;

  connect() {
    console.log(Swiper)

    const games1 = this.swiper1Target.dataset.flipGames1.split(',').map(Number)
    const games2 = this.swiper2Target.dataset.flipGames2.split(',').map(Number)
    console.log(games1, games2)

    const buttons = document.querySelectorAll('.xbtn-b');
    buttons[0].addEventListener('click', () => this.removeCard(games1));
    buttons[1].addEventListener('click', () => this.removeCard(games2));
  }

  removeCard(games) {
    // Trouver la première carte du jeu et la supprimer
    const currentCard = this.cardTargets.reverse().find(card => games.includes(Number(card.dataset.gameId)));
    if (currentCard) {
      currentCard.remove();
    }

    this.clickCount++;
    if (this.clickCount >= 5) {
      this.showWinner();
    }
  }

  showWinner() {
    // Trouver le dernier jeu restant et afficher une pop-up
    const lastGame = this.cardTargets[0];
    if (lastGame) {
      const gameName = lastGame.dataset.gameName;
      const gameImage = lastGame.querySelector('img').src;

      // Remplir le modal avec les informations du jeu
      document.getElementById('game-modal-title').textContent = `Le gagnant est le jeu ${gameName}`;
      document.getElementById('game-modal-image').src = gameImage;

      // Montrer le modal
      document.getElementById('game-modal').style.display = 'block';
    }
  }
}
