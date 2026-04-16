<template>
  <div 
    ref="element"
    :class="[
      'scroll-animated',
      { 'is-visible': isVisible }
    ]"
    :style="animationStyle"
  >
    <slot></slot>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted, computed } from 'vue'

const props = defineProps({
  animation: {
    type: String,
    default: 'fade-up', // fade-up, fade-down, fade-left, fade-right, zoom-in, slide-up
    validator: (value) => ['fade-up', 'fade-down', 'fade-left', 'fade-right', 'zoom-in', 'slide-up'].includes(value)
  },
  delay: {
    type: Number,
    default: 0
  },
  duration: {
    type: Number,
    default: 800
  }
})

const element = ref(null)
const isVisible = ref(false)

const animationStyle = computed(() => ({
  transitionDelay: `${props.delay}ms`,
  transitionDuration: `${props.duration}ms`
}))

let observer = null

onMounted(() => {
  observer = new IntersectionObserver(
    (entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible.value = true
          // Once visible, stop observing
          observer.unobserve(entry.target)
        }
      })
    },
    {
      threshold: 0.1,
      rootMargin: '0px 0px -50px 0px'
    }
  )

  if (element.value) {
    observer.observe(element.value)
  }
})

onUnmounted(() => {
  if (observer && element.value) {
    observer.unobserve(element.value)
  }
})
</script>

<style scoped>
.scroll-animated {
  opacity: 0;
  transition-property: opacity, transform;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}

/* Fade Up */
.scroll-animated:not(.is-visible) {
  transform: translateY(50px);
}

.scroll-animated.is-visible {
  opacity: 1;
  transform: translateY(0);
}

/* Fade Down */
.scroll-animated[data-animation="fade-down"]:not(.is-visible) {
  transform: translateY(-50px);
}

/* Fade Left */
.scroll-animated[data-animation="fade-left"]:not(.is-visible) {
  transform: translateX(-50px);
}

/* Fade Right */
.scroll-animated[data-animation="fade-right"]:not(.is-visible) {
  transform: translateX(50px);
}

/* Zoom In */
.scroll-animated[data-animation="zoom-in"]:not(.is-visible) {
  transform: scale(0.8);
}

.scroll-animated[data-animation="zoom-in"].is-visible {
  transform: scale(1);
}

/* Slide Up */
.scroll-animated[data-animation="slide-up"]:not(.is-visible) {
  transform: translateY(100px);
}
</style>
