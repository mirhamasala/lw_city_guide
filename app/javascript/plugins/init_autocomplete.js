import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.spot_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
