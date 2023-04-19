<template>
  <div id="adding">
    <div id="route">
    </div>
    <br>
    <br>
    <div class="itinerary-container" v-for="itinerary in itineraries" :key="itinerary.itinerary_id" v-on:click="goToItinerary(itinerary.itinerary_id)">
      <h2 class="itinerary-title">{{ itinerary.itineraryTitle }}</h2>
      <p class="itinerary-date">{{ itinerary.itineraryDate }} - {{ itinerary.startingTime }}</p>
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
      destinations: [],
      showButton: true,
      selectedItineraryId: 22,
      
    }
  },
  methods: {

    goToItinerary(itineraryId){
      let userId = this.$store.state.user.id
      this.$router.push({ name: 'build itinerary', params: { userId: userId, itineraryId: itineraryId}})
    }
  },
  created() {
   
      let userId = this.$store.state.user.id
      ItineraryService.getAllItinerariesByUserId(userId)
        .then(response => {
          console.log(response.data)
          this.itineraries = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    }
}
</script>

<style>
#route {
  margin-top: 4%;
  font-size: 18px;
}

#adding {
  background-image: url(../../assets/CleTOursArUs.jpg) ;
  background-attachment:scroll;
  background-position: center;
  background-position:;
  background-size: cover;
  height: 100vh;
  width: 100vw;
}

.itinerary-container {
  border: 1px solid #ccc;
  margin-bottom: 20px;
  padding: 10px;
  width: 40%;
  background-color: rgb(230, 230, 230);
  border-radius: 10px;
  margin-left: 1%;
}

.itinerary-title {
  margin-top: 0;
}

.itinerary-date {
  margin-bottom: 0;
}
</style>