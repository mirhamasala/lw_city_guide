class AutocompleteDropdown {
  constructor() {
    this.autocompleteDropdown = document.querySelector(
      ".autocomplete-dropdown__main"
    );
    this.nameInput = document.querySelector(".form-group.spot_name > input");
    this.addressInput = document.querySelector(
      ".form-group.spot_address > input"
    );
    this.phoneInput = document.querySelector(
      ".form-group.spot_phone_number > input"
    );
    this.websiteInput = document.querySelector(
      ".form-group.spot_website > input"
    );
    this.resetAutocompleteDropdown = this.resetAutocompleteDropdown.bind(this);
    this.bind();
  }

  selectSuggestion = element => {
    this.nameInput.value = element.innerText;
    this.resetAutocompleteDropdown();
    this.hideAutocompleteDropdown();
    this.googlePlaceDetails(element.dataset.placeid); // Make POST request to SpotAutocompletes#place_details
  };

  resetAutocompleteDropdown = () => {
    document.querySelector(".autocomplete-dropdown__main").innerHTML = "";
  };

  hideAutocompleteDropdown = () => {
    this.autocompleteDropdown.classList.add(
      "autocomplete-dropdown__main--invisible"
    );
  };

  showAutocompleteDropdown = () => {
    this.autocompleteDropdown.classList.remove(
      "autocomplete-dropdown__main--invisible"
    );
  };

  googleAutocomplete = keyword => {
    // Send post request to rails server
    // Setup data to send to server (keyword and authenticity token)
    const data = {};
    data["authenticity_token"] = document.querySelector(
      '[name="csrf-token"]'
    ).content;
    data["keyword"] = keyword;
    const xhr = new XMLHttpRequest();
    // onload is an async function that is triggered when server responds
    xhr.onload = function() {
      let predictions = JSON.parse(this.responseText);
      if (predictions !== null) {
        this.resetAutocompleteDropdown();
        this.injectPredictions(predictions);
        this.showAutocompleteDropdown();
      }
    };
    // Send post request
    xhr.open("POST", "/spot_autocompletes/autocomplete");
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify(data));
  };

  injectPredictions = predictions => {
    predictions.forEach((prediction, index) => {
      const title = prediction.structured_formatting.main_text;
      const description = prediction.description;
      const placeId = prediction.place_id;
      let autocompleteElement = `<div data-placeid="${placeId}" onclick="selectSuggestion(this)">${description}</div>`;
      this.autocompleteDropdown.insertAdjacentHTML(
        "beforeend",
        autocompleteElement
      );
    });
  };

  googlePlaceDetails = placeId => {
    // Send post request to rails server
    // Setup data to send to server (placeId and authenticity token)
    data = {};
    data["authenticity_token"] = document.querySelector(
      '[name="csrf-token"]'
    ).content;
    data["placeid"] = placeId;
    const xhr = new XMLHttpRequest();
    // onload is an async function that is triggered when server responds
    xhr.onload = function() {
      // onload = server response
      let placeDetails = JSON.parse(this.responseText);
      this.injectPlaceDetails(placeDetails);
    };
    // Send post request
    xhr.open("POST", "/spot_autocompletes/place_details");
    xhr.setRequestHeader("Content-type", "application/json");
    xhr.send(JSON.stringify(data));
  };

  injectPlaceDetails = placeDetails => {
    this.nameInput.value =
      typeof placeDetails.name === "undefined" ? "" : placeDetails.name;
    this.addressInput.value =
      typeof placeDetails.formatted_address === "undefined"
        ? ""
        : placeDetails.formatted_address;
    this.phoneInput.value =
      typeof placeDetails.formatted_phone_number === "undefined"
        ? ""
        : placeDetails.formatted_phone_number;
    this.websiteInput.value =
      typeof placeDetails.website === "undefined" ? "" : placeDetails.website;
  };

  bind() {
    if (!this.nameInput) {
      return;
    }
    // this.selectSuggestion();
    /* AJAX on autocomplete */
    this.nameInput.addEventListener("keyup", event => {
      if (event.key === "Escape" /* || autocompleteDisabled */) {
        this.resetAutocompleteDropdown();
        this.hideAutocompleteDropdown();
      } else {
        this.googleAutocomplete(this.nameInput.value); // make POST request to SpotAutocompletes#autocomplete
      }
    });
    /* Stop autocomplete when input field is blurred (unfocused) */
    this.nameInput.addEventListener("blur", () => {
      setTimeout(() => {
        /* Timeout needed otherwise you can't click on the suggestion divs */
        this.resetAutocompleteDropdown();
        this.hideAutocompleteDropdown();
      }, 200);
    });
  }
}

export default AutocompleteDropdown;
/* Export function so it's accessible */
// window.selectSuggestion = selectSuggestion;
