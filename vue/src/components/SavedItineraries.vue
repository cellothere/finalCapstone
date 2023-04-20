<template>
  <div id="adding">
    <div id="route">
    </div>
    <br>
    <br>
    <h1> Saved Itineraries </h1>
    <saved-itinerary v-for="itinerary in itineraries" :key="itinerary.itineraryId" v-bind:id="itinerary.id"/>

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
    }
  },
  methods: {

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

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

#route {
  margin-top: 4%;
  font-size: 18px;
}

saved-itinerary {
  z-index: 999;
}

h1 {
  margin-left: 15%;
}
#adding {
  background-image: url(../../assets/CleTOursArUs.jpg) ;
  background-attachment:scroll;
  background-position: center;
  background-position:;
  background-size: cover;
  height: 100vh;
  width: 100vw;
  font-family: 'Poppins';
}

.itinerary-container {
  border: 1px solid #ccc;
  margin-bottom: 20px;
  padding: 10px;
  width: 35%;
  background-color: rgb(230, 230, 230);
  border-radius: 10px;
  margin-left: 4%;
  text-align: center;
}

.itinerary-title {
  margin-top: 0;
}

.itinerary-date {
  margin-bottom: 0;
}
</style>
