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
  getAllItinerariesByUserId(userId) {
    return http.get(`/itinerary/${userId}/all`)
  },
    getItineraryByUserAndItinerary(userId, itineraryId) {
      return http.get(`/itinerary/${userId}/${itineraryId}`);
    },
  saveItineraryInfo(userId, itinerary) {
    return http.post(`/itinerary/${userId}/create`, itinerary)
  },
  saveItineraryDestinations(userId, itineraryId, arrayOfLandmarkIds){
    return http.post(`/itinerary/${userId}/${itineraryId}/`, arrayOfLandmarkIds)
  },
  deleteItinerary(userId, itineraryId) {
    return http.delete(`/itinerary/${userId}/${itineraryId}`)
  },
  getAllItineraryActivities(userId, itineraryId) {
    return http.get(`/itinerary/${userId}/${itineraryId}/thingToDo`)
  }
}