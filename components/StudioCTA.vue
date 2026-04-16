<template>
  <div class="studio-cta">
    <div class="cta-content">
      <h2 class="cta-title">Inspired by the Studio?</h2>
      <p class="cta-description">
        Step into the living breath of Artilora Studio, where every sculpture carries its own unfolding destiny—some in the quiet glow of completion, others still trembling in the raw electricity of becoming. Here, forms do not simply take shape; they live through seasons of transformation. A figure resting on the workbench may still bear the marks of yesterday's struggle, while another, standing proudly in the corner, holds the calm dignity of a soul that has finally found its form. Each creation moves through its own pilgrimage—enduring the chisels of change, absorbing the silence of contemplation, and awakening under the gentle conversation of light, shadow, and time.
      </p>
      <p class="cta-description">
        Wander among them and feel their stories: a curve refined after many trials, a texture born from an unexpected moment of insight, a silhouette that grew only after surrendering to what the material wished to be. They stand not as objects, but as companions in a shared journey—shaped, tested, and ultimately transformed within the sanctuary of Artilora.
      </p>
      <p class="cta-description">
        And should your heart wish to walk deeper into these evolving worlds—into the mysteries behind each sculpture's life, or the unseen chapters of their creation—you are warmly invited to reach out. Within this studio, every inquiry becomes part of the continuing story, another gentle stroke in the poetry we shape together.
      </p>
      <div class="cta-buttons">
        <NuxtLink to="/gallery" class="cta-button cta-primary">
          View Gallery
        </NuxtLink>
        <NuxtLink to="/contact" class="cta-button cta-secondary">
          Get in Touch
        </NuxtLink>
      </div>
    </div>
  </div>
</template>

<script setup>
</script>

<style scoped>
.studio-cta {
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.9), rgba(0, 0, 0, 0.9));
  border-top: 3px solid #FFD700;
  padding: 80px 20px;
  text-align: center;
  margin-top: 60px;
  position: relative;
}

.studio-cta::before {
  content: '';
  position: absolute;
  top: -60px;
  left: 0;
  right: 0;
  height: 60px;
  background: 
    linear-gradient(90deg, 
      transparent 0%, 
      rgba(255, 215, 0, 0.05) 20%,
      rgba(255, 215, 0, 0.1) 50%,
      rgba(255, 215, 0, 0.05) 80%,
      transparent 100%
    ),
    repeating-linear-gradient(
      0deg,
      transparent,
      transparent 9px,
      rgba(255, 215, 0, 0.2) 9px,
      rgba(255, 215, 0, 0.2) 10px,
      transparent 10px,
      transparent 19px,
      rgba(255, 215, 0, 0.1) 19px,
      rgba(255, 215, 0, 0.1) 20px
    );
  pointer-events: none;
}

.studio-cta::after {
  content: '✦ ✦ ✦';
  position: absolute;
  top: -40px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 20px;
  color: #FFD700;
  letter-spacing: 40px;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.6);
  animation: sparkle 3s ease-in-out infinite;
}

@keyframes sparkle {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}

.cta-content {
  max-width: 1000px;
  margin: 0 auto;
}

.cta-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 28px;
  color: #FFD700;
  margin-bottom: 24px;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

.cta-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 19px;
  color: #FFFFFF;
  line-height: 1.5;
  margin-bottom: 16px;
  text-align: justify;
  text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.9);
}

.cta-description:last-of-type {
  margin-bottom: 32px;
}

.cta-buttons {
  display: flex;
  justify-content: center;
  gap: 24px;
  flex-wrap: wrap;
}

.cta-button {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 20px;
  padding: 16px 40px;
  border-radius: 12px;
  text-decoration: none;
  transition: all 0.3s ease;
  display: inline-block;
}

.cta-primary {
  background: #FFD700;
  color: #000000;
  border: 2px solid #FFD700;
}

.cta-primary:hover {
  background: #FFA500;
  border-color: #FFA500;
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.8);
  transform: translateY(-2px);
}

.cta-secondary {
  background: transparent;
  color: #FFD700;
  border: 2px solid #FFD700;
}

.cta-secondary:hover {
  background: rgba(255, 215, 0, 0.2);
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.6);
  transform: translateY(-2px);
}

@media (max-width: 768px) {
  .studio-cta {
    padding: 60px 16px;
  }
  
  .cta-title {
    font-size: 20px;
  }
  
  .cta-description {
    font-size: 18px;
  }
  
  .cta-buttons {
    flex-direction: column;
    gap: 16px;
  }
  
  .cta-button {
    font-size: 18px;
    padding: 14px 32px;
  }
}
</style>
