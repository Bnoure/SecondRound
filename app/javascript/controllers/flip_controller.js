import { Controller } from "@hotwired/stimulus";


export default class extends Controller {


  static targets = ["swiper1", "swiper2", "card", "link"];
  static values = {
    battleId: Number
  }
  clickCount = 0;

  connect() {
    console.log(this.battleIdValue)



    const games1 = this.swiper1Target.dataset.flipGames1.split(',').map(Number)
    const games2 = this.swiper2Target.dataset.flipGames2.split(',').map(Number)

    console.log(games1, games2)


    const buttons = document.querySelectorAll('.xbtn-b-battle');
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
    const lastGame = this.cardTargets[this.cardTargets.length - 1];
    if (lastGame) {
      const gameName = lastGame.dataset.gameName;
      const gameId = lastGame.dataset.gameId;
      const battleId = this.battleIdValue;
      fetch(`/battles/${battleId}/set_winner`,{
        method: 'PATCH',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
          winning_game_id: gameId
        })
      })
      .then(response => response.json())
      .then(data => {
        console.log(data)
      })

      const gameImage = lastGame.querySelector('img').src;

      // Remplir le modal avec les informations du jeu
      document.getElementById('game-modal-title').textContent = `Le gagnant est le jeu ${gameName}`;
      document.getElementById('game-modal-image').src = gameImage;

      // Montrer le modal
      document.getElementById('game-modal').style.display = 'block';
      document.getElementById('modal-backdrop').style.display = 'block';

      this.linkTarget.href =`/stores/?game_name=${gameName}`;

    }
  }
}
