import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000"
});

export default {

  getAllItineraries() {
      return http.get('/itinerary');
    },
  
  getItinerariesByItineraryId(itineraryId) {
    return http.get(`itinerary/${itineraryId}/all`)
  },

  getItineraryByUserAndItinerary(userId, itineraryId) {
    return http.get(`/itinerary/${userId}/${itineraryId}/thingToDo`);
  },

  createItinerary(itinerary, userId) {
    return http.post(`/itinerary/${userId}/create`)
  }
  }