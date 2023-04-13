<template>
    <div class="sidebar-destination-card">
        <h4 v-on:click='toggleShowDetail()' >{{ destination.name }}</h4>
        <img class="sidebarThumbnail" :src="destination.imageUrl" />
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
.sidebar-destination-card {
    display: flex;
    flex-direction: row;
    justify-content: center;
    flex-wrap: nowrap;
    align-items: flex-start;
    background-color: lightgray;
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    width: 15vw;
    min-width: 50px;
    height: 100%;
}

.sidebarThumbnail {
    max-width: 50%;
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

h4 {
    cursor: pointer;
    margin-right: 5px;
}


</style>