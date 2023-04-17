<template>
  <div>
      <header>
    <h1>Create Your Itinerary</h1>
    </header>
    <form v-on:submit.prevent="addItinerary">
      <label>
        Itinerary Name:
        <input type="text" v-model="newItinerary.name" required />
      </label>
      <label>
        Starting Location:
        <input type="text" v-model="newItinerary.location" required />
      </label>
      <label>
        Date:
        <input type="date" v-model="newItinerary.date" required />
      </label>
      <label>
          Time: 
        <input type="time" v-model="newItinerary.time" />
        </label>
      <button type="submit">Create</button>
    </form>
    <hr />
    <h2>My Itineraries</h2>
    <ul>
      <li v-for="(itinerary, index) in itineraries" :key="index">
        <h2>{{ itinerary.name }}</h2>
        <p>{{ itinerary.location }}</p>
        <p>{{ itinerary.date }} </p>
        <p>{{itinerary.time}} </p>
        <button v-on:click="editItinerary(index)">Edit</button>
        <button v-on:click="deleteItinerary(index)">Delete</button>
      </li>
    </ul>

    <!-- <ul>
  <li v-for="(itinerary, index) in itineraries" :key="index">
    <h2>{{ itinerary.name }}</h2>
    <p>{{ itinerary.location }}</p>
    <p>{{ itinerary.date }} </p>
    <div v-if="itinerary.places.length > 0">
      <h3>Places to Visit:</h3>
      <ul>
        <li v-for="(place, index) in itinerary.places" :key="index">
          <h4>{{ place.name }}</h4>
          <p>{{ place.location }}</p>
        </li>
      </ul>
    </div>
    <button v-on:click="editItinerary(index)">Edit</button>
    <button v-on:click="deleteItinerary(index)">Delete</button>
    <hr />
    <h4>Add Place:</h4>
    <form v-on:submit.prevent="addPlace(index)">
      <label>
        Place Name:
        <input type="text" v-model="newPlace.name" required />
      </label>
      <label>
        Location:
        <input type="text" v-model="newPlace.location" required />
      </label>
      <button type="submit">Add</button>
    </form>
  </li>
</ul> -->

    <div v-if="selectedItinerary !== null">
      <h1>Edit Itinerary</h1>
      <form v-on:submit.prevent="updateItinerary">
        <label>
          Title:
          <input type="text" v-model="selectedItinerary.name" required />
        </label>
        <label>
          Location:
          <input type="text" v-model="selectedItinerary.location" required />
        </label>
        <label>
          Date:
          <input type="date" v-model="selectedItinerary.date" required />
        </label>
        <label>
            Time:
            <input type="time" v-model="selectedItinerary.time" />
        </label>
        <button type="submit">Save</button>
        <button v-on:click="cancelEdit">Cancel</button>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newItinerary: {
        name: "",
        location: "",
        date: ""
      },
    //   places: []
    //   },
    //   newPlace: {
    //   name: "",
    //   location: ""
      itineraries: [],
      selectedItinerary: null
    };
  },
  methods: {
    addItinerary() {
      this.itineraries.push(this.newItinerary);
      this.newItinerary = {
        name: "",
        location: "",
        date: ""
      };
    },
    editItinerary(index) {
      this.selectedItinerary = this.itineraries[index];
    },
    updateItinerary() {
      this.selectedItinerary = null;
    },
    cancelEdit() {
      this.selectedItinerary = null;
    },
    deleteItinerary(index) {
      this.itineraries.splice(index, 1);
    }
//     addPlace(index) {
//   this.itineraries[index].places.push(this.newPlace);
//   this.newPlace = {
//     name: "",
//     location: ""
//   };
// },
  }
};
</script>

<style>
header {
    font-size: 100%;
  margin: auto;
  width: 80%;
  border: 3px solid green;
  padding: 20px;
}
h1 {
    text-align: center;
}
</style>