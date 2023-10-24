import { application } from "controllers/application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

// Eager load all controllers defined in the import map under controllers/**/*_controller
eagerLoadControllersFrom("controllers", application);

//  this is used to calculate the distince for each location
const getUserLocation = (callback) => {
  if ("geolocation" in navigator) {
    navigator.geolocation.getCurrentPosition((position) => {
      callback(position.coords.latitude, position.coords.longitude);
    });
  } else {
    console.error("Geolocation not supported");
  }
};

// Function to calculate distance using Haversine formula
// Found this https://stackoverflow.com/questions/14560999/using-the-haversine-formula-in-javascript 
// seems to work pretty good, probably should find a library
const calculateDistance = (lat1, lon1, lat2, lon2) => {
  const R = 6371; // Earth radius in kilometers
  const dLat = deg2rad(lat2 - lat1);
  const dLon = deg2rad(lon2 - lon1);
  const a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
  const d = R * c; // Distance in km
  return d * 0.621371; // Convert km to miles
};

const deg2rad = (deg) => deg * (Math.PI / 180);

// Function to update the distance display and filter agencies
const updateDisplayAndFilter = (userLat, userLon) => {
  $(".agency").each(function() {
    const serviceLat = $(this).data("latitude");
    const serviceLon = $(this).data("longitude");
    const distance = calculateDistance(userLat, userLon, serviceLat, serviceLon);
    $(this).find('.distance-display').text(distance.toFixed(2));
    $(this).data('distance', distance); // store the distance in a data attribute for filtering
  });

  // Event listener for the dropdown change
  $("#filterDistance").change(function() {
    filterAgenciesByDistance($(this).val());
  });
};

const filterAgenciesByDistance = (maxDistance) => {
  if (maxDistance === "all") {
    $(".agency").parent('a').show();
  } else {
    $(".agency").each(function() {
      const serviceDistance = parseFloat($(this).data('distance'));
      $(this).parent('a').toggle(serviceDistance <= maxDistance);
    });
  }
};

$(document).ready(function() {
  getUserLocation(updateDisplayAndFilter);
});
