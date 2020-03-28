class FiltersMenu {
  constructor() {
    this.filtersContainer = document.querySelector(
      ".js-spots-filters-container"
    );
    this.filtersLink = document.querySelector(".js-spots-filters-link");
    this.filtersMenu = document.querySelector(".filters");
    this.mapButton = document.querySelector(".js-spots-map-button");
    this.bind();
  }

  hideFiltersContainer() {
    this.filtersContainer.classList.add("spots__filters-container--hidden");
  }

  handleClickInOut = targetElement => {
    do {
      if (
        targetElement == this.filtersMenu ||
        targetElement == this.filtersLink ||
        targetElement == this.mapButton
      ) {
        return; // This is a click inside. Do nothing, just return.
      }
      // Go up the DOM
      targetElement = targetElement.parentNode;
    } while (targetElement);
    this.hideFiltersContainer();
  };

  bind() {
    if (!this.filtersMenu) {
      return;
    }
    document.addEventListener("click", e => {
      let targetElement = e.target; // Clicked element
      this.handleClickInOut(targetElement);
    });
  }
}

export default FiltersMenu;
