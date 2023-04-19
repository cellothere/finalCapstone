<template>
    <div class="card-container-itinerary">
        <div class="destination-card-itinerary"
            @click="handleClick"
            :class="{flipped : flipped}"
            v-on:click='flip()'>
            <div class='card-front-itinerary'>
                <img class="thumbnail-itinerary" :src="destination.imageUrl" />
                <div class='info-itinerary'>
                    <h2>{{ destination.name }}</h2>
                    <i>M {{ convertTime(destination.mondayOpen) }} - {{ convertTime(destination.mondayClose) }}</i>
                    <i>Tu {{ convertTime(destination.tuesdayOpen) }} - {{ convertTime(destination.tuesdayClose) }}</i>
                    <i>W {{ convertTime(destination.wednesdayOpen) }} - {{ convertTime(destination.wednesdayClose) }}</i>
                    <i>Th {{ convertTime(destination.thursdayOpen) }} - {{ convertTime(destination.thursdayClose) }}</i>
                    <i>F {{ convertTime(destination.fridayOpen) }} - {{ convertTime(destination.fridayClose) }}</i>
                    <i>Sa {{ convertTime(destination.saturdayOpen) }} - {{ convertTime(destination.saturdayClose) }}</i>
                    <i>Su {{ convertTime(destination.sundayOpen) }} - {{ convertTime(destination.sundayClose) }}</i>
                </div>
            </div>
            <div class='card-back-itinerary'>
                <p class="description-itinerary" >{{ destination.description }}</p>
                <div class="rating-itinerary" >
                    <img src="../../assets/star.png"
                        class="ratingStar-itinerary"
                        v-for="n in roundedRating"
                        v-bind:key="n"/>
                </div>
                <div>
                    <button class='tag' id='type' v-if="(destination.type)">{{ destination.type }}</button>
                    <button class='tag' id='outdoor' v-if="(destination.outdoor)">Outdoor</button>
                    <button class='tag' id='kid-friendly' v-if="(destination.kidFriendly)">Kid-Friendly</button>
                    <button class='tag' id='admission' v-if="(destination.freeAdmission)">Admission Fee</button>
                    <button class='tag' id='restaurant-type' v-if="(destination.restaurantType)">{{ destination.restaurantType }}</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>

import destinationsService from '../services/DestinationsService';

export default {
    props: [
      'id',
      'time'
      ],
    data() {
        return {
            flipped: false,
            selected: false,
            destination: {},
            isChecked: false
        }
    },
    computed: {
        roundedRating() {
            return Math.round(this.destination.landmarkRating);
        },

    },
    methods: {
        flip () {
            this.flipped = !this.flipped;
            if (this.flipped) {
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
        },
    toggleFavorite(destination) {
        this.$store.commit('TOGGLE_FAVORITE', destination);
    },
    convertTime(str) {
        let result = ''
        // Get Hours
        var h1 = Number(str[0] - '0');
        var h2 = Number(str[1] - '0');
        var hh = h1 * 10 + h2;
        // Finding out the Meridien of time
        // ie. AM or PM   
        var Meridien;
        if (hh < 12) { Meridien = "AM";}
        else Meridien = "PM";
        hh %= 12;
        // Handle 00 and 12 case separately
        if (hh == 0) {
            result = result + "12";
            // Printing minutes and seconds
            for (var i = 2; i < 2; ++i) {
            result = result + str[i];
            }
        }
        else {
            result = result + hh;
            // Printing minutes and seconds
            for (var j = 2; j < 2; ++j) {
            result = result + str[j];
            }
        }
        // After time is printed
        // cout Meridien
        result = result + Meridien;
        return result;
        },
    },
    created() {
        destinationsService.getDestinationById(this.id).then(response => {
            this.destination = response.data;
        });
    },
    watch: {
    isChecked(newValue) {
      if (newValue) {
        this.$store.commit('ADD_TO_FAVORITES', this.destination);
      } else {
        this.$store.commit('REMOVE_FROM_FAVORITES', this.destination);
      }
    }
  }
}
</script>

<style>
.card-container-itinerary {
    perspective: 1000px;
    text-align: center;
}

.destination-card-itinerary {
    cursor: pointer;
    transform-style: preserve-3d;
    transition: transform 0.6s;
    display: flex;
}

.flipped {
    transform: rotateY(180deg);
}

.card-front-itinerary, .card-back-itinerary {
    display: flex;
    backface-visibility: hidden;
    top: 0;
    left: 0;
    width: 15vw;
    min-width: 500px;
    height: 300px;
    background-color: rgb(230, 230, 230);
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
    justify-content: space-between;
}

.card-back-itinerary {
    transform: rotateY(180deg);
    position: absolute;
    display: flex;
    flex-direction: column;
    justify-content: flex-end;
    align-items: center;
}

.info-itinerary {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: right;
  padding: 10px;
  text-align: right;
}

.thumbnail-itinerary {
    max-height: 100%;
    position: relative;
    top: 0px;
    left: 0px;
    aspect-ratio: 1/1;
    object-fit: cover;
}

.rating-itinerary {
    margin-bottom: 15px;
}

.ratingStar-itinerary {
    max-width: 25px;
}

.button-container {
    display: flex;
    flex-direction: row;
    justify-content: center;
    margin-bottom: 20px;
}

h3 {
    margin-bottom: 2px;
    cursor: pointer;
}

i {
    font-size: small;
}


</style>