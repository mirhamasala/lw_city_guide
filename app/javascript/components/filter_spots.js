import ToggleMapView from "./toggle_map_view";
import { initMapbox } from "../plugins/init_mapbox";

class FilterSpots {
  constructor() {
    this.spotFiltersContainer = document.querySelector(".js-spots-filters");
    this.spotFilters = this.spotFiltersContainer.querySelectorAll(".js-spot-filter");
    this.spotCards = document.querySelector(".js-spots-cards");

    this.baseUrl = this.spotFiltersContainer.dataset.baseUrl;

    this.bind();
  }

  getCheckedCategories() {
    let categories = [];
    this.spotFilters.forEach(cat => {
      if(cat.checked) {
        categories.push(cat.dataset.category)
      }
    })
    return categories;
  }

  buildUrl(categories) {
    if(categories.length > 0) {
      return this.baseUrl + "?categories=" + categories.join(",")
    } else {
      return this.baseUrl;
    }
  }

  getResults(url) {
    fetch(url, {"headers": {"X-Requested-With": "XMLHttpRequest"}})
      .then(response => {
        response.text().then(html => {
          this.spotCards.innerHTML = html;
          initMapbox();
          new ToggleMapView();
        });
      });
  }

  bind() {
    if(!this.spotFiltersContainer) {
      return;
    }

    this.spotFilters.forEach(element => element.addEventListener("change", (e) => {
      let categories = this.getCheckedCategories();
      let url = this.buildUrl(categories);

      this.getResults(url);
    }));
  }
}

export default FilterSpots;
