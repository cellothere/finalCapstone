<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <div class="banner">
      <img class="banner-image" src="https://images.rawpixel.com/image_1000/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTEyODE2dS5qcGc.jpg" alt="Downtown Cleveland">
      <h1>City Explorer:</h1>
      <img class="cleveland-logo" src="../../assets\Destination_Cleveland_logo.svg" />
    </div>
      <div class='suggestions'>
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

</style>
