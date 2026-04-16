<template>
  <div class="floating-particles-container" :class="{ 'particles-active': isActive }">
    <div 
      v-for="i in particleCount" 
      :key="i" 
      class="particle"
      :style="getParticleStyle(i)"
    ></div>
  </div>
</template>

<script setup>
const props = defineProps({
  particleCount: {
    type: Number,
    default: 30
  },
  color: {
    type: String,
    default: 'golden' // 'golden', 'white', 'mixed'
  },
  density: {
    type: String,
    default: 'medium' // 'light', 'medium', 'heavy'
  },
  speed: {
    type: String,
    default: 'slow' // 'slow', 'medium', 'fast'
  }
})

const isActive = ref(false)

onMounted(() => {
  // Activate particles after a short delay for smooth appearance
  setTimeout(() => {
    isActive.value = true
  }, 500)
})

const getParticleStyle = (index) => {
  // Random size based on density
  const sizeMultiplier = {
    light: 0.5,
    medium: 1,
    heavy: 1.5
  }[props.density]
  
  const size = (Math.random() * 3 + 1) * sizeMultiplier
  
  // Random horizontal position
  const left = Math.random() * 100
  
  // Random animation duration based on speed
  const speedMultiplier = {
    slow: 1.5,
    medium: 1,
    fast: 0.6
  }[props.speed]
  
  const duration = (Math.random() * 15 + 10) * speedMultiplier
  
  // Random delay for staggered effect
  const delay = Math.random() * 10
  
  // Random horizontal drift
  const drift = (Math.random() - 0.5) * 100
  
  // Color based on prop
  let particleColor
  if (props.color === 'golden') {
    particleColor = `rgba(255, 215, 0, ${Math.random() * 0.4 + 0.3})`
  } else if (props.color === 'white') {
    particleColor = `rgba(255, 255, 255, ${Math.random() * 0.3 + 0.2})`
  } else { // mixed
    const isGolden = Math.random() > 0.5
    particleColor = isGolden 
      ? `rgba(255, 215, 0, ${Math.random() * 0.4 + 0.3})`
      : `rgba(255, 255, 255, ${Math.random() * 0.3 + 0.2})`
  }
  
  return {
    width: `${size}px`,
    height: `${size}px`,
    left: `${left}%`,
    background: `radial-gradient(circle, ${particleColor}, transparent)`,
    animationDuration: `${duration}s`,
    animationDelay: `${delay}s`,
    '--drift': `${drift}px`,
    '--rotation': `${Math.random() * 360}deg`
  }
}
</script>

<style scoped>
.floating-particles-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 1;
  overflow: hidden;
  opacity: 0;
  transition: opacity 1s ease-in;
}

.floating-particles-container.particles-active {
  opacity: 1;
}

.particle {
  position: absolute;
  bottom: -10%;
  border-radius: 50%;
  animation: floatUpParticle linear infinite;
  filter: blur(1px);
  box-shadow: 0 0 8px currentColor;
}

@keyframes floatUpParticle {
  0% {
    bottom: -10%;
    opacity: 0;
    transform: translateX(0) rotate(0deg) scale(0.5);
  }
  10% {
    opacity: 1;
  }
  50% {
    opacity: 0.8;
    transform: translateX(var(--drift)) rotate(var(--rotation)) scale(1);
  }
  90% {
    opacity: 0.6;
  }
  100% {
    bottom: 110%;
    opacity: 0;
    transform: translateX(calc(var(--drift) * 2)) rotate(calc(var(--rotation) * 2)) scale(0.3);
  }
}

/* Reduce particles on mobile for performance */
@media (max-width: 768px) {
  .particle:nth-child(n+16) {
    display: none;
  }
}

/* Pause animation when user prefers reduced motion */
@media (prefers-reduced-motion: reduce) {
  .particle {
    animation: none;
    opacity: 0.2;
  }
}
</style>
