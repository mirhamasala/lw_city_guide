import mapboxgl from "mapbox-gl";

const mapElement = document.getElementById("map");
const mapViewBtn = document.querySelector(".js-map-view-btn");

const buildMap = () => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: "map",
    style: "mapbox://styles/mapbox/light-v9"
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement("div");

    element.className = "marker";
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = "contain";
    element.style.backgroundRepeat = "no-repeat";
    element.style.width = "32px";
    element.style.height = "32px";

    new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
};

const toggleMapView = () => {
  const mapOverlay = document.querySelector(".js-map-overlay");
  if (mapOverlay.style.display === "none") {
    mapOverlay.style.display = "block";
    mapViewBtn.classList.add("clicked");
    if (mapElement) {
      const map = buildMap();
      const markers = JSON.parse(mapElement.dataset.markers);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  } else {
    mapOverlay.style.display = "none";
    mapViewBtn.classList.remove("clicked");
  }
}

const initMapbox = () => {
  if (!mapViewBtn) {
    return;
  } else {
    mapViewBtn.addEventListener("click", toggleMapView);
  }
};

export { initMapbox };
