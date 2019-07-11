import "bootstrap";
import { ratingSlider } from "../components/rating_slider";
import { initMapbox } from "../plugins/init_mapbox";
// import "mapbox-gl/dist/mapbox-gl.css"; # Causes a warning message in the console
import { initGetAvatar } from "./github_avatar";

initMapbox();
document.addEventListener("DOMContentLoaded", initGetAvatar);
