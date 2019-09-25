# More Code

## Using Cloudinary Images as Background Images

```html
<!--app/views/cities/show.html.erb-->

<div class="spots__header" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('<%= cl_image_path "city_guide/barcelona.jpg", height: 300, width: 400, crop: :fill %>')">
```

or

```
<div class="spots__header" style="background-image: linear-gradient(rgba(0,0,0,0.3), rgba(0,0,0,0.2)), url('<%= cl_image_path @city.photo, height: 300, width: 400, crop: :fill %>')">
```

## Mapbox Other Solution

```JavaScript
// app.js
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// init_mapbox.js
import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
```

Source: https://gist.github.com/Eschults/d82b1d481eac8639dbf5f70b895f11b0

## SVG as background image

```
<div class="cities__header" style="background-image: url('<%= image_path "cities_background.svg" %>')">
```

## AJAXify Fire Rating

Lars: If you ajaxify this it’ll be a little different from usual, because the rating is submitted when you release the slider. You'll need to rerender the partial and execute the JS again to attach the event listeners.
