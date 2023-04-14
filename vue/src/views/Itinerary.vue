<template>
    <div>
        <button class="btn btn-indigo outline" @click="sayhello">VISIT OUR WEBSITE
        </button>
    </div>
</template>
<script>
    export default {
        data() {
            return {
               
            }
        },
         methods: {
           sayhello(){
              alert('hello');
           }
         }
    }
</script>