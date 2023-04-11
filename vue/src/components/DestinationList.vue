<template>
    <div class="list">
        <!-- This will be a v-for once we have connected to the database. -->
        <destination-card />
        <destination-card />
        <destination-card />
    </div>
</template>

<script>
import destinationCard from "../components/DestinationCard.vue";

export default {
    props: ['destinations'],
    components: {
      destinationCard
    },
    data () {
        return {
        }
    }
  };
</script>

<style>
.list {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
}
</style>

// v-for="destination in destinations"
// v-bind:key="destination.id"
// v-bind:destination="destination"