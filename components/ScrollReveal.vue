<template>
  <div 
    ref="element"
    :class="[
      'scroll-reveal',
      isVisible ? 'is-visible' : '',
      animationType
    ]"
  >
    <slot />
  </div>
</template>

<script setup>
const props = defineProps({
  animationType: {
    type: String,
    default: 'fade-up', // Options: fade-up, fade-down, fade-left, fade-right, zoom-in, flip
    validator: (value) => ['fade-up', 'fade-down', 'fade-left', 'fade-right', 'zoom-in', 'flip', 'slide-left', 'slide-right'].includes(value)
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

onMounted(() => {
  if (process.client) {
    const observer = new IntersectionObserver(
      (entries) => {
        entries.forEach((entry) => {
          if (entry.isIntersecting && !isVisible.value) {
            setTimeout(() => {
              isVisible.value = true
            }, props.delay)
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

    onUnmounted(() => {
      if (element.value) {
        observer.unobserve(element.value)
      }
    })
  }
})
</script>

<style scoped>
.scroll-reveal {
  opacity: 0;
  transition-property: opacity, transform;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
}

.scroll-reveal.is-visible {
  opacity: 1;
}

/* Fade Up */
.fade-up {
  transform: translateY(50px);
  transition-duration: 800ms;
}

.fade-up.is-visible {
  transform: translateY(0);
}

/* Fade Down */
.fade-down {
  transform: translateY(-50px);
  transition-duration: 800ms;
}

.fade-down.is-visible {
  transform: translateY(0);
}

/* Fade Left */
.fade-left {
  transform: translateX(50px);
  transition-duration: 800ms;
}

.fade-left.is-visible {
  transform: translateX(0);
}

/* Fade Right */
.fade-right {
  transform: translateX(-50px);
  transition-duration: 800ms;
}

.fade-right.is-visible {
  transform: translateX(0);
}

/* Slide Left */
.slide-left {
  transform: translateX(100px);
  transition-duration: 1000ms;
}

.slide-left.is-visible {
  transform: translateX(0);
}

/* Slide Right */
.slide-right {
  transform: translateX(-100px);
  transition-duration: 1000ms;
}

.slide-right.is-visible {
  transform: translateX(0);
}

/* Zoom In */
.zoom-in {
  transform: scale(0.8);
  transition-duration: 800ms;
}

.zoom-in.is-visible {
  transform: scale(1);
}

/* Flip */
.flip {
  transform: perspective(1000px) rotateY(90deg);
  transition-duration: 1000ms;
}

.flip.is-visible {
  transform: perspective(1000px) rotateY(0deg);
}
</style>
