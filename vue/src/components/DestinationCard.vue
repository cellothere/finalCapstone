<template>
    <div class="card-container">
        <div class="destination-card"
            @click="handleClick"
                :class="{flipped : showDetail}"
                v-on:click='flip()' >
            <div class='card-front'>
                <img class="thumbnail" :src="destination.imageUrl" />
                <h3 >{{ destination.name }}</h3>
                <div class="button-container">
                    <label for="favorite"> Add to list: </label>
                    <input type="checkbox" id="favorite" name="favorite" value="yes" v-model="selected">
                </div>
            </div>
            <div class='card-back'>
                <br>
                <div class="rating" >
                    <img src="../../assets/star.png"
                        class="ratingStar"
                        v-for="n in roundedRating"
                        v-bind:key="n"/>
                </div>
                <p class="description" >{{ destination.description }}</p>
                <br>
                <div>
                    <button class='tag' id='type' v-if="(destination.type)">{{ destination.type }}</button>
                    <button class='tag' id='outdoor' v-if="(destination.outdoor)">Outdoor</button>
                    <button class='tag' id='kid-friendly' v-if="(destination.kidFriendly)">Kid-Friendly</button>
                    <button class='tag' id='admission' v-if="(destination.freeAdmission)">Admission Fee</button>
                    <button class='tag' id='restaurant-type' v-if="(destination.restaurantType)">{{ destination.restaurantType }}</button>
                </div>
                <h3 v-on:click='flip()' >{{ destination.name }}</h3>
                <div class="button-container">
                    <label for="favorite"> Add to list: </label>
                    <input type="checkbox" id="favorite" name="favorite" value="yes" v-model="selected">
                 </div>
            </div>
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
        flip () {
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
        handleClick() {
            this.flip;
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
.card-container {
    perspective: 1000px;
}

.destination-card {
    cursor: pointer;
    transform-style: preserve-3d;
    transition: transform 0.6s;
    display: flex;
    flex-direction: column;
}

.destination-card:hover {
    /* transform: rotateY(180deg); */
    
}

.flipped {
    transform: rotateY(180deg);
}

.card-front, .card-back {
    backface-visibility: hidden;
    top: 0;
    left: 0;
    width: 15vw;
    min-width: 250px;
    height: 500px;
    background-color: lightgray;
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-between;
}

.card-back {
    transform: rotateY(180deg);
    position: absolute;
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
    justify-content: center;
}

h3 {
    margin-bottom: 2px;
    cursor: pointer;
}

</style>