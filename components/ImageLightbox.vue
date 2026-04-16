<template>
  <Transition name="lightbox-fade">
    <div v-if="isOpen" class="lightbox-overlay" @click="close">
      <!-- Close button -->
      <button @click="close" class="lightbox-close" aria-label="Close">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <line x1="18" y1="6" x2="6" y2="18"></line>
          <line x1="6" y1="6" x2="18" y2="18"></line>
        </svg>
      </button>

      <!-- Previous button -->
      <button v-if="images.length > 1" @click.stop="previous" class="lightbox-nav lightbox-prev" aria-label="Previous">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="15 18 9 12 15 6"></polyline>
        </svg>
      </button>

      <!-- Next button -->
      <button v-if="images.length > 1" @click.stop="next" class="lightbox-nav lightbox-next" aria-label="Next">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
          <polyline points="9 18 15 12 9 6"></polyline>
        </svg>
      </button>

      <!-- Image container -->
      <div class="lightbox-content" @click.stop>
        <img 
          :src="currentImage.src" 
          :alt="currentImage.alt"
          class="lightbox-image"
          :class="{ 'zoomed': isZoomed }"
          @click="toggleZoom"
        />
        
        <!-- Image info -->
        <div class="lightbox-info">
          <h3 class="lightbox-title">{{ currentImage.title }}</h3>
          <p v-if="currentImage.description" class="lightbox-description">{{ currentImage.description }}</p>
          <p class="lightbox-counter">{{ currentIndex + 1 }} / {{ images.length }}</p>
        </div>

        <!-- Zoom hint -->
        <div v-if="!isZoomed" class="zoom-hint">
          Click image to zoom
        </div>
      </div>
    </div>
  </Transition>
</template>

<script setup>
const props = defineProps({
  images: {
    type: Array,
    required: true,
    // Expected format: [{ src: '/path/to/image.jpg', alt: 'Alt text', title: 'Title', description: 'Description' }]
  },
  initialIndex: {
    type: Number,
    default: 0
  }
})

const emit = defineEmits(['close'])

const isOpen = ref(false)
const currentIndex = ref(0)
const isZoomed = ref(false)

const currentImage = computed(() => props.images[currentIndex.value] || {})

const open = (index = 0) => {
  currentIndex.value = index
  isOpen.value = true
  isZoomed.value = false
  document.body.style.overflow = 'hidden'
}

const close = () => {
  isOpen.value = false
  isZoomed.value = false
  document.body.style.overflow = ''
  emit('close')
}

const next = () => {
  currentIndex.value = (currentIndex.value + 1) % props.images.length
  isZoomed.value = false
}

const previous = () => {
  currentIndex.value = (currentIndex.value - 1 + props.images.length) % props.images.length
  isZoomed.value = false
}

const toggleZoom = () => {
  isZoomed.value = !isZoomed.value
}

// Keyboard navigation
const handleKeydown = (e) => {
  if (!isOpen.value) return
  
  if (e.key === 'Escape') close()
  if (e.key === 'ArrowRight') next()
  if (e.key === 'ArrowLeft') previous()
}

onMounted(() => {
  window.addEventListener('keydown', handleKeydown)
})

onUnmounted(() => {
  window.removeEventListener('keydown', handleKeydown)
  document.body.style.overflow = ''
})

// Expose methods to parent
defineExpose({
  open,
  close
})
</script>

<style scoped>
.lightbox-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(0, 0, 0, 0.95);
  z-index: 9999;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 20px;
}

.lightbox-close {
  position: absolute;
  top: 20px;
  right: 20px;
  background: rgba(139, 0, 0, 0.8);
  border: 2px solid #FFD700;
  color: #FFD700;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
  z-index: 10001;
}

.lightbox-close:hover {
  background: rgba(139, 0, 0, 1);
  transform: rotate(90deg);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
}

.lightbox-nav {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  background: rgba(139, 0, 0, 0.8);
  border: 2px solid #FFD700;
  color: #FFD700;
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  transition: all 0.3s ease;
  z-index: 10001;
}

.lightbox-nav:hover {
  background: rgba(139, 0, 0, 1);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.5);
  transform: translateY(-50%) scale(1.1);
}

.lightbox-prev {
  left: 20px;
}

.lightbox-next {
  right: 20px;
}

.lightbox-content {
  max-width: 90vw;
  max-height: 90vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  position: relative;
}

.lightbox-image {
  max-width: 100%;
  max-height: 70vh;
  object-fit: contain;
  border: 3px solid #FFD700;
  border-radius: 8px;
  box-shadow: 0 0 40px rgba(255, 215, 0, 0.3);
  cursor: zoom-in;
  transition: all 0.3s ease;
}

.lightbox-image.zoomed {
  max-width: none;
  max-height: none;
  width: auto;
  height: auto;
  cursor: zoom-out;
  transform: scale(1.5);
}

.lightbox-info {
  margin-top: 20px;
  text-align: center;
  color: #FFFFFF;
  font-family: 'Bradley Hand ITC', cursive;
}

.lightbox-title {
  font-size: 24px;
  font-weight: bold;
  color: #FFD700;
  margin-bottom: 8px;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

.lightbox-description {
  font-size: 16px;
  color: #FFFFFF;
  margin-bottom: 8px;
  max-width: 600px;
}

.lightbox-counter {
  font-size: 14px;
  color: #FFD700;
  opacity: 0.8;
}

.zoom-hint {
  position: absolute;
  bottom: -40px;
  left: 50%;
  transform: translateX(-50%);
  color: #FFD700;
  font-size: 14px;
  font-family: 'Bradley Hand ITC', cursive;
  opacity: 0.7;
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 0.7; }
  50% { opacity: 1; }
}

/* Transitions */
.lightbox-fade-enter-active,
.lightbox-fade-leave-active {
  transition: opacity 0.3s ease;
}

.lightbox-fade-enter-from,
.lightbox-fade-leave-to {
  opacity: 0;
}

/* Mobile responsive */
@media (max-width: 768px) {
  .lightbox-close,
  .lightbox-nav {
    width: 40px;
    height: 40px;
  }

  .lightbox-close {
    top: 10px;
    right: 10px;
  }

  .lightbox-prev {
    left: 10px;
  }

  .lightbox-next {
    right: 10px;
  }

  .lightbox-image {
    max-height: 60vh;
  }

  .lightbox-title {
    font-size: 20px;
  }

  .lightbox-description {
    font-size: 14px;
  }
}
</style>
