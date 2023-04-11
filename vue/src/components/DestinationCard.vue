<template>
    <div class="destination-card">
        <img class="thumbnail" src='destination.landmark_img_url' alt="Example Image" />
        <h3>{{ destination.name }}</h3>
        <div class="rating">
            <img src="../../assets/star.png"
                class="ratingStar"
                v-for="n in destination.rating"
                v-bind:key="n"/>
        </div>
        <p v-if=showDetail>{{ destination.distance }} mi away</p>
        <p class="description" v-if=showDetail>{{ destination.description }}</p>
        <div class="button-container">
            <button id='DetailsButton' v-on:click=toggleShowDetail()>Details</button>
            <button>Add</button>
        </div>
    </div>
</template>

<script>

import destinationsService from '../services/DestinationsService';

export default {
    props: {
        'id': Number
    },
    data() {
        return {
            showDetail: false,
            destination: {}
        }
    },
    computed: {
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
        }
    },
    created() {
        destinationsService.getDestinationById(this.id).then(response => {
            this.destination = response.data;
    });
    }
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
    max-width: 20vw;
    min-width: 125px;
}

.thumbnail {
    max-width: 100%;
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

</style>