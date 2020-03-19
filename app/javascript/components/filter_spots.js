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

  getResults(url) {
    fetch(url, { headers: { "X-Requested-With": "XMLHttpRequest" } }).then(
      response => {
        response.text().then(html => {
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

  bind() {
    if (!this.spotsFiltersContainer) {
      return;
    }
    this.categoryCheckboxes.forEach(element =>
      element.addEventListener("change", e => {
        let categories = this.getCheckedCategories();
        let url = this.buildUrl(categories);
        this.getResults(url);
      })
    );
    this.clearFiltersLink.addEventListener("click", e => {
      this.clearFilters();
      let categories = this.getCheckedCategories();
      let url = this.buildUrl(categories);
      this.getResults(url);
    });
  }
}

export default FilterSpots;
