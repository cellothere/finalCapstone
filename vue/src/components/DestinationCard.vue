<template>
    <div class="destination-card">
        <img class="thumbnail" :src="destination.imageUrl" />
        <h3>{{ destination.name }}</h3>
        <div class="rating">
            <img src="../../assets/star.png"
                class="ratingStar"
                v-for="n in roundedRating"
                v-bind:key="n"/>
        </div>
        <p class="description" v-if=showDetail>{{ destination.description }}</p>
        <p v-if='showDetail'>{{ distance }} mi away</p>
        <p v-if="(showDetail && destination.hours)">Hours: {{ destination.hours }}</p>
        <!-- <p v-if='showDetail'>M {{ destination.mondayOpen }} - {{ destination.mondayClose }}</p>
        <p v-if='showDetail'>M {{ destination.tuesdayOpen }} - {{ destination.tuesdayClose }}</p>
        <p v-if='showDetail'>M {{ destination.wednesdayOpen }} - {{ destination.wednesdayClose }}</p>
        <p v-if='showDetail'>M {{ destination.thursdayOpen }} - {{ destination.thursdayClose }}</p>
        <p v-if='showDetail'>M {{ destination.fridayOpen }} - {{ destination.fridayClose }}</p>
        <p v-if='showDetail'>M {{ destination.saturdayOpen }} - {{ destination.saturdayClose }}</p>
        <p v-if='showDetail'>M {{ destination.sundayOpen }} - {{ destination.sundayClose }}</p> -->
        <div>
            <button class='tag' id='type' v-if="(showDetail && destination.type)">{{ destination.type }}</button>
            <button class='tag' id='outdoor' v-if="(showDetail && destination.outdoor)">Outdoor</button>
            <button class='tag' id='kid-friendly' v-if="(showDetail && destination.kidFriendly)">Kid-Friendly</button>
            <button class='tag' id='admission' v-if="(showDetail && destination.freeAdmission)">Admission Fee</button>
            <button class='tag' id='restaurant-type' v-if="(showDetail && destination.restaurantType)">{{ destination.restaurantType }}</button>
        </div>
        <br>
        <div class="button-container">
            <button id='DetailsButton' v-on:click=toggleShowDetail()>Details</button>
            <button>Add</button>
        </div>
    </div>
</template>

<script>

import destinationsService from '../services/DestinationsService';

export default {
    props: ['id'],
    data() {
        return {
            showDetail: false,
            destination: {}
        }
    },
    computed: {
        roundedRating() {
            return Math.round(this.destination.landmarkRating);
        },
        distance() {
            return this.getDistance(this.destination.latitude, this.destination.longitude, this.$store.state.currentLatitude, this.$store.state.currentLongitude)
        }
    },
    methods: {
        toggleShowDetail () {
            this.showDetail = !this.showDetail;
            if (this.showDetail) {
                this.$el.querySelector('#DetailsButton').innerHTML = 'Collapse';
            }
            else {
                this.$el.querySelector('#DetailsButton').innerHTML = 'Details';
            }
        },
        getUrl() {
            return this.destination.imageURL;
        },
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
    },
    created() {
        destinationsService.getDestinationById(this.id).then(response => {
            this.destination = response.data;
        });
    },
}
</script>

<style>
.destination-card {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    flex-wrap: wrap;
    align-items: center;
    background-color: lightgray;
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    width: 15vw;
    min-width: 250px;
    height: 100%;
}

.thumbnail {
    max-width: 100%;
    position: relative;
    top: 0px;
    left: 0px;
    aspect-ratio: 1/1;
    object-fit: cover;
}

.ratingStar {
    max-width: 20px;
}

.button-container {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

h3 {
    margin-bottom: 2px;
}

.tag {
    pointer-events: none;
    border: none;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-right: 13px;
    margin-left: -1px;
    margin-bottom: 10px;
    border-radius: 100px;
}

#outdoor {
    background-color: green;
}

#kid-friendly {
    background-color:purple;
}

#admission {
    background-color: black;
}

#restaurant-type {
    background-color: brown;
}

#type {
    background-color: darkgray;
}

</style>