<template>
  <div class="community">
    <h2>Sustainability Community</h2>
    <p>Connect with like-minded individuals and share your eco-friendly ideas</p>
    
    <div class="community-content">
      <div class="community-feed">
        <h3>Recent Posts</h3>
        <div v-for="post in communityPosts" :key="post.id" class="community-post">
          <h4>{{ post.title }}</h4>
          <p>{{ post.content }}</p>
          <div class="post-meta">
            <span>Posted by: {{ post.author }}</span>
            <span>{{ post.date }}</span>
          </div>
        </div>
      </div>
      
      <div class="post-form">
        <h3>Share Your Thoughts</h3>
        <input v-model="newPost.title" placeholder="Title" required>
        <textarea v-model="newPost.content" placeholder="Your message" required></textarea>
        <button @click="submitPost" class="btn">Post</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CommunityView',
  data() {
    return {
      communityPosts: [
        { id: 1, title: 'Reducing Plastic Waste', content: 'Here are some tips to reduce plastic waste in your daily life...', author: 'EcoWarrior', date: '2024-07-19' },
        { id: 2, title: 'Community Garden Initiative', content: 'I\'m starting a community garden in our neighborhood. Who wants to join?', author: 'GreenThumb', date: '2024-07-18' },
      ],
      newPost: {
        title: '',
        content: ''
      }
    }
  },
  methods: {
    submitPost() {
      const post = {
        id: Date.now(),
        title: this.newPost.title,
        content: this.newPost.content,
        author: 'CurrentUser', // Replace with actual user data
        date: new Date().toLocaleString()
      };
      this.communityPosts.unshift(post);
      this.newPost.title = '';
      this.newPost.content = '';
    }
  }
}
</script>

<style scoped>
.community {
  padding: 2rem;
}

.community-content {
  display: flex;
  gap: 2rem;
}

.community-feed {
  flex: 2;
}

.post-form {
  flex: 1;
  background-color: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.community-post {
  background-color: white;
  padding: 1.5rem;
  border-radius: 10px;
  margin-bottom: 1.5rem;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  transition: transform 0.3s;
}

.community-post:hover {
  transform: translateY(-5px);
}

.post-meta {
  display: flex;
  justify-content: space-between;
  color: #777;
  font-size: 0.9rem;
  margin-top: 1rem;
}

.post-form input, .post-form textarea {
  width: 100%;
  margin-bottom: 10px;
  padding: 0.5rem;
  border: 1px solid #ddd;
  border-radius: 5px;
}

.btn {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  border: none;
  padding: 0.5rem;
  border-radius: 5px;
}

.btn:hover {
  background-color: #45a049;
}
</style>