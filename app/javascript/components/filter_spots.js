import MapView from "./map_view";
import { initMapbox } from "../plugins/init_mapbox";

class FilterSpots {
  constructor() {
    this.spotsFiltersContainer = document.querySelector(".js-filters-main");
    this.categoryCheckboxes = document.querySelectorAll(".js-filters-checkbox");
    this.clearFiltersLink = document.querySelector(".js-filters-clear-all");
    this.spotsResultsContainer = document.querySelector(
      ".js-spots-results-container"
    );
    this.cardsGridContainer = document.querySelector(".js-spots-cards-grid");
    this.spotsMap = document.querySelector(".js-spots-results-map");
    this.currentPage = 1;
    this.lastPage = Number(this.cardsGridContainer.dataset.lastPage);
    this.bind();
  }

  getCheckedCategories() {
    let categories = [];
    this.categoryCheckboxes.forEach(box => {
      if (box.checked) {
        categories.push(box.dataset.category);
      }
    });
    return categories;
  }

  buildUrl(categories) {
    this.currentPage += 1;
    let baseUrl = this.spotsFiltersContainer.dataset.baseUrl;
    if (categories.length > 0) {
      return (
        baseUrl +
        "?categories=" +
        categories.join(",") +
        "&page=" +
        this.currentPage
      );
    } else {
      return baseUrl + "?page=" + this.currentPage;
    }
  }

  getResults(url, mapHidden) {
    // console.log(this.currentPage);
    if (this.currentPage > this.lastPage) {
      this.currentPage = this.lastPage;
      return;
    }
    console.log(url);
    fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } }).then(
      response => {
        response.text().then(html => {
          if (!mapHidden) {
            html = html.replace(
              "spots-results__map--hidden",
              "spots-results__map"
            );
            html = html.replace(
              "spots-results__cards",
              "spots-results__cards--hidden"
            );
          }
          this.cardsGridContainer.insertAdjacentHTML("beforeend", html);
          initMapbox();
          new MapView();
        });
      }
    );
  }

  clearFilters() {
    this.categoryCheckboxes.forEach(box => {
      box.checked = false;
    });
  }

  clearCards() {
    this.cardsGridContainer.innerHTML = "";
  }

  isMapHidden = () =>
    this.spotsMap.classList.contains("spots-results__map--hidden");

  bind() {
    window.addEventListener("scroll", () => {
      if (
        window.innerHeight + window.scrollY >=
        document.body.scrollHeight - 300
      ) {
        let categories = this.getCheckedCategories();
        let url = this.buildUrl(categories);
        this.getResults(url);
      }
    });
    if (!this.spotsFiltersContainer) {
      return;
    }
    this.categoryCheckboxes.forEach(element =>
      element.addEventListener("change", e => {
        this.clearCards();
        this.currentPage = 0;
        let categories = this.getCheckedCategories();
        let url = this.buildUrl(categories);
        this.getResults(url, this.isMapHidden());
      })
    );
    this.clearFiltersLink.addEventListener("click", e => {
      this.clearCards();
      this.currentPage = 0;
      this.clearFilters();
      let categories = this.getCheckedCategories();
      let url = this.buildUrl(categories);
      this.getResults(url, this.isMapHidden());
    });
  }
}

export default FilterSpots;
