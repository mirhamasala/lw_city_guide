import "bootstrap";
import { ratingSlider } from "../components/rating_slider";
import { initMapbox } from "../plugins/init_mapbox";
import { initGetAvatar } from "../components/github_avatar";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import ToggleMapView from "../components/toggle_map_view";
import Filters from "../components/filters";
import { filterCategories } from "../components/filter_categories";

document.addEventListener("DOMContentLoaded", initGetAvatar);

initMapbox();
initAutocomplete();
initCloudinary();

const allCategories = document.querySelectorAll("[data-id]");
if (allCategories) {
  console.log("it kinda works");
  filterCategories(allCategories);
}

new ToggleMapView();
new Filters();
