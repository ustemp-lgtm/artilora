<template>
  <div v-if="isDesktop" class="custom-cursor-container">
    <!-- Main cursor dot -->
    <div 
      ref="cursorDot" 
      class="cursor-dot"
      :style="{ left: cursorX + 'px', top: cursorY + 'px' }"
    ></div>
    
    <!-- Cursor ring -->
    <div 
      ref="cursorRing" 
      class="cursor-ring"
      :class="{ 'cursor-ring-hover': isHovering }"
      :style="{ left: cursorRingX + 'px', top: cursorRingY + 'px' }"
    ></div>
    
    <!-- Golden particles trail -->
    <div 
      v-for="particle in particles" 
      :key="particle.id"
      class="cursor-particle"
      :style="{
        left: particle.x + 'px',
        top: particle.y + 'px',
        opacity: particle.opacity,
        transform: `scale(${particle.scale})`,
        animationDelay: particle.delay + 's'
      }"
    ></div>
  </div>
</template>

<script setup>
const isDesktop = ref(false)
const cursorX = ref(0)
const cursorY = ref(0)
const cursorRingX = ref(0)
const cursorRingY = ref(0)
const isHovering = ref(false)
const particles = ref([])
let particleId = 0
let animationFrameId = null

// Check if device is desktop
onMounted(() => {
  if (process.client) {
    // Only show custom cursor on desktop devices
    isDesktop.value = window.innerWidth > 768 && !('ontouchstart' in window)
    
    if (isDesktop.value) {
      // Hide default cursor
      document.body.style.cursor = 'none'
      
      // Mouse move handler
      document.addEventListener('mousemove', handleMouseMove)
      
      // Hover detection for interactive elements
      const interactiveElements = 'a, button, input, textarea, select, [role="button"], .cursor-pointer'
      document.addEventListener('mouseover', (e) => {
        if (e.target.closest(interactiveElements)) {
          isHovering.value = true
        }
      })
      document.addEventListener('mouseout', (e) => {
        if (e.target.closest(interactiveElements)) {
          isHovering.value = false
        }
      })
      
      // Start particle animation
      animateParticles()
    }
  }
})

onUnmounted(() => {
  if (process.client && isDesktop.value) {
    document.body.style.cursor = 'auto'
    document.removeEventListener('mousemove', handleMouseMove)
    if (animationFrameId) {
      cancelAnimationFrame(animationFrameId)
    }
  }
})

const handleMouseMove = (e) => {
  // Update cursor position immediately
  cursorX.value = e.clientX
  cursorY.value = e.clientY
  
  // Update ring position with smooth delay
  setTimeout(() => {
    cursorRingX.value = e.clientX
    cursorRingY.value = e.clientY
  }, 50)
  
  // Create particle trail (throttled)
  if (Math.random() > 0.7) {
    createParticle(e.clientX, e.clientY)
  }
}

const createParticle = (x, y) => {
  const particle = {
    id: particleId++,
    x: x + (Math.random() - 0.5) * 20,
    y: y + (Math.random() - 0.5) * 20,
    opacity: 1,
    scale: Math.random() * 0.5 + 0.5,
    delay: Math.random() * 0.3,
    createdAt: Date.now()
  }
  
  particles.value.push(particle)
  
  // Remove particle after animation
  setTimeout(() => {
    particles.value = particles.value.filter(p => p.id !== particle.id)
  }, 1000)
}

const animateParticles = () => {
  const now = Date.now()
  
  particles.value.forEach(particle => {
    const age = now - particle.createdAt
    const progress = age / 1000 // 1 second lifetime
    
    // Fade out and scale down
    particle.opacity = Math.max(0, 1 - progress)
    particle.scale = Math.max(0, particle.scale * (1 - progress * 0.5))
    
    // Float upward
    particle.y -= 0.5
  })
  
  animationFrameId = requestAnimationFrame(animateParticles)
}
</script>

<style scoped>
.custom-cursor-container {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 9999;
}

/* Main cursor dot - Vibrant with dark border for visibility */
.cursor-dot {
  position: fixed;
  width: 12px;
  height: 12px;
  background: radial-gradient(circle, #00D9FF 0%, #0099CC 100%);
  border: 2px solid rgba(0, 0, 0, 0.8);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  pointer-events: none;
  z-index: 10000;
  box-shadow: 
    0 0 15px rgba(0, 217, 255, 0.9),
    0 0 25px rgba(0, 217, 255, 0.6),
    0 0 35px rgba(0, 217, 255, 0.3),
    inset 0 0 8px rgba(255, 255, 255, 0.5);
  transition: transform 0.1s ease-out;
  animation: dotPulse 2s ease-in-out infinite;
}

@keyframes dotPulse {
  0%, 100% {
    transform: translate(-50%, -50%) scale(1);
    box-shadow: 
      0 0 15px rgba(0, 217, 255, 0.9),
      0 0 25px rgba(0, 217, 255, 0.6),
      0 0 35px rgba(0, 217, 255, 0.3),
      inset 0 0 8px rgba(255, 255, 255, 0.5);
  }
  50% {
    transform: translate(-50%, -50%) scale(1.15);
    box-shadow: 
      0 0 20px rgba(0, 217, 255, 1),
      0 0 30px rgba(0, 217, 255, 0.8),
      0 0 40px rgba(0, 217, 255, 0.5),
      inset 0 0 12px rgba(255, 255, 255, 0.7);
  }
}

/* Cursor ring - Vibrant cyan with dark border */
.cursor-ring {
  position: fixed;
  width: 40px;
  height: 40px;
  border: 3px solid rgba(0, 217, 255, 0.7);
  outline: 1px solid rgba(0, 0, 0, 0.6);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  pointer-events: none;
  z-index: 9999;
  transition: all 0.15s ease-out;
  box-shadow: 
    0 0 20px rgba(0, 217, 255, 0.5),
    inset 0 0 15px rgba(0, 217, 255, 0.2);
  background: radial-gradient(circle, transparent 60%, rgba(0, 217, 255, 0.08) 100%);
}

.cursor-ring-hover {
  width: 56px;
  height: 56px;
  border-color: rgba(0, 217, 255, 0.95);
  border-width: 4px;
  outline-width: 2px;
  box-shadow: 
    0 0 30px rgba(0, 217, 255, 0.8),
    inset 0 0 20px rgba(0, 217, 255, 0.3);
  background: radial-gradient(circle, transparent 50%, rgba(0, 217, 255, 0.15) 100%);
}

/* Vibrant sparkle particles with dark outline */
.cursor-particle {
  position: fixed;
  width: 8px;
  height: 8px;
  background: radial-gradient(circle, #00FFFF 0%, #00D9FF 50%, rgba(0, 217, 255, 0.5) 70%, transparent 80%);
  border: 1px solid rgba(0, 0, 0, 0.5);
  border-radius: 50%;
  transform: translate(-50%, -50%);
  pointer-events: none;
  z-index: 9998;
  animation: particleFloat 1s ease-out forwards;
  box-shadow: 
    0 0 12px rgba(0, 255, 255, 0.9),
    inset 0 0 4px rgba(255, 255, 255, 0.8);
}

@keyframes particleFloat {
  0% {
    opacity: 1;
    transform: translate(-50%, -50%) scale(1) rotate(0deg);
  }
  100% {
    opacity: 0;
    transform: translate(-50%, -80px) scale(0.2) rotate(180deg);
  }
}

/* Bright star sparkle effect */
.cursor-particle::before {
  content: '';
  position: absolute;
  top: 50%;
  left: 50%;
  width: 140%;
  height: 140%;
  background: 
    linear-gradient(45deg, transparent 40%, #00FFFF 50%, transparent 60%),
    linear-gradient(-45deg, transparent 40%, #00FFFF 50%, transparent 60%);
  transform: translate(-50%, -50%);
  animation: diamondSparkle 0.8s ease-in-out infinite;
  opacity: 0.9;
  filter: drop-shadow(0 0 3px rgba(0, 255, 255, 0.8));
}

@keyframes diamondSparkle {
  0%, 100% {
    opacity: 0;
    transform: translate(-50%, -50%) scale(0.5) rotate(0deg);
  }
  50% {
    opacity: 1;
    transform: translate(-50%, -50%) scale(1.4) rotate(90deg);
  }
}

/* Hide on mobile/tablet */
@media (max-width: 768px), (hover: none) {
  .custom-cursor-container {
    display: none;
  }
}
</style>
