<template>
  <div>
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
      return this.destinations.filter(d => {
        return (d.name.toLowerCase().includes(this.keyword.toLowerCase())) ||
          (d.type.toLowerCase()).includes(this.keyword.toLowerCase())
      });
    }
  },
  methods: {
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