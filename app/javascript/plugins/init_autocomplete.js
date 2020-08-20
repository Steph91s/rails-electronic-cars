const initAutocomplete = () => {
  const locationInput = document.getElementById('car-location');
  if (locationInput) {
    const places = require('places.js');
    const placesAutocomplete = places({
      appId: 'plPSK1QHWYQ8',
      apiKey: '3bbb74fad2eceb04f8af13ffc7514744',
      container: locationInput
    });
  }
};

export { initAutocomplete };

//This function will target the container for our CAR NEW LOCATION INPUT