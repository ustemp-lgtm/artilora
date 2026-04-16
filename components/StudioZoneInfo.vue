<template>
  <div class="studio-zone-info">
    <h2 class="zone-name">{{ name }}</h2>
    <p class="zone-atmosphere">{{ atmosphere }}</p>
    <p class="zone-description">{{ description }}</p>
  </div>
</template>

<script setup>
defineProps({
  name: {
    type: String,
    required: true
  },
  description: {
    type: String,
    required: true
  },
  atmosphere: {
    type: String,
    required: true
  }
})
</script>

<style scoped>
.studio-zone-info {
  background-color: #000000;
  background-image: 
    linear-gradient(rgba(255, 215, 0, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 215, 0, 0.05) 1px, transparent 1px);
  background-size: 30px 30px;
  border: 2px solid #FFD700;
  border-radius: 16px;
  padding: 24px;
  margin-top: 32px;
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.2);
}

.zone-name {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 32px;
  color: #FFD700;
  margin-bottom: 12px;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

.zone-atmosphere {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FF7F50;
  font-style: italic;
  margin-bottom: 16px;
  line-height: 1.5;
}

.zone-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFFFFF;
  line-height: 1.7;
}

@media (max-width: 768px) {
  .studio-zone-info {
    padding: 16px;
    margin-top: 20px;
  }
  
  .zone-name {
    font-size: 24px;
  }
  
  .zone-atmosphere {
    font-size: 14px;
  }
  
  .zone-description {
    font-size: 16px;
  }
}
</style>
