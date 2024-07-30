<template>
    <header>
      <h1>Project S</h1>
      <nav>
        <router-link to="/">Home</router-link> |
        <router-link to="/about">About</router-link> |
        <router-link to="/marketplace">Marketplace</router-link> |
        <router-link to="/community">Community</router-link>
      </nav>
    </header>
  </template>
  
  <script>
  export default {
    name: 'HeaderComponent'
  }
  </script>