<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <sidebar-favorites-list id="sidebarFavs"/>
    <div id="backgroundShading" />
        <button
        id='clearFavorites'
        v-on:click='clearFavorites()'
        v-bind:class="{ tag:!restaurantsFilter, tagSelected: restaurantsFilter }">
        Clear Favorites
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
      favorites: [
      ],
    };
  },
  methods: {
    clearFavorites() {
      this.$store.commit('CLEAR_FAVORITES');
    },
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
  height: 83%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 998;
  overflow: auto;
}
#backgroundShading {
  display: flex;
  flex-direction: column;
  position: fixed;
  top: 850px;
  right: 0;
  width: 200px;
  height: 100%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 997;
  overflow: auto;

}


destination-list {
    width: 10px;
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

#clearFavorites:hover {
  background: #0090FF;
  color: black;
}

@media (max-width: 1000px) {
  .favorites-sidebar {
    display: none;
  }
}

</style>

