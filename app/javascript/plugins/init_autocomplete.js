import places from 'places.js';

const initAutocomplete = () => {
  const locationInput = document.getElementById('location');
  if (locationInput) {
    places({ container: locationInput });
  }
};

export { initAutocomplete };

//This function will target the container for our CAR NEW LOCATION INPUT