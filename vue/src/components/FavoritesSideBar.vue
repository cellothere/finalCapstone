<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <destination-list />
  </div>
</template>

<script>
import DestinationList from './DestinationList.vue';
export default {
  components: { DestinationList },
  name: "FavoritesSideBar",
  data() {
    return {
      favorites: [
      ],
    };
  },
};
</script>

<style>
.favorites-sidebar {
  position: fixed;
  top: 30px;
  right: 0;
  width: 200px;
  height: 100%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 998;
}
</style>