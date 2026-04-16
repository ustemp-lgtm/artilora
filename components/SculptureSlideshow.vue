<template>
  <div class="sculpture-slideshow">
    <!-- Background gradient -->
    <div class="background-layer"></div>
    
    <!-- Main content container - side by side layout -->
    <div class="content-wrapper">
      <!-- Left side - Philosophy Text with Typewriter Effect -->
      <div class="quote-section">
        <div class="philosophy-container">
          <!-- Paragraphs -->
          <p class="philosophy-paragraph">{{ paragraph1 }}</p>
          <p class="philosophy-paragraph">{{ paragraph2 }}</p>
        </div>
      </div>
      
      <!-- Right side - Sculpture display -->
      <div class="sculpture-section">
        <!-- Navigation dots - at top of sculpture section -->
        <div class="navigation-dots">
          <button
            v-for="(sculpture, index) in sculptures"
            :key="index"
            @click="goToSlide(index)"
            class="dot"
            :class="{ active: currentIndex === index }"
            :aria-label="`Go to sculpture ${index + 1}`"
          ></button>
        </div>

        <transition name="slide-fade" mode="out-in">
          <div :key="currentIndex" class="sculpture-item">
            <div class="sculpture-info">
              <h3 class="sculpture-title">{{ sculptures[currentIndex].title }}</h3>
            </div>
            <img 
              :src="sculptures[currentIndex].image" 
              :alt="sculptures[currentIndex].title"
              class="sculpture-image"
            />
          </div>
        </transition>

      </div>
    </div>
  </div>
</template>

<script setup>
const sculptures = [
  {
    title: 'Arty 101: Comfort',
    image: '/arty_101_comfort.jpg'
  },
  {
    title: 'Arty 102: A Day That Is Mine',
    image: '/arty_102_a_day_that_is_mine.jpg'
  },
  {
    title: 'Arty 103: The Darkness of Depth',
    image: '/arty_103_the_darkness_of_depth.jpg'
  },
  {
    title: 'Arty 104: Beyond That (Feminine)',
    image: '/arty_104_beyond_that_feminine.jpg'
  },
  {
    title: 'Arty 105: Beyond That (Masculine)',
    image: '/arty_105_beyond_that_masculine.jpg'
  },
  {
    title: 'Arty 106: Apathy',
    image: '/arty_106_Apathy.jpg'
  },
  {
    title: 'Arty 107: Lady of Modesty',
    image: '/arty_107_Lady_of_Modesty.jpg'
  },
  {
    title: 'Arty 108: The End of Comfort',
    image: '/arty_108_The_End_of_Comfort.jpg'
  },
  {
    title: 'Arty 109: The Mother & Child Part 2',
    image: '/arty_105_mother_child_part2.png'
  },
  {
    title: 'Arty 110: A Distant Solace',
    image: '/arty_110_a_Distant_solace.png'
  },
  {
    title: 'Arty 111: Agony: The Burden Within',
    image: '/agony_the_burden_within.png'
  },
  {
    title: 'Arty 112: Agony: A Shared Wound',
    image: '/agony_a_shared_wound.png'
  }
]

// Philosophy text split into paragraphs
const paragraph1 = "Artilora: The first sculpture in the universe, born of nature, symbolically evocative. Here, we do not build; we meditate. For the first time, nature acts as the sculptor—the spatial and temporal senses of the sculpture set its rhythm and melody. We honor the truth of profound stillness. Listening deeply and thinking deeply is the experience of art, the breath of the artist. By allowing nature to lead as sculptor, creation becomes an act of faith. This is the moment of complete alignment: the sculptor disappears, and the reality of the sculpture fully emerges."

const paragraph2 = "In Artilora, the universe whispers its primordial form, where elemental forces carve eternity from silence. We surrender our silence and contemplation to the wind's caress and the earth's patient pulse, bearing witness to an eternal origin. This communion unveils the essence of presence—where deep observation merges the self into infinity. Nature, as the sovereign artist, orchestrates a symphony of form and emptiness; in this sacred surrender, the artwork transcends, revealing the universe's unspoken truth."

const currentIndex = ref(0)
let sculptureIntervalId = null

onMounted(() => {
  // Start simple slideshow loop
  sculptureIntervalId = setInterval(() => {
    currentIndex.value = (currentIndex.value + 1) % sculptures.length
  }, 4000)
})

const goToSlide = (index) => {
  currentIndex.value = index
}

onUnmounted(() => {
  if (sculptureIntervalId) {
    clearInterval(sculptureIntervalId)
  }
})
</script>

<style scoped>
.sculpture-slideshow {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  overflow: hidden;
}

.background-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(135deg, rgba(0, 31, 63, 0.4) 0%, rgba(0, 0, 0, 0.9) 100%);
  pointer-events: none;
  z-index: 1;
}

/* Main content wrapper - side by side */
.content-wrapper {
  position: relative;
  z-index: 10;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 20px;
  gap: 30px;
}

/* Left side - Quote section */
.quote-section {
  flex: 0 0 55%;
  min-width: 55%;
  display: flex;
  align-items: stretch;
  justify-content: center;
  padding: 40px 0 40px 40px;
  position: relative;
  height: 100%;
  z-index: 20;
  background: rgba(0, 0, 0, 0.95);
}

/* Philosophy container */
.philosophy-container {
  width: 100%;
  max-width: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  text-align: justify;
  padding: 50px 0;
  height: 100%;
  min-height: 80vh;
  gap: 1.5em;
}

.philosophy-paragraph {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: clamp(16px, 3vh, 20px);
  line-height: 1.5;
  margin: 0;
  padding: 0;
  color: #FFFFFF;
  font-weight: normal;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 1);
  text-align: justify;
  flex: 0 0 auto;
}

/* Blinking cursor for typewriter effect */
.cursor {
  display: inline-block;
  animation: blink 1s step-end infinite;
  margin-left: 2px;
  font-weight: normal;
}

@keyframes blink {
  0%, 50% {
    opacity: 1;
  }
  51%, 100% {
    opacity: 0;
  }
}

/* Right side - Sculpture section */
.sculpture-section {
  flex: 0 0 45%;
  min-width: 45%;
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  z-index: 12;
  position: relative;
}

.sculpture-item {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 15px;
  padding: 10px;
  padding-bottom: 40px;
  padding-top: 60px;
}

.sculpture-image {
  max-width: 100%;
  max-height: 65vh;
  width: auto;
  height: auto;
  object-fit: contain;
  filter: drop-shadow(0 10px 30px rgba(0, 0, 0, 0.8));
  border-radius: 8px;
}

.sculpture-info {
  text-align: center;
  padding: 10px 0;
}

.sculpture-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFD700;
  margin: 0;
  text-shadow: 
    3px 3px 10px rgba(0, 0, 0, 1),
    0 0 30px rgba(255, 215, 0, 0.9),
    0 0 40px rgba(255, 215, 0, 0.6);
  font-weight: bold;
  letter-spacing: 0.5px;
}

/* Navigation dots - at top of sculpture section */
.navigation-dots {
  position: absolute;
  top: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 12px;
  z-index: 20;
  justify-content: center;
}

.dot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: rgba(255, 215, 0, 0.3);
  border: 2px solid #FFD700;
  cursor: pointer;
  transition: all 0.3s ease;
  padding: 0;
}

.dot:hover {
  background: rgba(255, 215, 0, 0.6);
  transform: scale(1.2);
}

.dot.active {
  background: #FFD700;
  box-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

/* Slide fade transition */
.slide-fade-enter-active {
  transition: all 0.8s ease;
}

.slide-fade-leave-active {
  transition: all 0.6s ease;
}

.slide-fade-enter-from {
  opacity: 0;
  transform: translateX(30px);
}

.slide-fade-leave-to {
  opacity: 0;
  transform: translateX(-30px);
}

/* Responsive */
@media (max-width: 768px) {
  .content-wrapper {
    flex-direction: column;
    gap: 20px;
    padding: 15px;
  }
  
  .quote-section {
    flex: 0 0 auto;
    min-width: 100%;
    width: 100%;
    height: auto;
  }
  
  .philosophy-paragraph {
    font-size: 20px;
    line-height: 1.4;
  }
  
  .sculpture-section {
    flex: 1;
    min-width: 100%;
    width: 100%;
  }
  
  .sculpture-title {
    font-size: 14px;
  }
  
  .sculpture-image {
    max-width: 100%;
    max-height: 90%;
  }
  
  .navigation-dots {
    top: 10px;
  }
  
  .dot {
    width: 10px;
    height: 10px;
  }
}
</style>
