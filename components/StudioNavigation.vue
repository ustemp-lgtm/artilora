<template>
  <div class="studio-navigation-container" style="display: flex; flex-direction: column; align-items: center; width: 100%;">
    <!-- Headline added as requested -->
    <h2 class="text-center w-full mb-2 mt-8" style="font-family: 'Bradley Hand ITC', cursive; font-size: 1.4rem; color: #FFFFFF; font-weight: bold; text-shadow: 0 0 10px rgba(0,0,0,0.8);">
      An Exclusive Studio Experience in Six Chapters
    </h2>
    
    <div class="studio-navigation-wrapper">
    <!-- Chapter List -->
    <div class="chapters-list">
      <div 
        v-for="(zone, index) in zones"
        :key="zone.id"
        class="chapter-item"
        :class="{ 'chapter-active': index === currentIndex }"
        @click="navigateWithSound(index)"
      >
        <div class="chapter-number">Chapter-{{ index + 1 }}</div>
        <div class="chapter-name">{{ zone.name }}</div>
        <div class="chapter-subtitle" v-if="zone.subtitle">{{ zone.subtitle }}</div>
      </div>
    </div>
    
    <!-- Navigation Arrows above Details -->
    <div class="top-navigation">
      <button 
        class="nav-arrow-top"
        :disabled="currentIndex === 0"
        @click="navigateWithSound(currentIndex - 1)"
        aria-label="Previous chapter"
      >
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
      </button>
      
      <span class="current-chapter-indicator">
        Chapter {{ currentIndex + 1 }} of 6
      </span>
      
      <button 
        class="nav-arrow-top"
        :disabled="currentIndex === zones.length - 1"
        @click="navigateWithSound(currentIndex + 1)"
        aria-label="Next chapter"
      >
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="9 18 15 12 9 6"></polyline>
        </svg>
      </button>
    </div>
    
    <!-- Details Section -->
    <div v-if="currentZone" class="studio-box details-box">
      <div class="details-content">
        <h3 class="zone-title" style="margin-bottom: 5px;">Chapter-{{ currentIndex + 1 }}</h3>
        <h3 class="zone-title">{{ currentZone.name }}</h3>
        <h3 class="zone-title" v-if="currentZone.subtitle">{{ currentZone.subtitle }}</h3>
        <div class="separator"></div>
        <p class="zone-description">{{ currentZone.description }}</p>
        <p class="zone-atmosphere">{{ currentZone.atmosphere }}</p>
      </div>
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
  },
  currentZone: {
    type: Object,
    default: null
  }
})

const emit = defineEmits(['navigate'])

// Sound effect function
const playSound = () => {
  const audio = new Audio('/boom.mp3')
  audio.volume = 0.3 // Set volume to 30%
  audio.play().catch(err => console.log('Audio play failed:', err))
}

// Navigate with sound
const navigateWithSound = (index) => {
  playSound()
  emit('navigate', index)
}
</script>

<style scoped>
.studio-navigation-wrapper {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 40px;
  max-width: 1600px;
  margin: 40px auto;
  padding: 0 20px;
}

/* Top Navigation Arrows - positioned between grid and details */
.top-navigation {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 30px;
  margin: 0;
  padding: 15px 30px;
  background: rgba(0, 0, 0, 0.6);
  border: 2px solid #FFD700;
  border-radius: 50px;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
  width: fit-content;
}

.nav-arrow-top {
  background: rgba(255, 215, 0, 0.2);
  border: 2px solid #FFD700;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #FFD700;
}

.nav-arrow-top:hover:not(:disabled) {
  background: rgba(255, 215, 0, 0.4);
  transform: scale(1.1);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.6);
}

.nav-arrow-top:disabled {
  opacity: 0.3;
  cursor: not-allowed;
  border-color: rgba(255, 215, 0, 0.3);
}

.current-chapter-indicator {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFD700;
  font-weight: bold;
  text-transform: uppercase;
  letter-spacing: 1px;
  min-width: 150px;
  text-align: center;
}

/* Chapter List - 2 rows, 3 columns */
.chapters-list {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
  width: 100%;
  max-width: 1200px;
}

.chapter-item {
  padding: 20px 25px;
  background: rgba(0, 0, 0, 0.6);
  border: 3px solid #FFD700;
  border-radius: 15px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.2);
}

.chapter-item:hover {
  background: rgba(0, 0, 0, 0.8);
  transform: scale(1.02);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.4);
}

.chapter-active {
  background: rgba(0, 0, 0, 0.9);
  border-color: #FFD700;
  box-shadow: 0 0 25px rgba(255, 215, 0, 0.6);
  transform: scale(1.02);
}

.chapter-number {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFD700;
  font-weight: bold;
  margin-bottom: 6px;
  text-transform: uppercase;
}

.chapter-name {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 24px;
  color: #FFD700;
  font-weight: bold;
  margin-bottom: 6px;
  text-transform: uppercase;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

.chapter-subtitle {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFFFFF;
  opacity: 0.9;
}

/* Shared Box Styles - Invisible container */
.studio-box {
  background-color: transparent;
  border: none;
  box-shadow: none;
  padding: 0;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  position: relative;
}

/* Navigation Box - Larger for grid */
.nav-box {
  flex: 3;
  min-width: 300px;
  max-width: 1300px;
  width: 100%;
}

/* Details Box - Reduced Length (Width) */
.details-box {
  flex: 1;
  min-width: 350px;
  max-width: 500px;
  background-color: #001F3F;
  background-image: 
    linear-gradient(rgba(255, 215, 0, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 215, 0, 0.05) 1px, transparent 1px);
  background-size: 30px 30px;
  border: 2px solid #FFD700;
  border-radius: 16px;
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.2);
  padding: 30px;
}

.nav-controls {
  display: flex;
  align-items: center;
  gap: 10px;
  width: 100%;
  justify-content: center;
}

.selector-container {
  flex-grow: 1;
  display: flex;
  justify-content: center;
}

/* Navigation Arrows - Adjusted for box */
.nav-arrow {
  background: rgba(255, 215, 0, 0.1);
  border: 1px solid #FFD700;
  border-radius: 50%;
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
  color: #FFD700;
  flex-shrink: 0;
}

.nav-arrow:hover:not(:disabled) {
  background: rgba(255, 215, 0, 0.3);
  transform: scale(1.1);
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

.nav-arrow:disabled {
  opacity: 0.3;
  cursor: not-allowed;
  border-color: rgba(255, 215, 0, 0.3);
}

/* Details Typography */
.details-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100%;
  width: 100%; /* Ensure content takes full width */
  padding: 0 10px; /* Add slight internal padding */
}

.zone-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 26px;
  color: #FFD700;
  margin-bottom: 8px;
  text-transform: uppercase;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
  line-height: 1.1;
  text-align: center;
}

.zone-subtitle {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 22px;
  color: #FFD700;
  margin-bottom: 20px;
  font-weight: bold;
  opacity: 0.9;
  text-align: center;
}

.separator {
  width: 60px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #FFD700, transparent);
  margin-bottom: 24px;
}

.zone-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFFFFF;
  line-height: 1.6;
  margin-bottom: 24px;
  text-align: justify; /* Explicitly justify description */
  text-justify: inter-word;
  width: 100%;
}

.zone-atmosphere {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFFFFF; /* Changed from #FF7F50 to #FFFFFF for better readability */
  line-height: 1.6;
  border-top: 1px solid rgba(255, 215, 0, 0.2);
  padding-top: 16px;
  width: 100%;
}

@media (max-width: 1200px) {
  .studio-navigation-wrapper {
    flex-direction: column;
    align-items: center;
    gap: 20px;
  }
  
  .nav-box, .details-box {
    width: 100%;
    max-width: 800px;
    min-height: auto;
  }
  
  .studio-box {
    padding: 20px;
  }
}

@media (max-width: 900px) {
  .chapters-list {
    grid-template-columns: repeat(2, 1fr);
  }
}

@media (max-width: 600px) {
  .chapters-list {
    grid-template-columns: 1fr;
  }
}
</style>
