<template>
    <div class="list">
        <destination-card />
    </div>
</template>

<script>
import destinationCard from "../components/DestinationCard.vue";

export default {
    components: {
      destinationCard
    },
    data () {
        return {
            destinations: []
        }
    }
  };
</script>

<style>
</style>