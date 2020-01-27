import MapView from "./map_view";
import { initMapbox } from "../plugins/init_mapbox";

class FilterSpots {
  constructor() {
    this.spotsFiltersContainer = document.querySelector(".js-spots-filters");
    this.categoryFilters = document.querySelectorAll(".js-category-filter");
    this.spotResultsContainer = document.querySelector(".js-spot-results");
    this.bind();
  }

  getCheckedCategories() {
    let categories = [];
    this.categoryFilters.forEach(cat => {
      if (cat.checked) {
        categories.push(cat.dataset.category);
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
          this.spotResultsContainer.innerHTML = html;
          initMapbox();
          new MapView();
        });
      }
    );
  }

  bind() {
    if (!this.spotsFiltersContainer) {
      return;
    }
    this.categoryFilters.forEach(element =>
      element.addEventListener("change", e => {
        let categories = this.getCheckedCategories();
        let url = this.buildUrl(categories);
        this.getResults(url);
      })
    );
  }
}

export default FilterSpots;
