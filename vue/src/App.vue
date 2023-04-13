<template>
  <div id="app">
    <div id="nav">
      <div id="home">
        <router-link v-bind:to="{ name: 'home' }" id="homeButton">Home</router-link>&nbsp;|&nbsp;
        <router-link v-bind:to="{ name: 'logout' }" v-if="$store.state.token != ''" id="logoutButton">Logout</router-link>
      </div>
      <img id="clevelandLogo" src="../assets/clevelandLogo.jpg" alt="Cleveland Logo" />
    <div id="welcomeUser" v-if="$store.state.token != ''">Welcome, {{ $store.state.user.username }}</div>
    </div>
    <router-view />
  </div>
</template>



<style>

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");

  #nav {
  display: flex;
  font-family: "Karma", sans-serif;
  background: linear-gradient(to right, white,#FAF9F9);
  max-width: auto;
  overflow: hidden;
   position: fixed; 
   top: 0; 
   width: 100%; 
   height: 7%;
   justify-content: space-between;
   align-items: center;
   box-shadow: 0 2px 4px 0 rgba(0,0,0,.2);
   z-index: 999;
   
}

#clevelandLogo {
  height: 4.5rem;
  width: 5rem;
  position: sticky;
  right: 48%;
}

#home {
  font-family: Poppins;
  font-weight: bold;
  margin-left: 2%;
}
#homeButton:hover {
  font-size: 18px;
  font-size-adjust: 25px;
}

#logoutButton:hover {
  font-size: 18px;
  font-size-adjust: 25px;
}
#welcomeUser {
  float: right;
  margin-right: 4%;
  text-align: center;
  font-family: Poppins;
  font-weight: bold;
}

#welcomeUser:hover {
    font-size:18px;
    font-size-adjust: 25px;
}

.tag {
    border: solid;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-right: 13px;
    margin-left: -1px;
    margin-bottom: 10px;
    border-radius: 100px;
}

.tagSelected {
    border: solid;
    border-color: black;
    color: white;
    padding: 10px 20px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    margin-right: 13px;
    margin-left: -1px;
    margin-bottom: 10px;
    border-radius: 100px;
}

#outdoor {
    background-color: green;
}

#kid-friendly {
    background-color:purple;
}

#admission {
    background-color: black;
}

#restaurant-type {
    background-color: brown;
}

#type {
    background-color: darkgray;
}
  
</style>

