import mapboxgl from "mapbox-gl";

class Map {
  constructor() {
    this.mapElement = document.getElementById("map");
    this.bind();
  }

  currentStyle = () => {
    const themeLight = new RegExp(/theme=light/g);
    if (themeLight.test(document.cookie)) {
      return "mapbox://styles/mapbox/light-v9";
    }
    return "mapbox://styles/mapbox/dark-v10";
  };

  buildMap = () => {
    mapboxgl.accessToken = this.mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
      container: "map",
      style: this.currentStyle(),
    });
  };

  addMarkersAndInfoWindowsToMap = (map, markers) => {
    const mapOnSpotShowPage = document.querySelector(".js-spot-map");
    markers.forEach(marker => {
      const element = document.createElement("div");
      element.innerHTML = marker.locationMarker;

      // Don't add info windows for map on spot show page
      if (mapOnSpotShowPage) {
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .addTo(map);
      } else {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
        new mapboxgl.Marker(element)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      }
    });
  };

  fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  bind() {
    if (this.mapElement) {
      const map = this.buildMap();
      const markers = JSON.parse(this.mapElement.dataset.markers);
      this.addMarkersAndInfoWindowsToMap(map, markers);
      this.fitMapToMarkers(map, markers);
    }
  }
}

export default Map;
