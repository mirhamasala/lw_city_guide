import "bootstrap";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import { initMapbox } from "../plugins/init_mapbox";

// Components
import {} from "../components/spot_autocomplete_dropdown";
import Filters from "../components/filters";
import FiltersMenu from "../components/filters_menu";
import FilterSpots from "../components/filter_spots";
import MapView from "../components/map_view";
import RatingSlider from "../components/rating_slider";

// Initialize
initAutocomplete();
initCloudinary();
initMapbox();

new Filters();
new FiltersMenu();
new FilterSpots();
new MapView();
new RatingSlider();
