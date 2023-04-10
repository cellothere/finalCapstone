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
        <label for="username">Username</label>
        <input type="text" id="username" v-model="user.username" required autofocus />
      </div>
      <div class="form-input-group">
        <label for="password">Password</label>
        <input type="password" id="password" v-model="user.password" required />
      </div>
      <button type="submit">Sign in</button>
      <p>
      <router-link :to="{ name: 'register' }">Need an account? Sign up.</router-link></p>
    </form>
    <div class="welcome-img">
      <img class="login-img" src="../../assets/login.jpg" alt="Login Cleveland">
    </div>
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
    }
  }
};
</script>



<style scoped>

.welcome-img {
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: 100%;
  width: 100%;
  min-height: 100vh;
}

form {
  display: flex;
  min-width: 100vh;
  flex-direction: column;
  align-items: center;

}
button {
  width: 60px;
  
}
.form-input-group {
  margin-bottom: 1rem;
}
#login {
  text-align: center;
}
label {
  margin-right: 0.5rem;
}
.welcome {
  text-align: center;
}

</style>