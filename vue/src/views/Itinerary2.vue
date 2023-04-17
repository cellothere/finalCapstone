<template>
  <div>
      <itinerary-list />
      <favorites-side-bar />
  </div>
</template>

<script>
import itineraryList from "../components/ItineraryList.vue";
import favoritesSideBar from '../components/FavoritesSideBar.vue'

export default {
    components: { 
        itineraryList,
        favoritesSideBar
    },

}
</script>

<style>

</style>