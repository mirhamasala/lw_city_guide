const autocompleteDropdown = document.querySelector(".autocomplete-dropdown__main");
const nameInput = document.querySelector(".form-group.string.required.spot_name > input");

/* AJAX on autocomplete */
nameInput.addEventListener("keyup", () => {
  console.log(nameInput.value);
  /* make POST request to SpotAutocompletes#run */
});

const selectSuggestion = (element) => {
  nameInput.value = element.innerText;
  resetAutocompleteDropdown();
  hideAutocompleteDropdown();
};

const resetAutocompleteDropdown = () => {
  document.querySelector(".autocomplete-dropdown__main").innerHTML = "";
};

const hideAutocompleteDropdown = () => {
  autocompleteDropdown.classList.add("autocomplete-dropdown--invisible");
};

const googleAutocomplete = () => {

}

/* export function so its accessible */
window.selectSuggestion = selectSuggestion;
