import axios from 'axios';

const http = axios.create({
  baseURL: "http://localhost:9000"
});

export default {

  getDestinations() {
    return http.get('/thingsToDo');
  },
  getDestinationById() {
    return http.get('/ENDPOINT');
  }
}