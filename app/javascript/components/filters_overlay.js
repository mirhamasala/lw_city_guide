class FiltersOverlay {
  constructor() {
    this.filtersOverlay = document.querySelector(".js-filters-overlay");
    this.filtersButton = document.querySelector(".js-filters-button");
    this.closeFiltersButton = document.querySelector(".js-close-filters-button");
    this.mapButton = document.querySelector(".js-map-button");
    this.bind();
  }

  showFiltersOverlay() {
    this.filtersOverlay.classList.remove("spots__filters-overlay--hide");
  }

  hideFiltersOverlay() {
    this.filtersOverlay.classList.add("spots__filters-overlay--hide");
  }

  showMapButton() {
    this.mapButton.classList.remove("spots__map-button--hide");
  }

  hideMapButton() {
    this.mapButton.classList.add("spots__map-button--hide");
  }

  bind() {
    if (!this.filtersOverlay) {
      return;
    }
    this.filtersButton.addEventListener("click", () => {
      this.showFiltersOverlay();
      this.hideMapButton();
    });
    this.closeFiltersButton.addEventListener("click", () => {
      this.hideFiltersOverlay();
      this.showMapButton();
    });
  }
}

export default FiltersOverlay;
