<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <div class="banner">
      <img class="banner-image" src="https://images.rawpixel.com/image_1000/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcGQxOS0zLTEyODE2dS5qcGc.jpg" alt="Downtown Cleveland">
      <h1>City Explorer</h1>
      <img class="cleveland-logo" src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Destination_Cleveland_logo.svg/512px-Destination_Cleveland_logo.svg.png?20211216160402" alt="Script Cleveland"/>
    </div>
    <form class='filters'>
      <b>Filter Results:</b>
      <i>&nbsp;&nbsp;</i>
      <label for="keyword"></label>
      <input name="keyword" type="text" placeholder="search" v-model='keyword'>
      <i>&nbsp;&nbsp;</i>
      <input list="distance" id="distanceFilter" placeholder="distance" v-model='distance'>
        <datalist id="distance" value=0>
          <option value="1 mi" />
          <option value="5 mi" />
          <option value="10 mi" />
          <option value="20 mi" />
          <option value="50 mi" />
        </datalist>
      <i>&nbsp;&nbsp;</i>
      <input list="rating" id="ratingFilter" placeholder="rating" v-model='rating'>
        <datalist id="rating">
          <option value=1 />
          <option value=2 />
          <option value=3 />
          <option value=4 />
          <option value=5 />
        </datalist>
    </form>
    <br>
    <div class='suggestions'>
      <destination-card v-for="destination in destinations" v-bind:key="destination.landmark_id" class="destination-card" />
    </div>
  </div>
</template>

<script>
// import destinationList from '../components/DestinationList.vue';
import destinationCard from "../components/DestinationCard.vue";
import destinationsService from '../services/DestinationsService';

export default {
  components: { 
    // destinationList,
    destinationCard
    },
  name: "home",
  data() {
    return {
      keyword: '',
      distance: null,
      rating: null,
      destinations: []
    }
  },
  created() {
    destinationsService.getDestinations().then(response => {
      this.destinations = response.data;
    });
    this.destinations.forEach(d => {
      d.distance = this.getDistance(d.landmark_latitude, d.landmark_longitude, this.$store.state.currentLatitude, this.$store.state.currentLongitude);
    });
  },
  computed: {
    filteredDestinations() {
      return this.destinations.filter(d => {
        return (
          (d.name.includes(this.keyword) ||
            d.description.includes(this.keyword) ||
            d.landmark_type.includes(this.keyword)
          ) ||
          (d.distance >= this.distance) ||
          (d.rating >= this.rating)
        )
      });
    }
  },
  methods: {
    getDistance(lat1, lon1, lat2, lon2) {
      var R = 6371; // Radius of the earth in km
      var dLat = this.deg2rad(lat2-lat1);  // deg2rad below
      var dLon = this.deg2rad(lon2-lon1); 
      var a = 
          Math.sin(dLat/2) * Math.sin(dLat/2) +
          Math.cos(this.deg2rad(lat1)) * Math.cos(this.deg2rad(lat2)) * 
          Math.sin(dLon/2) * Math.sin(dLon/2)
          ; 
      var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
      var d = R * c; // Distance in km
      return (d*0.621371).toFixed(1); //Distance in mi to one decimal place
    },
    deg2rad(deg) {
        return deg * (Math.PI/180)
    }
  }
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
  flex-wrap: wrap;
}

#distanceFilter {
  width: 70px;
}

#ratingFilter {
  width: 70px;
}

</style>
