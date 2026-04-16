<template>
  <div class="parallax-container" ref="container">
    <div 
      class="parallax-layer parallax-bg"
      :style="{ transform: `translateY(${scrollY * 0.5}px)` }"
    >
      <slot name="background"></slot>
    </div>
    
    <div 
      class="parallax-layer parallax-mid"
      :style="{ transform: `translateY(${scrollY * 0.3}px)` }"
    >
      <slot name="midground"></slot>
    </div>
    
    <div 
      class="parallax-layer parallax-front"
      :style="{ transform: `translateY(${scrollY * 0.1}px)` }"
    >
      <slot name="foreground"></slot>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const container = ref(null)
const scrollY = ref(0)

const handleScroll = () => {
  if (container.value) {
    const rect = container.value.getBoundingClientRect()
    const containerTop = rect.top
    const windowHeight = window.innerHeight
    
    // Calculate scroll position relative to container
    if (containerTop < windowHeight && containerTop > -rect.height) {
      scrollY.value = (windowHeight - containerTop) * 0.5
    }
  }
}

onMounted(() => {
  window.addEventListener('scroll', handleScroll, { passive: true })
  handleScroll()
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.parallax-container {
  position: relative;
  overflow: hidden;
  min-height: 100vh;
}

.parallax-layer {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  will-change: transform;
  transition: transform 0.1s ease-out;
}

.parallax-bg {
  z-index: 1;
}

.parallax-mid {
  z-index: 2;
}

.parallax-front {
  z-index: 3;
}
</style>
