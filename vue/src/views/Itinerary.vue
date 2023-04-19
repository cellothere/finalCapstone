<template>
    <div class='list-container'>
        <br>
        <br>
        <br>
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
        // favoritesSideBar
        favoritesSideBar

    },

}
</script>

<style>
    .list-container {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>