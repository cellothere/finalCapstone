<template>
  <div id="adding">
    <div id=route>
        <router-link v-bind:to="{ name: 'build itinerary'}" id="buildAddNewButton">+Add New Itinerary</router-link>
        <button v-if="showButton" type="button" v-on:click="getAllItineraries()">Load Itineraries</button>
      </div>

    <router-view />

  <div>
    
    <h2>Itineraries</h2>
    <ul>
      <li v-for="itinerary in itineraries" :key="itinerary.itinerary_id">
        {{ itinerary.itineraryTitle }} - {{ itinerary.itineraryDate }} - {{ itinerary.startingTime }}
      </li>
    </ul>
  </div>
  </div>

    
</template>


<script>
import ItineraryService from '../services/ItineraryService.js';

export default {

  name: 'saved-itinerary',
  data() {
    return {
      itineraries: [],
      showButton: true
    }
  },
  methods: {
    getAllItineraries() {
      ItineraryService.getAllItineraries()
        .then(response => {
        console.log(response.data)
        this.itineraries = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    }
  }
}
</script>


<style>
#route {
  margin-top: 4%;
  font-size: 18px;
  
}
</style>