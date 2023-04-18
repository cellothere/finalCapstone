<template>
    <div class='list'>
        <itinerary-card v-for="destination in itinerary" v-bind:key="destination.id" v-bind:id="destination.id" />
    </div>
</template>

<script>
import itineraryCard from '../components/ItineraryCard.vue'
import itineraryService from '../services/ItineraryService.js'

export default {
    components: {
        itineraryCard,
    },
    data () {
        return {
        favorites: [],
        }
    },
    created() {
        itineraryService.getAllItineraries().then((response) => {
         this.favorites = response.data;
    });
    let userId = this.$store.state.user.id
    itineraryService
        .getActivitiesByUserIdAndItineraryId(userId, this.favorites.id)
        .then((response) => {
            this.favorites = response.data;
    });
  }
}
</script>

<style>

</style>