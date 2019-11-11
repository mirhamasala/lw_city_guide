const filters = document.querySelector(".js-filters");

const showFilters = () => filters.style.display = "block";

const hideFilters = () => filters.style.display = "none";

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
