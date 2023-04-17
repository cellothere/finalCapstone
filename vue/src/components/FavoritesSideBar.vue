<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <sidebar-favorites-list/>
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
  height: 100%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 998;
}

destination-list {
    width: 10px;
}

#clearFavorites {
    background-color: brown;
    position: fixed;
    margin-top: 800px; /* push the button to the bottom of the div */
    margin-left: 38px
  
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

