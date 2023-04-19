<template>
      <div class="itinerary-container" v-on:click="goToItinerary()">
        <h2 class="itinerary-title">{{ itinerary.itineraryTitle }}</h2>
         <p class="itinerary-date">{{ itinerary.itineraryDate }} - {{ itinerary.startingTime }}</p>
    </div>
</template>

<script>
import ItineraryService from '../services/ItineraryService.js';

export default {
  name: 'saved-itinerary',
  props: ['id',],
  data() {
    return {
        itinerary: {}
    }
  }, 
  methods: {
    goToItinerary(){
      let userId = this.$store.state.user.id
      let itineraryId = this.$route.params.itineraryId
      this.$router.push({ name: 'build itinerary', params: { userId: userId, itineraryId: itineraryId}})

    }
  },
  
  created() {
    let userId = this.$store.state.user.id
      ItineraryService.getItineraryByUserAndItinerary(userId, id)
        .then(response => {
          console.log(response.data)
          this.itinerary = response.data;
        })
        .catch(error => {
          console.log(error);
        });
    },
}
</script>

<style>

</style>