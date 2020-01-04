import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import { initMapbox } from "../plugins/init_mapbox";

// Components
import { ratingSlider } from "../components/rating_slider";
import { } from "../components/spot_autocomplete_dropdown";

import Filters from "../components/filters";
import ToggleMapView from "../components/toggle_map_view";

// Initialize

initAutocomplete();
initCloudinary();
initMapbox();

new ToggleMapView();
new Filters();
