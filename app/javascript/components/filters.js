class Filters {
  constructor() {
    this.filters = document.querySelector(".js-filters");
    this.showFiltersButton = document.querySelector(".js-filter-show");
    this.closeFiltersButton = document.querySelector(".js-filter-close");
    this.mapViewButton = document.querySelector(".js-map-view-btn");
    this.bind();
  }

  showFilters() { this.filters.classList.remove("hide"); }

  hideFilters() { this.filters.classList.add("hide"); }

  showMapViewButton() { this.mapViewButton.classList.remove("hide"); }

  hideMapViewButton() { this.mapViewButton.classList.add("hide"); }

  bind() {
    if (!this.filters) {
      return;
    }
    this.showFiltersButton.addEventListener("click", () => {
      this.showFilters();
      this.hideMapViewButton();
    })
    this.closeFiltersButton.addEventListener("click", () => {
      this.hideFilters();
      this.showMapViewButton();
    })
  }
}

export default Filters;
