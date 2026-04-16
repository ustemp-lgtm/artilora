<template>
  <div class="hero-artwork">
    <!-- BACKGROUND SLIDESHOW -->
    <div class="artwork-slideshow">
      <div 
        v-for="(item, index) in artworkItems" 
        :key="index" 
        class="slide-image" 
        :class="{ active: currentImageIndex === index }"
        :style="{ backgroundImage: `url(${item.src})` }"
      ></div>
    </div>

    <!-- DARK OVERLAY GRADIENT (Essential for text readability) -->
    <div class="overlay-gradient"></div>

    <!-- BRIGHT GOLDEN GRID PATTERN - VERY VISIBLE -->
    <div class="golden-grid">
      <div class="grid-line v-line" v-for="i in 8" :key="'v'+i" :style="{ left: (i * 12.5) + '%' }"></div>
      <div class="grid-line h-line" v-for="i in 6" :key="'h'+i" :style="{ top: (i * 16.66) + '%' }"></div>
    </div>
    
    <!-- LARGE GOLDEN STARS -->
    <div class="star-decoration" style="top: 10%; left: 10%;">★</div>
    <div class="star-decoration" style="top: 20%; right: 15%;">★</div>
    <div class="star-decoration" style="bottom: 15%; left: 20%;">★</div>
    <div class="star-decoration" style="bottom: 25%; right: 10%;">★</div>

    <!-- PHILOSOPHY QUOTE - CENTER -->
    <div class="quote-container">
      <transition name="fade" mode="out-in">
        <div :key="currentQuoteIndex" class="quote-box">
          <p class="quote-text">{{ quotes[currentQuoteIndex] }}</p>
        </div>
      </transition>
    </div>

    <!-- SCULPTURE TITLE - BOTTOM CENTER -->
    <div class="sculpture-name-container">
      <transition name="fade" mode="out-in">
        <div :key="currentImageIndex" class="sculpture-name-box">
          <p class="sculpture-title">{{ artworkItems[currentImageIndex].title }}</p>
        </div>
      </transition>
    </div>
  </div>
</template>

<script setup>
const quotes = [
  "No crafting — only meditation with nature.",
  "Stillness is not absence, it is readiness.",
  "What is listened to deeply no longer needs to be forced.",
  "Alignment is the moment when the artist disappears and form arrives.",
  "In allowing the material to lead, creation becomes trust."
]

const artworkItems = [
  {
    src: '/101_arty_Comfort.png',
    title: 'Arty 101: Comfort'
  },
  {
    src: '/102_arty_A_day_That_is-Mine.png',
    title: 'Arty 102: A Day That Is Mine'
  },
  {
    src: '/103_arty_The_Darkness_of_Depth.png',
    title: 'Arty 103: The Darkness of Depth'
  },
  {
    src: '/arty_104_mother_child.png',
    title: 'Arty 104: Beyond That (Feminine)'
  },
  {
    src: '/arty_105_mother_child_part2.png',
    title: 'Arty 105: Beyond That (Masculine)'
  }
]

const currentQuoteIndex = ref(0)
const currentImageIndex = ref(0)
let quoteInterval = null
let imageInterval = null

onMounted(() => {
  // Rotate quotes every 5 seconds
  quoteInterval = setInterval(() => {
    currentQuoteIndex.value = (currentQuoteIndex.value + 1) % quotes.length
  }, 5000)

  // Rotate images every 5 seconds
  imageInterval = setInterval(() => {
    currentImageIndex.value = (currentImageIndex.value + 1) % artworkItems.length
  }, 5000)
})

onUnmounted(() => {
  if (quoteInterval) clearInterval(quoteInterval)
  if (imageInterval) clearInterval(imageInterval)
})
</script>

<style scoped>
.hero-artwork {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
  background-color: #000; /* Fallback */
}

/* SLIDESHOW STYLES */
.artwork-slideshow {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
}

.slide-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-size: cover;
  background-position: center;
  opacity: 0;
  transition: opacity 2s ease-in-out, transform 10s ease-out; /* Ken Burns effect */
  transform: scale(1);
}

.slide-image.active {
  opacity: 1;
  transform: scale(1.1);
}

/* OVERLAY */
.overlay-gradient {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(0, 31, 63, 0.7) 0%, rgba(0, 0, 0, 0.4) 50%, rgba(0, 31, 63, 0.8) 100%);
  z-index: 1;
}

/* BRIGHT GOLDEN GRID - VERY VISIBLE */
.golden-grid {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
  z-index: 2;
}

.grid-line {
  position: absolute;
  background: #FFD700;
  box-shadow: 
    0 0 10px rgba(255, 215, 0, 0.8),
    0 0 20px rgba(255, 215, 0, 0.5);
  animation: gridPulse 3s ease-in-out infinite;
}

.v-line {
  width: 2px;
  height: 100%;
  top: 0;
}

.h-line {
  height: 2px;
  width: 100%;
  left: 0;
}

@keyframes gridPulse {
  0%, 100% {
    opacity: 0.3;
  }
  50% {
    opacity: 0.6;
  }
}

/* LARGE GOLDEN STARS */
.star-decoration {
  position: absolute;
  font-size: 60px;
  color: #FFD700;
  text-shadow: 
    0 0 20px rgba(255, 215, 0, 1),
    0 0 40px rgba(255, 215, 0, 0.8);
  animation: starTwinkle 2s ease-in-out infinite;
  pointer-events: none;
  z-index: 3;
}

@keyframes starTwinkle {
  0%, 100% {
    opacity: 0.6;
    transform: scale(1);
  }
  50% {
    opacity: 1;
    transform: scale(1.2);
  }
}

/* QUOTE CONTAINER */
.quote-container {
  position: relative;
  z-index: 10;
  max-width: 800px;
  padding: 40px;
}

.quote-box {
  background: rgba(0, 10, 20, 0.7); /* Slightly more opaque dark blue/black */
  border: 4px solid #FFD700;
  border-radius: 20px;
  padding: 30px 30px;
  box-shadow: 
    0 0 40px rgba(255, 215, 0, 0.4),
    inset 0 0 30px rgba(255, 215, 0, 0.1);
  backdrop-filter: blur(5px);
}

.quote-text {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 32px;
  line-height: 1.5;
  color: #FFD700;
  text-align: center;
  text-shadow: 
    2px 2px 4px rgba(0, 0, 0, 1),
    0 0 20px rgba(255, 215, 0, 0.8);
  font-style: italic;
  font-weight: bold;
  margin: 0;
}

/* SCULPTURE NAME DISPLAY */
.sculpture-name-container {
  position: absolute;
  bottom: 40px;
  left: 0;
  width: 100%;
  display: flex;
  justify-content: center;
  z-index: 10;
  pointer-events: none;
}

.sculpture-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 24px;
  color: #FFFFFF;
  text-shadow: 
    0 2px 4px rgba(0,0,0,1),
    0 0 10px rgba(255, 215, 0, 0.6);
  background: rgba(0, 0, 0, 0.6);
  padding: 8px 24px;
  border-radius: 50px;
  border: 1px solid rgba(255, 215, 0, 0.3);
  letter-spacing: 1px;
}

/* Fade transition */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 1.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Responsive */
@media (max-width: 768px) {
  .quote-text {
    font-size: 22px;
  }
  
  .quote-box {
    padding: 20px 15px;
  }
  
  .star-decoration {
    font-size: 40px;
  }
  
  .sculpture-title {
    font-size: 16px;
    padding: 6px 16px;
    bottom: 20px;
  }
}
</style>
