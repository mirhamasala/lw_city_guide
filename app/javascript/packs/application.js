import "bootstrap";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import { initMapbox } from "../plugins/init_mapbox";

// Components
import { ratingSlider } from "../components/rating_slider";
import { } from "../components/spot_autocomplete_dropdown";
import FiltersMenu from "../components/filters_menu";
import FilterSpots from "../components/filter_spots";
import MapView from "../components/map_view";

// Initialize
initAutocomplete();
initCloudinary();
initMapbox();

new FiltersMenu();
new FilterSpots();
new MapView();
