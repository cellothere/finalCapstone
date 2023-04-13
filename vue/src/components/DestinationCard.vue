<template>
    <div class="destination-card">
        <img class="thumbnail" :src="destination.imageUrl" />
        <h3 v-on:click='toggleShowDetail()' >{{ destination.name }}</h3>
        <div v-if='showDetail'>
            <br>
            <div class="rating" v-if='showDetail'>
                <img src="../../assets/star.png"
                    class="ratingStar"
                    v-for="n in roundedRating"
                    v-bind:key="n"/>
            </div>
            <p class="description" v-if=showDetail>{{ destination.description }}</p>
            <br>
            <div>
                <button class='tag' id='type' v-if="(destination.type)">{{ destination.type }}</button>
                <button class='tag' id='outdoor' v-if="(destination.outdoor)">Outdoor</button>
                <button class='tag' id='kid-friendly' v-if="(destination.kidFriendly)">Kid-Friendly</button>
                <button class='tag' id='admission' v-if="(destination.freeAdmission)">Admission Fee</button>
                <button class='tag' id='restaurant-type' v-if="(destination.restaurantType)">{{ destination.restaurantType }}</button>
            </div>
            <br>
        </div>
        <!-- <button id='DetailsButton' v-on:click=toggleShowDetail()>Details</button> -->
        <div class="button-container">
            <label for="favorite"> Add to list: </label>
            <input type="checkbox" id="favorite" name="favorite" value="yes" v-model="selected">
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
            selected: false,
            destination: {}
        }
    },
    computed: {
        roundedRating() {
            return Math.round(this.destination.landmarkRating);
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
    min-width: 50px;
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
    cursor: pointer;
}

</style>