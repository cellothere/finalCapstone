<template>
  <div>
    <!-- TODO: Add logic for singular/plural -->
    <p>{{ filteredDestinations.length }} results</p>
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
      <!-- <i>&nbsp;&nbsp;</i>
      <input list="rating" id="ratingFilter" placeholder="rating" v-model='rating'>
        <datalist id="rating">
          <option value=1 />
          <option value=2 />
          <option value=3 />
          <option value=4 />
          <option value=5 />
        </datalist> -->
    </form>
    <br>
    <div class="list">
      <destination-card v-for="destination in filteredDestinations" v-bind:key="destination.id" v-bind:id="destination.id" />
    </div>
  </div>
</template>

<script>
import destinationCard from "../components/DestinationCard.vue";
import destinationsService from '../services/DestinationsService';

export default {
  components: {
    destinationCard
  },
  data () {
    return {
      destinations: [],
      keyword: '',
      distance: null,
      rating: null
    }
  },
  created() {
    destinationsService.getDestinations().then((response) => {
      this.destinations = response.data;
    });
  },
  computed: {
    filteredDestinations() {
      let filteredArray = this.destinations;
      filteredArray = filteredArray.filter(d => {
        return (d.name.toLowerCase().includes(this.keyword.toLowerCase())) ||
          (d.type.toLowerCase()).includes(this.keyword.toLowerCase())
      });
      if (this.distance) {
        filteredArray = filteredArray.filter(d => {
          return (this.distanceCalc(d) <= this.distance)
        });
      }
      return filteredArray;
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
    },
    distanceCalc(d) {
      return this.getDistance(d.latitude, d.longitude, this.$store.state.currentLatitude, this.$store.state.currentLongitude)
    }
  }
  };
</script>

<style>

.list {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
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