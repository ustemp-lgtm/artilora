<template>
  <div v-if="isLoading" class="loading-bar-container">
    <div class="loading-bar" :style="{ width: progress + '%' }"></div>
  </div>
</template>

<script setup>
const isLoading = ref(false)
const progress = ref(0)
let progressInterval = null

const startLoading = () => {
  isLoading.value = true
  progress.value = 0
  
  // Simulate loading progress
  progressInterval = setInterval(() => {
    if (progress.value < 90) {
      progress.value += Math.random() * 10
    }
  }, 200)
}

const finishLoading = () => {
  progress.value = 100
  
  setTimeout(() => {
    isLoading.value = false
    progress.value = 0
    if (progressInterval) {
      clearInterval(progressInterval)
    }
  }, 300)
}

// Listen to route changes
if (process.client) {
  const router = useRouter()
  
  router.beforeEach((to, from, next) => {
    startLoading()
    next()
  })
  
  router.afterEach(() => {
    finishLoading()
  })
}

onUnmounted(() => {
  if (progressInterval) {
    clearInterval(progressInterval)
  }
})
</script>

<style scoped>
.loading-bar-container {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 3px;
  z-index: 9999;
  background: transparent;
}

.loading-bar {
  height: 100%;
  background: linear-gradient(90deg, #FFD700, #FFA500, #FFD700);
  background-size: 200% 100%;
  animation: shimmer 1.5s infinite;
  transition: width 0.3s ease;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

@keyframes shimmer {
  0% {
    background-position: -200% 0;
  }
  100% {
    background-position: 200% 0;
  }
}
</style>
