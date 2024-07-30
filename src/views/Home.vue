<template>
  <div class="home">
    <section class="hero">
      <h1>Welcome to Project S</h1>
      <p class="tagline">A Better Social Media, A Better World!</p>
      <p>A social media cum e-commerce platform for sustainability</p>
    </section>

    <section class="features">
      <div class="feature">
        <i class="fas fa-users"></i>
        <h3>Community Building</h3>
      </div>
      <div class="feature">
        <i class="fas fa-leaf"></i>
        <h3>Eco-friendly Marketplace</h3>
      </div>
      <div class="feature">
        <i class="fas fa-book"></i>
        <h3>Sustainability Education</h3>
      </div>
      <div class="feature">
        <i class="fas fa-calendar-alt"></i>
        <h3>Green Event Promotion</h3>
      </div>
    </section>

    <section class="post-form">
      <h2>Share Your Thoughts</h2>
      <input v-model="newPost.title" placeholder="Post Title" required>
      <textarea v-model="newPost.content" placeholder="Write your post..." required></textarea>
      <button @click="createPost" class="btn">Post</button>
    </section>

    <section class="posts">
      <h2>Recent Posts</h2>
      <div v-for="post in posts" :key="post.id" class="post">
        <h3>{{ post.title }}</h3>
        <p>{{ post.content }}</p>
        <small>Posted on: {{ post.date }}</small>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  name: 'HomeView',
  data() {
    return {
      posts: [],
      newPost: {
        title: '',
        content: ''
      }
    }
  },
  created() {
    this.loadPosts()
  },
  methods: {
    createPost() {
      if (this.newPost.title && this.newPost.content) {
        const post = {
          id: Date.now(),
          title: this.newPost.title,
          content: this.newPost.content,
          date: new Date().toLocaleString()
        }
        this.posts.unshift(post)
        this.savePosts()
        this.newPost.title = ''
        this.newPost.content = ''
      }
    },
    loadPosts() {
      const savedPosts = localStorage.getItem('projectS_posts')
      if (savedPosts) {
        this.posts = JSON.parse(savedPosts)
      }
    },
    savePosts() {
      localStorage.setItem('projectS_posts', JSON.stringify(this.posts))
    }
  }
}
</script>

<style scoped>
.hero {
  background: linear-gradient(rgba(76, 175, 80, 0.8), rgba(52, 152, 219, 0.8));
  color: white;
  text-align: center;
  padding: 4rem 2rem;
  border-radius: 10px;
  margin-bottom: 2rem;
}

.features {
  display: flex;
  justify-content: space-around;
  padding: 3rem 1rem;
  background-color: white;
}

.feature {
  text-align: center;
}

.feature i {
  font-size: 3rem;
  color: var(--primary-green);
  margin-bottom: 1rem;
}

.post-form, .posts {
  background-color: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin: 2rem 0;
}

.post-form input, .post-form textarea {
  width: 100%;
  padding: 0.5rem;
  margin-bottom: 1rem;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.posts .post {
  background-color: #f9f9f9;
  padding: 1rem;
  border-radius: 5px;
  margin-bottom: 1rem;
}

.posts .post:hover {
  transform: translateY(-5px);
}
</style>