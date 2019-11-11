const filterOverlay = document.querySelector(".filter__overlay");

const showFilters = () => filterOverlay.style.display = "block";

const hideFilters = () => filterOverlay.style.display = "none";

const initFilter = () => {
  if (!filterOverlay) {
    return;
  }
  const filterNav = document.querySelector(".filter__nav");
  const filterCloseBtn = document.querySelector(".filter__close");
  filterNav.addEventListener("click", showFilters);
  filterCloseBtn.addEventListener("click", hideFilters);
}

export { initFilter };
