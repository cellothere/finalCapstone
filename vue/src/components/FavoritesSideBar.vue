<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <sidebar-favorites-list id="sidebarFavs"/>
    <div id="backgroundShading" />
      <button
        id='clearFavorites'
        v-on:click='clearFavorites()'
        class="tag">
        Clear Favorites
      </button>
      <button
        id='buildItinerary'
        v-on:click='buildItinerary()'
        class="tag">
        Build Itinerary
      </button>
  </div>
</template>

<script>
import SidebarFavoritesList from './SidebarFavoritesList.vue';
export default {
  components: { SidebarFavoritesList },
  name: "FavoritesSideBar",
  data() {
    return {
      favorites: [],
    };
  },
  methods: {
    clearFavorites() {
      this.$store.commit('CLEAR_FAVORITES');
      location.reload();
    },
    buildItinerary() {
      this.$router.push({ name: 'itinerary' } );
    }
  }
};
</script>

<style>

.favorites-sidebar {
  display: flex;
  flex-direction: column;
  position: fixed;
  top: 30px;
  right: 0;
  width: 200px;
  height: 75%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 998;
  overflow: auto;
}

#backgroundShading {
  display: flex;
  flex-direction: column;
  position: fixed;
  top: 775px;
  right: 0;
  width: 200px;
  height: 100%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 997;
  overflow: auto;
  align-items: flex-end;
}

#sidebarFavs {
  height: 10px;
}

#clearFavorites {
    background-color: brown;
    position: fixed;
    margin-top: 800px; /* push the button to the bottom of the div */
    margin-left: 38px;
    z-index: 999;
}

#buildItinerary {
    background-color: green;
    position: fixed;
    margin-top: 750px; /* push the button to the bottom of the div */
    margin-left: 38px;
    z-index: 999;
}

#clearFavorites:hover {
  background: #0090FF;
  color: black;
}

#buildItinerary:hover {
  background: #0090FF;
  color: black;
}

@media (max-width: 1000px) {
  .favorites-sidebar {
    display: none;
  }
}

</style>

