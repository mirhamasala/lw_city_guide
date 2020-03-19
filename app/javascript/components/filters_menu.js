class FiltersMenu {
  constructor() {
    this.filtersContainer = document.querySelector(
      ".js-spots-filters-container"
    );
    this.filtersMenu = document.querySelector(".filters");
    this.bind();
  }

  handleClickInOut = targetElement => {
    do {
      if (targetElement == this.filtersMenu) {
        console.log("Inside!");
        return; // This is a click inside. Do nothing, just return.
      }
      // Go up the DOM
      targetElement = targetElement.parentNode;
      debugger;
    } while (targetElement);
    console.log("Outside!");
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
