import "bootstrap";
import { ratingSlider } from "../components/rating_slider";
import { initMapbox } from "../plugins/init_mapbox";
import { initGetAvatar } from "../components/github_avatar";
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";

document.addEventListener("DOMContentLoaded", initGetAvatar);

initMapbox();
initAutocomplete();
initCloudinary();
