const filters = document.querySelector(".js-filters");
const mapViewBtn = document.querySelector(".js-map-view-btn");

const showFilters = () => {
  mapViewBtn.style.display = "none";
  filters.style.display = "block";
}

const hideFilters = () => {
  mapViewBtn.style.display = "block";
  filters.style.display = "none";
}

const initFilter = () => {
  if (!filters) {
    return;
  }
  const showFiltersBtn = document.querySelector(".js-filter-show");
  const closeFiltersBtn = document.querySelector(".js-filter-close");
  showFiltersBtn.addEventListener("click", showFilters);
  closeFiltersBtn.addEventListener("click", hideFilters);
}

export { initFilter };
