import "bootstrap";
import "mapbox-gl/dist/mapbox-gl.css";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import { initMapbox } from "../plugins/init_mapbox";

// Components
import { ratingSlider } from "../components/rating_slider";
import { } from "../components/spot_autocomplete_dropdown";
import FiltersOverlay from "../components/filters_overlay";
import FilterSpots from "../components/filter_spots";
import MapView from "../components/map_view";

// Initialize
initAutocomplete();
initCloudinary();
initMapbox();

new FiltersOverlay();
new FilterSpots();
new MapView();
