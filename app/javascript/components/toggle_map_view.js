class ToggleMapView {
  constructor() {
    this.mapViewBtn = document.querySelector(".js-map-view-btn");
    this.mapOverlay = document.querySelector(".js-map-overlay");
    this.bind();
  }

  toggle() {
    this.toggleColorMapViewBtn();
    this.toggleMapOverlay();
  }

  toggleColorMapViewBtn() {
    this.mapViewBtn.classList.toggle("clicked");
  }

  toggleMapOverlay() {
    this.mapOverlay.classList.toggle("hide");
  }

  bind() {
    if (!this.mapViewBtn) {
      return;
    }
    this.mapViewBtn.addEventListener("click", () => this.toggle());
  }
}

export default ToggleMapView;
