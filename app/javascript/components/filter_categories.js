// Returns IDs of selected categories as array of strings
const filterCategories = (categories) => {
  let selectedCategoryIds = [];
  categories.forEach(category => {
    category.addEventListener("click", (event) => {
      const selectedCategoryId = parseInt(event.currentTarget.dataset["id"]);
      if (selectedCategoryIds.includes(selectedCategoryId)) {
        selectedCategoryIds = selectedCategoryIds.filter(id => id != selectedCategoryId);
      } else {
        selectedCategoryIds.push(selectedCategoryId);
      }
      console.log(selectedCategoryIds);
      filterSpots(selectedCategoryIds);
    });
  });
}


const filterSpots = (selectedCategoryIds) => {
  console.log("now it works a little bit more");
  // filter spots and insert html for each spot into #spot__card
  const spotsDiv = document.getElementById("spot__card");
  spotsDiv.innerHTML = '';
  const spotsJSON = document.querySelector("[data-spots]");
  const spots = JSON.parse(spotsJSON.dataset["spots"]);
  const filteredSpots = spots.filter(spot => {
    console.log("and... a little bit more");
    return selectedCategoryIds.includes(spot.category_id);
  });
  filteredSpots.forEach(spot => {

    const spotCodeStart = "<div class='spots__card-wrapper'><div class='spot-card'>";
    const spotLink = `<a class="spot-card__link-wrapper" href="/spots/${spot.id}">`;
    const spotImg = `<img class="spot-card__image" src="${spot.photo['url']}">`;
    const spotText = "<div class='spot-card__text'>";
    const spotSubCat = `<p class="spot-card__sub-category">${spot.sub_category}</p>`;
    const spotHeader = `<p class="spot-card__header">${spot.name}</p>`;
    const spotCodeEnd = "</div></a></div></div>";

    const spotCode = spotCodeStart + spotLink + spotImg + spotText + spotSubCat + spotHeader + spotCodeEnd;
    spotsDiv.insertAdjacentHTML("afterbegin", spotCode);
  });
}

export { filterCategories }



