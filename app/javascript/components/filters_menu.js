class FiltersMenu {
  constructor() {
    this.filtersMenu = document.querySelector(".js-filters-menu");
    this.filtersButton = document.querySelector(".js-filters-button");
    this.bind();
  }

  toggleFiltersMenu() {
    this.filtersMenu.classList.toggle("spots__filters-menu--hide");
  }

  bind() {
    if (!this.filtersMenu) {
      return;
    }
    this.filtersButton.addEventListener("click", () => {
      this.toggleFiltersMenu();
    });
  }
}

export default FiltersMenu;
