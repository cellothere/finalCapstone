<template>
    <div class="destination-card">
        <img class="thumbnail" src="https://cdn.shopify.com/s/files/1/1227/8942/products/c8cbccf751dae4c475ebd2aa103b3d7f_2000x.jpg?v=1598784461" alt="Example Image" />
        <h3>{{ destination.name }}</h3>
        <div class="rating">
            <img src="../../assets/star.png"
                class="ratingStar"
                v-for="n in destination.rating"
                v-bind:key="n"/>
        </div>
        <p v-if=showDetail>{{ getDistance(destination.latitude, destination.longitude, this.$store.state.currentLatitude, this.$store.state.currentLongitude) }} mi away</p>
        <p class="description" v-if=showDetail>{{ destination.description }}</p>
        <div class="button-container">
            <button id='DetailsButton' v-on:click=toggleShowDetail()>Details</button>
            <button>Add</button>
        </div>
    </div>
</template>

<script>
export default {
    props: ['review'],
    data() {
        return {
            showDetail: false,
            destination: {
                name: 'Example Destination',
                rating: 5,
                description: 'This is an example of a description of a thing.',
                latitude: 41.4990075,
                longitude: -81.6932948
            }
        }
    },
    computed: {
        travelDistance () {
            return (this.destination.latitude)
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