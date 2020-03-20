class Filters {
  constructor() {
    this.filters = document.querySelector(".js-spots-filters-container");
    this.filtersLink = document.querySelector(".js-spots-filters-link");
    this.bind();
  }

  toggleFilters() {
    this.filters.classList.toggle("spots__filters-container--hidden");
  }

  bind() {
    if (!this.filters) {
      return;
    }
    this.filtersLink.addEventListener("click", () => {
      this.toggleFilters();
    });
  }
}

export default Filters;

// Adding a hidden class
