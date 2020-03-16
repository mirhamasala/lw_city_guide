const autocompleteDropdown = document.querySelector(
  ".autocomplete-dropdown__main"
);
const nameInput = document.querySelector(".form-group.spot_name > input");
const addressInput = document.querySelector(".form-group.spot_address > input");
const phoneInput = document.querySelector(
  ".form-group.spot_phone_number > input"
);
const websiteInput = document.querySelector(".form-group.spot_website > input");

/* AJAX on autocomplete */
if (nameInput) {
  nameInput.addEventListener("keyup", event => {
    if (event.key === "Escape" /*|| autocompleteDisabled*/) {
      resetAutocompleteDropdown();
      hideAutocompleteDropdown();
    } else {
      googleAutocomplete(nameInput.value); // make POST request to SpotAutocompletes#autocomplete
    }
  });
  /* Stop autocomplete when input field is blurred (unfocused) */
  nameInput.addEventListener("blur", () => {
    setTimeout(() => {
      /* Timeout needed otherwise you can't click on the suggestion divs */
      resetAutocompleteDropdown();
      hideAutocompleteDropdown();
    }, 200);
  });
}

const selectSuggestion = element => {
  nameInput.value = element.innerText;
  resetAutocompleteDropdown();
  hideAutocompleteDropdown();
  googlePlaceDetails(element.dataset.placeid); // Make POST request to SpotAutocompletes#place_details
};

const resetAutocompleteDropdown = () => {
  document.querySelector(".autocomplete-dropdown__main").innerHTML = "";
};

const hideAutocompleteDropdown = () => {
  autocompleteDropdown.classList.add("autocomplete-dropdown__main--invisible");
};

const showAutocompleteDropdown = () => {
  autocompleteDropdown.classList.remove(
    "autocomplete-dropdown__main--invisible"
  );
};

const googleAutocomplete = keyword => {
  // Send post request to rails server
  // Setup data to send to server (keyword and authenticity token)
  data = {};
  data["authenticity_token"] = document.querySelector(
    '[name="csrf-token"]'
  ).content;
  data["keyword"] = keyword;
  const xhr = new XMLHttpRequest();
  // onload is an async function that is triggered when server responds
  xhr.onload = function() {
    let predictions = JSON.parse(this.responseText);
    if (predictions !== null) {
      resetAutocompleteDropdown();
      injectPredictions(predictions);
      showAutocompleteDropdown();
    }
  };
  // Send post request
  xhr.open("POST", "/spot_autocompletes/autocomplete");
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send(JSON.stringify(data));
};

const injectPredictions = predictions => {
  predictions.forEach((prediction, index) => {
    const title = prediction.structured_formatting.main_text;
    const description = prediction.description;
    const placeId = prediction.place_id;
    let autocompleteElement = `<div data-placeid="${placeId}" onclick="selectSuggestion(this)">${description}</div>`;
    autocompleteDropdown.insertAdjacentHTML("beforeend", autocompleteElement);
  });
};

const googlePlaceDetails = placeId => {
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
    injectPlaceDetails(placeDetails);
  };
  // Send post request
  xhr.open("POST", "/spot_autocompletes/place_details");
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send(JSON.stringify(data));
};

const injectPlaceDetails = placeDetails => {
  nameInput.value =
    typeof placeDetails.name === "undefined" ? "" : placeDetails.name;
  addressInput.value =
    typeof placeDetails.formatted_address === "undefined"
      ? ""
      : placeDetails.formatted_address;
  phoneInput.value =
    typeof placeDetails.formatted_phone_number === "undefined"
      ? ""
      : placeDetails.formatted_phone_number;
  websiteInput.value =
    typeof placeDetails.website === "undefined" ? "" : placeDetails.website;
};

/* Export function so it's accessible */
window.selectSuggestion = selectSuggestion;
