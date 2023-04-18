<template>
    <div class='list'>
        <div class='itinerary-params'>
            <div class='title'>
                <h2>Title: </h2>
                <input type="text" id='titleInput' v-model='title' v-on:change='updateTitle()'>
            </div>
            <div class='date-time'>
                <h4>Date: </h4>
                <input type="date" id='dateInput' v-model='date' v-on:change='updateDate()'>
                <h4>Starting time: </h4>
                <input id='timeInput' type="time" v-model="startingTime" v-on:change='updateStartingTime()'>
            </div>
        </div>
        <itinerary-card v-for="destination in destinations" v-bind:key="destination.id" v-bind:id="destination.id" />
    </div>
</template>

<script>
import itineraryCard from '../components/ItineraryCard.vue'
// import itineraryService from '../services/ItineraryService.js'
import destinationsService from '../services/DestinationsService'

export default {
    components: {
        itineraryCard,
    },
    data () {
        return {
            destinations: [],
            startingTime: '00:00',
            date: ''
        }
    },
    created() {
        destinationsService.getDestinations().then((response) => {
        this.destinations = response.data;
        });
    // itineraryService
    //     .getActivitiesByUserIdAndItineraryId(this.$route.params.userId, this.$route.params.itineraryId)
    //     .then((response) => {
    //         this.$store.currentItinerary.destinations = response.data;
    // });
    },
    methods: {
        updateStartingTime() {
            this.$store.state.currentItinerary.startingTime = this.startingTime;
        },
        updateTitle() {
            this.$store.state.currentItinerary.title = this.title;
        },
        updateDate() {
            this.$store.state.currentItinerary.date = this.date;
        }
    }

}
</script>

<style>

.list {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    max-width: 30%;
}

.itinerary-params {
    display: flex;
    flex-direction: column;
    backface-visibility: hidden;
    top: 0;
    left: 0;
    width: 15vw;
    min-width: 500px;
    height: 200px;
    background-color: rgb(230, 230, 230);
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    justify-content: space-evenly;
    align-items: center;
}

#titleInput {
    font-family: 'Poppins';
    font-size: x-large;
    width: 75%;
    text-overflow: ellipsis;
}

#timeInput {
    height: 50%;
    font-family: 'Poppins';
    font-size: large;
}

#dateInput {
    font-family: 'Poppins';
    font-size: large;
}

.title  {
    display: flex;
    justify-content: space-evenly;
    width: 100%;
}

.date-time {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 100%;
}

</style>