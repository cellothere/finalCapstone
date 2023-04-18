<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <sidebar-favorites-list/>
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

@media (max-width: 768px) {
  .favorites-sidebar {
    display: none;
  }
}

</style>

