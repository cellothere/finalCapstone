<template>
  <div id="app">
    <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
    </div>
    <router-view />
  </div>
</template>

<style scoped>
  #nav {
    font-family: "Karma", sans-serif;
    background-color: white;
    margin-bottom: 20px;
    vertical-align: middle;
    max-width: 1200px;
    
  }
</style>

