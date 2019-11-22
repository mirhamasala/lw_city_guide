import "bootstrap";
import { ratingSlider } from "../components/rating_slider";
import { initMapbox } from "../plugins/init_mapbox";
import { initGetAvatar } from "../components/github_avatar";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import ToggleMapView from "../components/toggle_map_view";
import Filters from "../components/filters";

document.addEventListener("DOMContentLoaded", initGetAvatar);

initMapbox();
initAutocomplete();
initCloudinary();

new ToggleMapView();
new Filters();
