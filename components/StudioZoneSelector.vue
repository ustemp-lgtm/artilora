<template>
  <div class="zone-selector">
    <div 
      v-for="(zone, index) in zones"
      :key="zone.id"
      class="zone-thumb"
      :class="{ 'zone-active': index === currentIndex }"
      @click="$emit('select', index)"
    >
      <img :src="zone.thumbnail" alt="" />
    <div class="zone-name">
        <div class="zone-headline" style="margin-bottom: 2px;">Chapter-{{ index + 1 }}</div>
        <div class="zone-headline">{{ zone.name }}</div>
        <div class="zone-headline" v-if="zone.subtitle" style="margin-top: 2px;"><span class="subtitle-text">{{ zone.subtitle }}</span></div>
      </div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  zones: {
    type: Array,
    default: () => []
  },
  currentIndex: {
    type: Number,
    default: 0
  }
})

defineEmits(['select'])
</script>

<style scoped>
.zone-selector {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  padding: 20px;
  justify-items: stretch;
  align-items: stretch;
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
}

.zone-selector::-webkit-scrollbar {
  display: none;
}

.zone-selector::-webkit-scrollbar-track {
  background: #000;
}

.zone-selector::-webkit-scrollbar-thumb {
  background: #FFD700;
  border-radius: 4px;
}

.zone-thumb {
  width: 100%;
  aspect-ratio: 1.6 / 1;
  cursor: pointer;
  transition: all 0.3s ease;
  opacity: 0.85;
  border: 3px solid #FFD700;
  border-radius: 12px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: rgba(0, 0, 0, 0.85);
  position: relative;
  overflow: hidden;
  user-select: none;
  -webkit-tap-highlight-color: transparent;
  outline: none;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
}
.zone-thumb:focus {
  outline: none;
}

.zone-thumb:hover {
  opacity: 1;
  transform: translateY(-5px) scale(1.02);
  box-shadow: 0 8px 25px rgba(255, 215, 0, 0.6);
}

.zone-active {
  opacity: 1;
  border: 3px solid #FFD700;
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.9);
  background: rgba(0, 0, 0, 0.9);
  transform: scale(1.05);
}

.zone-thumb img {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 10px;
  opacity: 0;
  display: none;
}

.zone-name {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  font-family: 'Bradley Hand ITC', 'Segoe Print', cursive;
  color: #FFD700;
  line-height: 1.4;
  width: 95%;
  padding: 10px;
  z-index: 10;
  background: rgba(0, 0, 0, 0.6);
  border-radius: 8px;
}

.zone-headline {
  font-size: clamp(16px, 2.2vw, 26px);
  font-weight: bold;
  letter-spacing: 1.5px;
  text-transform: uppercase;
  white-space: normal;
  word-wrap: break-word;
  text-shadow: 
    0 0 15px rgba(0, 0, 0, 1),
    0 0 8px rgba(255, 215, 0, 0.8),
    2px 2px 4px rgba(0, 0, 0, 0.9);
  margin: 2px 0;
}

.subtitle-text {
  font-size: clamp(13px, 1.8vw, 20px);
  font-weight: 500;
  letter-spacing: 0.5px;
}

.zone-detail {
  font-size: 15px;
  margin-top: 3px;
  opacity: 1;
  text-shadow: 0 0 10px rgba(0, 0, 0, 0.9), 0 0 4px rgba(0, 0, 0, 0.8);
  font-weight: 500;
}

@media (max-width: 768px) {
  .zone-selector {
    grid-template-columns: repeat(2, 1fr);
    gap: 8px;
    padding: 10px 4px;
  }
  
  .zone-thumb {
    max-width: 100%;
    aspect-ratio: 1.4 / 1;
  }
  
  .zone-thumb img {
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
  
  .zone-headline {
    font-size: 14px;
    font-size: clamp(12px, 4vw + 4px, 18px);
  }
  
  .subtitle-text {
    font-size: 12px;
    font-size: clamp(10px, 3vw + 4px, 15px);
  }
  
  .zone-detail {
    font-size: 12px;
  }
}
</style>
