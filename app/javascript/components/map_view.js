class MapView {
  constructor() {
    this.mapButton = document.querySelector(".js-spots-map-button");
    this.map = document.querySelector(".js-spots-results-map");
    this.cards = document.querySelector(".js-spots-results-cards");
    this.loadMoreButton = document.querySelector(".js-load-more-button");
    this.bind();
  }

  toggleColorMapButton() {
    this.mapButton.classList.toggle("spots__map-button--pressed");
  }

  toggleMap() {
    this.map.classList.toggle("spots-results__map--hidden");
  }

  toggleCards() {
    this.cards.classList.toggle("spots-results__cards--hidden");
  }

  toggleLoadMoreButton() {
    this.loadMoreButton.classList.toggle("button--hidden");
  }

  bind() {
    if (!this.mapButton) {
      return;
    }
    this.mapButton.addEventListener("click", () => {
      this.toggleColorMapButton();
      this.toggleMap();
      this.toggleCards();
      this.toggleLoadMoreButton();
      window.dispatchEvent(new Event("resize"));
    });
  }
}

export default MapView;
