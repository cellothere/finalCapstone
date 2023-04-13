<template>
  <div class="home">
    <favorites-side-bar v-show="showSidebar == true" />
    <div class="banner">
      <img class="banner-image" src="https://images.rawpixel.com/image_1000/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTEyODE2dS5qcGc.jpg" alt="Downtown Cleveland">
      <h1>City Explorer</h1>
      <img class="cleveland-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Destination_Cleveland_logo.svg/512px-Destination_Cleveland_logo.svg.png?20211216160402" alt="Script Cleveland"/>
    </div>
    
    <br>
    <div class='suggestions'>
      <destination-list />
    </div>
  </div>
</template>

<script>
import destinationList from '../components/DestinationList.vue';
import FavoritesSideBar from '../components/FavoritesSideBar.vue'

export default {
  components: { 
    destinationList,
    FavoritesSideBar
    },
  name: "home",
  data() {
    return {
      showSidebar: false
    }
  },
};
</script>

<style>

.home {
  text-align: center;
  font-family: Arial, Helvetica, sans-serif;
}

.suggestions {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

.banner {
  position: relative;
  top: 0;
  left: 0;
}

.banner-image {
  position: relative;
  margin-top: 2.5%;
  top: 0px;
  left: 0px;
  height: 400px;
  width: 100%;
  object-fit: cover;
}

.cleveland-logo {
  position: absolute;
  top: 0px;
  left: 0px;
  height: 400px;
  width: 100%;
  object-fit: contain;
  filter: invert(100%);
}
template {
  background-color: bisque;
}

</style>
