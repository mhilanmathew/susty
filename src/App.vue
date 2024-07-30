<template>
  <div id="app">
    <template v-if="isAuthenticated">
      <header>
        <div class="logo">Project S</div>
        <nav>
          <router-link to="/">Home</router-link>
          <router-link to="/about">About</router-link>
          <router-link to="/marketplace">Marketplace</router-link>
          <router-link to="/community">Community</router-link>
          <a href="#" @click.prevent="logout" class="auth-link">Sign Out</a>
        </nav>
      </header>

      <main>
        <router-view></router-view>
      </main>

      <footer>
        <p>&copy; 2024 Project S - A Better Social Media, A Better World!</p>
      </footer>
    </template>
    <template v-else>
      <AuthView @login-success="onLoginSuccess" />
    </template>
  </div>
</template>

<script>
import AuthView from './views/AuthView.vue'

export default {
  name: 'App',
  components: {
    AuthView
  },
  data() {
    return {
      isAuthenticated: false
    }
  },
  created() {
    this.checkAuthentication()
  },
  methods: {
    checkAuthentication() {
      const user = localStorage.getItem('currentUser')
      this.isAuthenticated = !!user
    },
    onLoginSuccess() {
      this.isAuthenticated = true
    },
    logout() {
      localStorage.removeItem('currentUser')
      this.isAuthenticated = false
    }
  }
}
</script>

<style>
:root {
  --primary-green: #4CAF50;
  --secondary-green: #45a049;
  --primary-blue: #3498db;
  --secondary-blue: #2980b9;
  --accent-orange: #e67e22;
  --light-bg: #ecf0f1;
  --dark-text: #2c3e50;
}

body {
  font-family: 'Roboto', sans-serif;
  line-height: 1.6;
  color: var(--dark-text);
  background-color: var(--light-bg);
  margin: 0;
  padding: 0;
}

#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}

header {
  background: linear-gradient(to right, var(--primary-green), var(--primary-blue));
  color: white;
  padding: 1rem 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  font-size: 2rem;
  font-weight: bold;
}

nav {
  display: flex;
  gap: 1rem;
}

nav a {
  color: white;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  transition: background-color 0.3s;
}

nav a:hover, nav a.router-link-active {
  background-color: rgba(255, 255, 255, 0.2);
}

.auth-link {
  background-color: var(--accent-orange);
  color: white;
}

.auth-link:hover {
  background-color: #d35400;
}

main {
  flex: 1;
  padding: 2rem;
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

footer {
  background-color: var(--dark-text);
  color: white;
  text-align: center;
  padding: 1rem;
  margin-top: auto;
}
</style>