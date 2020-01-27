class MapView {
  constructor() {
    this.mapButton = document.querySelector(".js-map-button");
    this.mapOverlay = document.querySelector(".js-map-overlay");
    this.bind();
  }

  toggleColorMapButton() {
    this.mapButton.classList.toggle("spots__map-button--pressed");
  }

  toggleMapOverlay() {
    this.mapOverlay.classList.toggle("spots-results__map-overlay--hide");
  }

  bind() {
    if (!this.mapButton) {
      return;
    }
    this.mapButton.addEventListener("click", () => {
      this.toggleColorMapButton();
      this.toggleMapOverlay();
      window.dispatchEvent(new Event("resize"));
    });
  }
}

export default MapView;
