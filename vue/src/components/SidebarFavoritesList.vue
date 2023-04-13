<template>
  <div>
    <div class="sidebar-list">
      <favorites-side-bar-card v-for="destination in filteredDestinations" v-bind:key="destination.id" v-bind:id="destination.id" />
    </div>
  </div>
</template>

<script>
import FavoritesSideBarCard from "./FavoritesSideBarCard.vue";
import destinationsService from '../services/DestinationsService';

export default {
  components: {
    FavoritesSideBarCard
  },
  data () {
    return {
      destinations: [],
      keyword: '',
      distance: null,
      rating: null,
      timeOpen: null,
      hourOpen: null,
      entertainmentAndCultureFilter: false,
      parksFilter: false,
      restaurantsFilter: false,
      outdoorFilter: false,
      kidFriendlyFilter: false,
      freeFilter: false,
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
      if (this.entertainmentAndCultureFilter) {
        filteredArray = filteredArray.filter(d => {
          return (d.type==='Museum' || d.type==='Market' || d.type==='Garden' || 
                  d.type==='Aquarium' || d.type==='Monument' || d.type==='Cultural Center' || 
                  d.type==='Entertainment' || d.type==='Music Venue' || d.type==='Zoo' || 
                  d.type==='Stadium' || d.type==='Historical Neighborhood' || d.type==='Cultural Hub');
        });
      }
      if (this.parksFilter) {
        filteredArray = filteredArray.filter(d => {
          return (d.type==='Park');
        });
      }
      if (this.restaurantsFilter) {
        filteredArray = filteredArray.filter(d => {
          return (d.type==='Restaurant');
        });
      }
      if (this.outdoorFilter) {
        filteredArray = filteredArray.filter(d => {
          return (d.outdoor);
        });
      }
      if (this.kidFriendlyFilter) {
        filteredArray = filteredArray.filter(d => {
          return (d.kidFriendly);
        });
      }
      if (this.freeFilter) {
        filteredArray = filteredArray.filter(d => {
          return (!d.freeAdmission && d.type!=='Restaurant');
        });
      }
      return filteredArray;
    }
  }
  };
</script>

<style>

.sidebar-list {
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

#dayFilter {
  width: 70px;
}

#ratingFilter {
  width: 70px;
}

#restaurants {
    background-color: brown;
}

#entertainmentAndCulture {
    background-color: lightseagreen;
}

#parks {
    background-color: darkolivegreen;
}

#free {
    background-color: gray;
}

</style>