<template>
    <div class="destination-card">
        <img class="thumbnail" src="https://cdn.shopify.com/s/files/1/1227/8942/products/c8cbccf751dae4c475ebd2aa103b3d7f_2000x.jpg?v=1598784461" alt="Example Image" />
        <div class="info">
            <h3>Example Destination</h3>
            <div class="rating">
                <img src="../../assets/star.png"
                    class="ratingStar"
                    v-bind:title="destination.rating + ' Star Review'"
                    v-for="n in destination.rating"
                    v-bind:key="n"/>
            </div>
            <button v-on:click=toggleShowDetail()>Details</button>
            <button>Add to Itinerary</button>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            showDetail: false,
            destination: {
                rating: 5
            }
        }
    },
    methods: {
        toggleShowDetail () {
            this.showDetail = !this.showDetail;
        }
    }
}
</script>

<style>
.destination-card {
    display: flex;
    align-items: center;
    background-color: lightgray;
    margin: 10px;
    padding: 10px;
    border-radius: 10px;
}

.thumbnail {
    max-width: 100px;
}

.ratingStar {
    max-width: 20px;
}

.info {
    display: flex;
    align-items: left;
    flex-direction: column;
    padding-left: 10px;
}
</style>