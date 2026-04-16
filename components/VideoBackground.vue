<template>
  <div class="video-background-section">
    <!-- Video Background -->
    <div class="video-container">
      <video
        v-if="videoSrc"
        ref="videoElement"
        :src="videoSrc"
        autoplay
        loop
        muted
        playsinline
        class="background-video"
        @loadeddata="onVideoLoaded"
      ></video>
      
      <!-- Fallback: Animated gradient if no video -->
      <div v-else class="fallback-background"></div>
      
      <!-- Overlay for better text readability -->
      <div class="video-overlay" :style="{ opacity: overlayOpacity }"></div>
    </div>

    <!-- Content over video -->
    <div class="content-wrapper">
      <slot></slot>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const props = defineProps({
  videoSrc: {
    type: String,
    default: '' // Path to video file, e.g., '/videos/studio-tour.mp4'
  },
  overlayOpacity: {
    type: Number,
    default: 0.5 // 0 to 1, controls darkness of overlay
  },
  autoplay: {
    type: Boolean,
    default: true
  }
})

const videoElement = ref(null)
const isVideoLoaded = ref(false)

const onVideoLoaded = () => {
  isVideoLoaded.value = true
}

onMounted(() => {
  // Ensure video plays on mobile devices
  if (videoElement.value && props.autoplay) {
    videoElement.value.play().catch(err => {
      console.log('Video autoplay prevented:', err)
    })
  }
})

onUnmounted(() => {
  if (videoElement.value) {
    videoElement.value.pause()
  }
})
</script>

<style scoped>
.video-background-section {
  position: relative;
  width: 100%;
  min-height: 100vh;
  overflow: hidden;
}

.video-container {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 0;
}

.background-video {
  position: absolute;
  top: 50%;
  left: 50%;
  min-width: 100%;
  min-height: 100%;
  width: auto;
  height: auto;
  transform: translate(-50%, -50%);
  object-fit: cover;
}

.fallback-background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    135deg,
    #000000 0%,
    #1a0a00 25%,
    #0a0a1a 50%,
    #1a0a00 75%,
    #000000 100%
  );
  background-size: 400% 400%;
  animation: gradientShift 15s ease infinite;
}

@keyframes gradientShift {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.video-overlay {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: linear-gradient(
    to bottom,
    rgba(0, 0, 0, 0.7) 0%,
    rgba(0, 0, 0, 0.4) 50%,
    rgba(0, 0, 0, 0.7) 100%
  );
  z-index: 1;
}

.content-wrapper {
  position: relative;
  z-index: 2;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 2rem;
}

/* Mobile optimization */
@media (max-width: 768px) {
  .background-video {
    /* On mobile, prioritize width over height */
    width: 100%;
    height: auto;
    min-height: 100%;
  }
}
</style>
