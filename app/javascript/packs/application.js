import "bootstrap";

// --------------------------------------------------------------
// JS Plugins
// --------------------------------------------------------------

import Autocomplete from "../plugins/autocomplete";
import Cloudinary from "../plugins/cloudinary";
import Map from "../plugins/map";

// --------------------------------------------------------------
// JS Components
// --------------------------------------------------------------

import {} from "../components/spot_autocomplete_dropdown";
import Filters from "../components/filters";
import FiltersMenu from "../components/filters_menu";
import FilterSpots from "../components/filter_spots";
import MapView from "../components/map_view";
import RatingSlider from "../components/rating_slider";

// --------------------------------------------------------------
// Initialize JS Plugins
// --------------------------------------------------------------

new Autocomplete();
new Cloudinary();
new Map();

// --------------------------------------------------------------
// Initialize JS Components
// --------------------------------------------------------------

new Filters();
new FiltersMenu();
new FilterSpots();
new MapView();
new RatingSlider();
