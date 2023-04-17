import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000"
});

export default {

  getActivitiesByUserIdAndItineraryId(userId, itineraryId) {
    return http.get(`itinerary/${userId}/${itineraryId}/thingToDo`);
  }
}