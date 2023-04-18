<template>
  <div id="adding">
    <div id=route>
        <router-link v-bind:to="{ name: 'build itinerary'}" id="buildAddNewButton">+Add New Itinerary</router-link>
      </div>
    <router-view />
    </div>


</template>

<script>
import ItineraryService from '../services/ItineraryService';

export default {
    name: 'Itineraries',
    data(){
        return {
            Itinerary: []
        }
    },
    methods: {
        getItineraryId(){
            ItineraryService.getItineraryId().then((response) => {
                this.itineraryId = response.data;   
            });
        }
    },
    created() {
        this.getItineraryId();
    }
}
</script>

<style>
#route {
  margin-top: 4%;



}
</style>