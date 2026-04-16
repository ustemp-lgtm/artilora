<template>
  <div 
    class="studio-hotspot"
    :class="{ 
      'hotspot-hover': isHovered,
      'hotspot-pulse': isPulsing
    }"
    @mouseenter="isHovered = true"
    @mouseleave="isHovered = false"
    @click="$emit('click')"
  >
    <div class="hotspot-marker"></div>
    
    <div v-if="isHovered" class="hotspot-tooltip">
      {{ hotspot.title }}
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  hotspot: {
    type: Object,
    required: true
  }
})

const emit = defineEmits(['click'])

const isHovered = ref(false)
const isPulsing = ref(true)
</script>

<style scoped>
.studio-hotspot {
  position: absolute;
  width: 24px;
  height: 24px;
  cursor: pointer;
  z-index: 10;
}

.hotspot-marker {
  width: 100%;
  height: 100%;
  background: radial-gradient(circle, #FFD700 0%, rgba(255, 215, 0, 0.5) 100%);
  border: 2px solid #FFD700;
  border-radius: 50%;
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
  transition: all 0.3s ease;
}

.hotspot-pulse .hotspot-marker {
  animation: hotspotPulse 2s ease-in-out infinite;
}

@keyframes hotspotPulse {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.3);
    opacity: 0.7;
  }
}

.hotspot-hover .hotspot-marker {
  transform: scale(1.5);
  box-shadow: 0 0 30px rgba(255, 215, 0, 1);
}

.hotspot-tooltip {
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%);
  background: rgba(0, 0, 0, 0.95);
  color: #FFD700;
  padding: 8px 12px;
  border-radius: 8px;
  border: 1px solid #FFD700;
  white-space: nowrap;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  margin-bottom: 8px;
  pointer-events: none;
  box-shadow: 0 0 15px rgba(255, 215, 0, 0.5);
}

@media (max-width: 768px) {
  .studio-hotspot {
    width: 44px;
    height: 44px;
  }
  
  .hotspot-tooltip {
    display: none;
  }
}
</style>
