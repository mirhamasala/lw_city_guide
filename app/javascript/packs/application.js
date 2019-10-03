import "bootstrap";
import { ratingSlider } from "../components/rating_slider";
import { initMapbox } from "../plugins/init_mapbox";
import { initGetAvatar } from "./github_avatar";
import { initAutocomplete } from "../plugins/init_autocomplete";

document.addEventListener("DOMContentLoaded", initGetAvatar);
initMapbox();
initAutocomplete();
