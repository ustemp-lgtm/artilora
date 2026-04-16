<template>
  <div class="studio-hero">
    <div class="hero-content">
      <h1 class="hero-title">Virtual Studio Tour</h1>
      <p class="hero-subtitle">Step inside the creative space where aerial root sculptures are born</p>
      <p class="hero-description">
        Step into the trembling heart of creation, where every chapter of the studio unfolds like a myth in motion. Here, aerial-root sculptures are not merely crafted—they are conjured from nature’s ancient pulse, rising through storms of emotion, shaped by hands that listen to the silent thunder within the earth. Enter the workshop, a realm where tools glimmer like ritual instruments and raw roots lie in quiet anticipation, waiting to be awakened. The air is thick with the scent of soil and possibility; shadows dance across half-formed figures, and the atmosphere hums with the fierce, unbroken energy of transformation. This is where wilderness surrenders to vision, and vision surrenders to art. As you wander, follow the golden hot spots like guiding constellations. Each one reveals a hidden truth, a fragment of the studio’s soul—offering glimpses into the alchemy, struggle, and wonder that breathe life into every sculpture. Here, creation is not a process. It is a drama. A pilgrimage. A spell made visible.
      </p>
      <div class="hero-instructions">
        <div class="instruction">
          <span class="instruction-icon">🖱️</span>
          <span>Click hotspots to explore</span>
        </div>
        <div class="instruction">
          <span class="instruction-icon">⌨️</span>
          <span>Use arrow keys to navigate</span>
        </div>
        <div class="instruction">
          <span class="instruction-icon">📱</span>
          <span>Swipe on mobile</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
.studio-hero {
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.9), rgba(0, 0, 0, 0.9));
  border-bottom: 3px solid #FFD700;
  padding: 80px 20px 60px;
  text-align: center;
}

.hero-content {
  max-width: 1000px; /* Match StudioCTA */
  margin: 0 auto;
}

.hero-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 28px;
  color: #FFD700;
  margin-bottom: 24px;
  text-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
  animation: fadeInDown 0.8s ease-out;
}

.hero-subtitle {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 24px;
  color: #FF7F50;
  margin-bottom: 32px;
  animation: fadeInDown 0.8s ease-out 0.2s both;
}

.hero-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 19px;
  color: #FFFFFF;
  line-height: 1.5;
  margin-bottom: 40px;
  animation: fadeInDown 0.8s ease-out 0.4s both;
  text-align: justify;
  text-justify: inter-word; /* Better justification */
  padding: 0 20px; /* Add padding inside */
  text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.9);
}

.hero-instructions {
  display: flex;
  justify-content: center;
  gap: 32px;
  flex-wrap: wrap;
  animation: fadeInUp 0.8s ease-out 0.6s both;
}

.instruction {
  display: flex;
  align-items: center;
  gap: 8px;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFD700;
}

.instruction-icon {
  font-size: 24px;
}

@keyframes fadeInDown {
  from {
    opacity: 0;
    transform: translateY(-20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 768px) {
  .studio-hero {
    padding: 60px 16px 40px;
  }
  
  .hero-title {
    font-size: 20px;
  }
  
  .hero-subtitle {
    font-size: 18px;
  }
  
  .hero-description {
    font-size: 17px;
    padding: 0 10px;
  }
  
  .hero-instructions {
    gap: 16px;
  }
  
  .instruction {
    font-size: 14px;
  }
  
  .instruction-icon {
    font-size: 20px;
  }
}
</style>
