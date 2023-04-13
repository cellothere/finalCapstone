<template>
  <div class="favorites-sidebar">
    <h2>My Favorites</h2>
    <ul>
      <li v-for="item in favorites" :key="item.id">
        {{ item.title }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: "FavoritesSideBar",
  data() {
    return {
      favorites: [
        { id: 1, title: "Favorite item 1" },
        { id: 2, title: "Favorite item 2" },
        { id: 3, title: "Favorite item 3" },
      ],
    };
  },
};
</script>

<style>
.favorites-sidebar {
  position: fixed;
  top: 0;
  right: 0;
  width: 200px;
  height: 100%;
  background-color: #f5f5f5;
  padding: 20px;
  z-index: 998;
}
</style>