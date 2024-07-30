<template>
  <div class="about">
    <section class="mission-vision">
      <div class="mission">
        <h3>Mission</h3>
        <p>To build a vibrant community of sustainability enthusiasts who share and celebrate eco-friendly ideas, actions, events, and products, inspiring the world to embrace a greener lifestyle. To become the world's largest e-commerce platform and aggregator for sustainable products.</p>
      </div>
      <div class="vision">
        <h3>Vision</h3>
        <p>To become a technology leader of sustainability-related innovative products for residential, commercial, and industrial applications leveraging artificial intelligence and analytics that contribute to a greener future.</p>
      </div>
    </section>
    
    <section class="team">
      <h3>Meet Our Team</h3>
      <div class="team-grid">
        <div class="team-member" v-for="member in team" :key="member.name">
          <img :src="member.photo" :alt="member.name" class="team-photo" />
          <h4>{{ member.name }}</h4>
          <p><strong>{{ member.position }}</strong></p>
        </div>
      </div>
    </section>

    <section class="goals">
      <h3>Our Goals</h3>
      <ul>
        <li>Build a community of sustainability-minded individuals</li>
        <li>Create influencers in sustainability</li>
        <li>Focus on areas like Education, Social, Products, Influencer, Food, Medical, Volunteering</li>
      </ul>
    </section>
  </div>
</template>

<script>
export default {
  name: 'AboutView',
  data() {
    return {
      team: [
        { name: 'Sairam', position: 'Chief Sorcerer', photo: require('@/assets/team-photos/sairam.jpg') },
        { name: 'Amreish', position: 'Network Magus', photo: require('@/assets/team-photos/amreish.jpg') },
        { name: 'Viggnan', position: 'Product Magician', photo: require('@/assets/team-photos/viggnan.jpeg') },
        { name: 'Mhilan', position: 'Spellmaster of Tech', photo: require('@/assets/team-photos/mhilan.jpg') },
        { name: 'Rachana', position: 'Masters of Charms', photo: require('@/assets/team-photos/rachana.jpg') }
      ]
    }
  }
}
</script>
Sairam: Co-Founder & Chief Sorcerer
Amreish: Co-Founder & Network Magus
Mhilan: Chief Tech Wizard
Viggnan: Product Conjurer
Rachana: Co-Founder & Brand Enchanter
<style scoped>
.mission-vision {
  display: flex;
  gap: 2rem;
  margin-bottom: 2rem;
}

.mission, .vision {
  flex: 1;
  background-color: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.team, .goals {
  background-color: white;
  padding: 2rem;
  border-radius: 10px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  margin-bottom: 2rem;
}

.team-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
}

.team-member {
  text-align: center;
}

.team-photo {
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
  margin-bottom: 1rem;
  border: 3px solid #4CAF50; /* Green border */
}

.goals ul {
  list-style-type: none;
  padding: 0;
}

.goals li {
  background-color: #e7f3e7;
  margin: 0.5rem 0;
  padding: 1rem;
  border-radius: 5px;
}
</style>