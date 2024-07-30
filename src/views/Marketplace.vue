<template>
  <div class="marketplace">
    <h2>Sustainable Marketplace</h2>
    <p>Discover and shop for eco-friendly products</p>
    <div class="product-grid">
      <div v-for="product in products" :key="product.id" class="product-card">
        <div class="product-image">{{ product.name[0] }}</div>
        <h3>{{ product.name }}</h3>
        <p>{{ product.description }}</p>
        <p class="price">${{ product.price.toFixed(2) }}</p>
        <button @click="addToCart(product)" class="btn">Add to Cart</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'MarketplaceView',
  data() {
    return {
      products: [
        { id: 1, name: 'Eco-friendly Water Bottle', description: 'Reusable water bottle made from sustainable materials', price: 19.99 },
        { id: 2, name: 'Solar Power Bank', description: 'Charge your devices using solar energy', price: 39.99 },
        { id: 3, name: 'Bamboo Toothbrush Set', description: 'Set of 4 biodegradable toothbrushes', price: 12.99 },
        // Add more products as needed
      ]
    }
  },
  methods: {
    addToCart(product) {
      console.log(`Added ${product.name} to cart`)
    }
  }
}
</script>

<style scoped>
.marketplace {
  padding: 2rem;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
}

.product-card {
  background-color: white;
  border-radius: 10px;
  padding: 1rem;
  text-align: center;
  transition: transform 0.3s, box-shadow 0.3s;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.product-image {
  width: 100%;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #e7f3e7;
  color: #4CAF50;
  font-size: 3rem;
  border-radius: 5px;
  margin-bottom: 1rem;
}

.price {
  font-weight: bold;
  color: #4CAF50;
  font-size: 1.2rem;
  margin: 1rem 0;
}

.btn {
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 5px;
}

.btn:hover {
  background-color: #45a049;
}
</style>