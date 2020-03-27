import "bootstrap";

// Plugins
import { initAutocomplete } from "../plugins/init_autocomplete";
import { initCloudinary } from "../plugins/init_cloudinary";
import { initMapbox } from "../plugins/init_mapbox";

// Components
import { ratingSlider } from "../components/rating_slider";
import {} from "../components/spot_autocomplete_dropdown";
import Filters from "../components/filters";
import FilterSpots from "../components/filter_spots";
import LazyLoading from "../components/lazy_loading";
import MapView from "../components/map_view";

// Initialize
initAutocomplete();
initCloudinary();
initMapbox();

new Filters();
new FilterSpots();
new LazyLoading();
new MapView();
