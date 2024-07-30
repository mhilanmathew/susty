<template>
    <div class="auth-container">
      <div class="auth-box">
        <h2>{{ isLogin ? 'Login' : 'Sign Up' }} to Project S</h2>
        <p class="tagline">A Better Social Media, A Better World!</p>
        <form @submit.prevent="handleSubmit">
          <div class="form-group" v-if="!isLogin">
            <label for="name">Full Name</label>
            <input type="text" id="name" v-model="name" required>
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" v-model="email" required>
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" id="password" v-model="password" required>
            <p v-if="!isLogin" class="password-strength">Strength: {{ passwordStrength }}</p>
          </div>
          <button type="submit" class="btn" :disabled="!isFormValid">
            {{ isLogin ? 'Login' : 'Sign Up' }}
          </button>
        </form>
        <p class="toggle-auth">
          {{ isLogin ? "Don't have an account?" : "Already have an account?" }}
          <a href="#" @click.prevent="toggleAuth">{{ isLogin ? 'Sign Up' : 'Login' }}</a>
        </p>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    name: 'AuthView',
    data() {
      return {
        isLogin: true,
        name: '',
        email: '',
        password: '',
        users: JSON.parse(localStorage.getItem('users')) || []
      }
    },
    computed: {
      passwordStrength() {
        const password = this.password;
        if (password.length < 8) return 'Weak';
        if (password.length >= 8 && password.length < 12) return 'Medium';
        return 'Strong';
      },
      isFormValid() {
        if (this.isLogin) {
          return this.email && this.password;
        } else {
          return this.name && this.email && this.password && this.passwordStrength !== 'Weak';
        }
      }
    },
    methods: {
      handleSubmit() {
        if (this.isLogin) {
          this.loginUser();
        } else {
          this.signUpUser();
        }
      },
      loginUser() {
        const user = this.users.find(u => u.email === this.email && u.password === this.password);
        if (user) {
          localStorage.setItem('currentUser', JSON.stringify(user));
          this.$emit('login-success');
          this.$router.push('/'); // Redirect to homepage after successful login
        } else {
          alert('Invalid credentials. Please try again.');
        }
      },
      signUpUser() {
        if (this.users.some(u => u.email === this.email)) {
          alert('Email already in use. Please use a different email.');
          return;
        }
        const newUser = { name: this.name, email: this.email, password: this.password };
        this.users.push(newUser);
        localStorage.setItem('users', JSON.stringify(this.users));
        alert('Sign up successful! You can now log in.');
        this.toggleAuth();
      },
      toggleAuth() {
        this.isLogin = !this.isLogin;
        this.resetForm();
      },
      resetForm() {
        this.name = '';
        this.email = '';
        this.password = '';
      }
    }
  }
  </script>
  
  <style scoped>
  .auth-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: linear-gradient(to right, #4CAF50, #3498db);
  }
  
  .auth-box {
    background: white;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 400px;
  }
  
  h2 {
    text-align: center;
    color: #4CAF50;
    margin-bottom: 0.5rem;
  }
  
  .tagline {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 1.5rem;
  }
  
  .form-group {
    margin-bottom: 1rem;
  }
  
  label {
    display: block;
    margin-bottom: 0.5rem;
    color: #2c3e50;
  }
  
  input {
    width: 100%;
    padding: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 1rem;
  }
  
  .btn {
    width: 100%;
    padding: 0.75rem;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s;
  }
  
  .btn:hover {
    background-color: #45a049;
  }
  
  .btn:disabled {
    background-color: #cccccc;
    cursor: not-allowed;
  }
  
  .toggle-auth {
    text-align: center;
    margin-top: 1rem;
  }
  
  .toggle-auth a {
    color: #3498db;
    text-decoration: none;
  }
  
  .toggle-auth a:hover {
    text-decoration: underline;
  }
  
  .password-strength {
    font-size: 0.8rem;
    margin-top: 0.5rem;
    color: #2c3e50;
  }
  </style>