import "bootstrap";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";

// Components
import {} from "../components/spot_autocomplete_dropdown";
import Filters from "../components/filters";
import FiltersMenu from "../components/filters_menu";
import FilterSpots from "../components/filter_spots";
import Map from "../plugins/map";
import MapView from "../components/map_view";
import RatingSlider from "../components/rating_slider";

// Initialize
initAutocomplete();
initCloudinary();

new Filters();
new FiltersMenu();
new FilterSpots();
new Map();
new MapView();
new RatingSlider();
