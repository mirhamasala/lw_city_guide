import { map, addMarkersAndInfoWindowsToMap } from "../plugins/init_mapbox";

class LazyLoading {
  constructor() {
    this.loadMoreButton = document.querySelector(".js-load-more-button");
    this.spotsCardsGrid = document.querySelector(".js-cards-grid");
    this.markers = document.getElementsByClassName("js-data-markers");
    this.currentPage = 1;
    this.lastPage;
    this.bind();
  }

  buildUrl() {
    let baseUrl = this.loadMoreButton.dataset.baseUrl;
    baseUrl += `?page=${this.currentPage}&cards_only=true`;
    return baseUrl;
  }

  async lazyLoadSpots(url) {
    const res = await fetch(url, {
      headers: { "X-Requested-With": "XMLHttpRequest" },
    });

    const html = await res.text();

    this.spotsCardsGrid.insertAdjacentHTML("beforeend", html);

    if (this.markers[this.currentPage - 1]) {
      const newMarkers = JSON.parse(
        this.markers[this.currentPage - 1].dataset.markers
      );
      addMarkersAndInfoWindowsToMap(map, newMarkers);
    }
  }

  bind() {
    if (!this.loadMoreButton) {
      return;
    }
    this.lastPage = parseInt(this.loadMoreButton.dataset.totalPages);

    this.loadMoreButton.addEventListener("click", () => {
      if (this.currentPage < this.lastPage) {
        this.currentPage += 1;
        const url = this.buildUrl();
        this.lazyLoadSpots(url);
      }
    });
  }
}

export default LazyLoading;
