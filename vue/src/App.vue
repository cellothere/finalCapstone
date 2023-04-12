<template>
  <div id="app">
    <div id="nav">
      <div id="home">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''">Logout</router-link>
      </div>
    <div id="welcomeUser" v-if="$store.state.token != ''">Welcome, {{ $store.state.user.username }}</div>
    </div>
    <router-view />
  </div>
</template>



<style scoped>

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

  #nav {
  display: flex;
  font-family: "Karma", sans-serif;
  background-color: white;
  max-width: auto;
  overflow: hidden;
   position: fixed; 
   top: 0; 
   width: 100%; 
   height: 7%;
   justify-content: space-between;
   align-items: center;
   box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
   
}

#home {
  font-family: Poppins;
  font-weight: bold;
}
#welcomeUser {
  float: right;
  margin-right: 7%;
  text-align: center;
  font-family: Poppins;
  font-weight: bold;
}
  
</style>

