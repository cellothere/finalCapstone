<template>
  <div id="login">
  
    <form @submit.prevent="login" id="login">
      <h1 class="welcome"> Welcome To Cleveland!</h1>
      <h2 >Please sign in to build your adventure</h2>
      <div role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username" class="usernamePassword">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password" class="usernamePassword">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <input type="submit" value="Sign in" class="button" id="done" :style="inputStyle" v-on:keyup.enter="login"/>
      <input type="submit" value="Need an account? Sign up" class="button" id="done" :style="inputStyle" v-on:click="register"/>
      <input type="submit" value="Continue as Guest" class="button" id="done" :style="inputStyle" v-on:click="goToGuestView"/>
    </form>

  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
    register() {
      this.$router.push('/register')
    },
    // TODO send to guest view!
    goToGuestView() {
      this.$router.push('/guest')
    }
  }
};
</script>



<style scoped>

@import url("https://fonts.googleapis.com/css2?family=Poppins&display=swap");


#login {
  display: flex;
  background-image: url(../../assets/clevelandmap.jpg) ;
  background-attachment: fixed;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  height: 100vh;
  width: 100vw;
}

h1 {
  cursor: default;
  user-select: none;
  font-family: Poppins;
}

h2 {
  font-family: Poppins;
}
form {
  display: flex;
  min-width: 100vh;
  flex-direction: column;
  align-items: center;

}

.usernamePassword {
  font-family: Poppins;
}
input {
  border-radius: 3rem;
  border: none;
  padding: 10px;
  text-align: center;
  outline: none;
  margin: 10px;
  width: 50%;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
  font-weight: 400;
}
input:hover {
  box-shadow: 0px 0px 8px -5px #000000;
}
input:active {
  box-shadow: 0px 0px 8px -5px #000000;
}


button {
  width: 60px;
  cursor: pointer;
  user-select: none;
}

#done {
  width: 20%;
}
.form-input-group {
  margin-bottom: 1rem;
}

label {
  margin-right: 0.5rem;
}
.welcome {
  text-align: center;
}
p {
  font-family: Poppins;
  background-color: white;
}


</style>