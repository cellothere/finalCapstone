<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <div class="banner">
      <img class="banner-image" src="https://images.rawpixel.com/image_1000/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTEyODE2dS5qcGc.jpg" alt="Downtown Cleveland">
      <h1>City Explorer</h1>
      <img class="cleveland-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Destination_Cleveland_logo.svg/512px-Destination_Cleveland_logo.svg.png?20211216160402" />
    </div>
    <form class='filters'>
      <b>Filter Results:</b>
      <i>&nbsp;&nbsp;</i>
      <label for="keyword"></label>
      <input name="keyword" type="text" placeholder="search">
      <i>&nbsp;&nbsp;</i>
      <input list="distance" id="distanceFilter" placeholder="distance">
      <datalist id="distance" value=0>
        <option value="1 mi" />
        <option value="5 mi" />
        <option value="10 mi" />
        <option value="20 mi" />
        <option value="50 mi" />
      </datalist>
      <i>&nbsp;&nbsp;</i>
      <input list="rating" id="ratingFilter" placeholder="rating">
      <datalist id="rating" value=0>
        <option value=1 />
        <option value=2 />
        <option value=3 />
        <option value=4 />
        <option value=5 />
      </datalist>
    </form>
    <div class='suggestions'>
      <!-- This will be a v-for once we have connected to the database. -->
      <destination-list />
      <destination-list />
      <destination-list />
    </div>
  </div>
</template>

<script>
import DestinationList from '../components/DestinationList.vue';

export default {
  components: { DestinationList },
  name: "home",
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

.filters {
  display: flex;
  justify-content: center;
}

#distanceFilter {
  width: 70px;
}

#ratingFilter {
  width: 70px;
}

</style>
