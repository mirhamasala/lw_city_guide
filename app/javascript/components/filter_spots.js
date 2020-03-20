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
    this.spotsMap = document.querySelector(".js-spots-results-map");
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
    let baseUrl = this.spotsFiltersContainer.dataset.baseUrl;
    if (categories.length > 0) {
      return baseUrl + "?categories=" + categories.join(",");
    } else {
      return baseUrl;
    }
  }

  getResults(mapHidden) {
    let url = this.buildUrl(this.getCheckedCategories());
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
          this.spotsResultsContainer.innerHTML = html;
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

  isMapHidden = () =>
    this.spotsMap.classList.contains("spots-results__map--hidden");

  bind() {
    if (!this.spotsFiltersContainer) {
      return;
    }
    this.categoryCheckboxes.forEach(element =>
      element.addEventListener("change", e => {
        this.getResults(this.isMapHidden());
      })
    );
    this.clearFiltersLink.addEventListener("click", e => {
      this.clearFilters();
      this.getResults(this.isMapHidden());
    });
  }
}

export default FilterSpots;
