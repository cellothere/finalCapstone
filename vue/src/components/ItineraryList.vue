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
        destinations: [],
        }
    },
    created() {
    itineraryService
        .getActivitiesByUserIdAndItineraryId(this.$route.params.userId, this.$route.params.itineraryId)
        .then((response) => {
            this.destinations = response.data;
    });
  },
}
</script>

<style>

</style>