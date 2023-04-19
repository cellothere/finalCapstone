<template>
    <div class='list-itinerary'>
        <div class='itinerary-params'>
            <div class='title-itinerary'>
                <h2>Title: </h2>
                <input type="text" id='titleInput' v-model='title' v-on:change='updateTitle()'>
            </div>
            <div class='date-time'>
                <h4>Date: </h4>
                <input type="date" id='dateInput' v-model='date' v-on:change='updateDate()'>
                <h4>Starting time: </h4>
                <input id='timeInput' type="time" v-model="startingTime" v-on:change='updateStartingTime()'>
            </div>
            <div class='get-directions'>
                <h2 v-on:click='getDirections()'>Get Directions</h2>
            </div>
            <div class='itinerary-buttons'>
                <button class='tag' id='save' v-on:click='saveItinerary()'>Save</button>
                <button class='tag' id='reset-itinerary' v-on:click='resetDestinationList()'>Clear</button>
                <button class='tag' id='delete' v-on:click='deleteItinerary()'>Delete</button>
            </div>
        </div>
        <itinerary-card 
            v-for="(destination,index) in $store.state.currentItineraryDestinations" 
            v-bind:key="destination.id" 
            v-bind:id="destination.id"
            v-bind:index='index' />
    </div>
</template>

<script>
import itineraryCard from '../components/ItineraryCard.vue'
import itineraryService from '../services/ItineraryService'

export default {
    components: {
        itineraryCard,
    },
    data () {
        return {
            destinations: [],
            Title: "",
            startingTime: '00:00',
            date: ''
        }
    },
    created() {
        this.destinations = this.$store.state.favorites;
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
        },
        getDirections() {
            let directionsURL = 'https://www.google.com/maps/dir/';
            this.destinations.forEach((d) => {
                directionsURL = directionsURL + d.latitude + ',' + d.longitude + '/';
            });
            window.open(directionsURL, '_blank');
        },
        share() {
            if (!window.getSelection) {
                alert('Please copy the URL from the location bar.');
                return;
            }
            const dummy = document.createElement('p');
            dummy.textContent = window.location.href;
            document.body.appendChild(dummy);
            const range = document.createRange();
            range.setStartBefore(dummy);
            range.setEndAfter(dummy);
            const selection = window.getSelection();
            selection.removeAllRanges();
            selection.addRange(range);
            document.execCommand('copy');
            document.body.removeChild(dummy);
            alert('Link copied to clipboard.');
        },
        resetDestinationList() {
            this.$store.state.currentItineraryDestinations = [];
        },
        deleteItinerary() {
            itineraryService.deleteItinerary(this.$route.params.userId, this.$route.params.itineraryId);
        },
        saveItinerary() {
            itineraryService.saveItineraryInfo(this.$route.params.userId, this.$store.state.currentItineraryInfo);
            itineraryService.saveItineraryDestinations(
                this.$route.params.userId, this.$route.params.itineraryId, this.$store.state.currentItineraryDestinations);
        }
    },
}
</script>

<style>

.list-itinerary {
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
    height: 275px;
    background-color: rgb(230, 230, 230);
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    justify-content: space-evenly;
    align-items: center;
}

.itinerary-buttons {
    display: flex;
    justify-content: space-evenly;
    width: 100%;
    margin-top: 20px;
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

.title-itinerary  {
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

.get-directions {
    margin: -30px;
    cursor: pointer;
}

#save {
    background-color: green;
}

#reset-itinerary {
    background-color: gray;
}

#delete {
    background-color: brown;
}

</style>