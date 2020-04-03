import places from "places.js";

class Autocomplete {
  constructor() {
    const addressInput = document.getElementById("spot_address");
    if (addressInput) {
      places({ container: addressInput });
    }
  }
}

export default Autocomplete;
