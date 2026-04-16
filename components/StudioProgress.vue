<template>
  <div class="studio-progress">
    <div class="progress-label">
      Tour Progress: {{ visitedCount }} / {{ totalCount }} zones explored
    </div>
    <div class="progress-bar-container">
      <div 
        class="progress-bar-fill"
        :style="{ width: progress + '%' }"
      ></div>
    </div>
  </div>
</template>

<script setup>
defineProps({
  progress: {
    type: Number,
    default: 0
  },
  visitedCount: {
    type: Number,
    default: 0
  },
  totalCount: {
    type: Number,
    default: 0
  }
})
</script>

<style scoped>
.studio-progress {
  position: fixed;
  top: 100px;
  right: 20px;
  background: rgba(0, 0, 0, 0.95);
  border: 2px solid #FFD700;
  border-radius: 12px;
  padding: 16px;
  min-width: 200px;
  z-index: 100;
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.4);
}

.progress-label {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFD700;
  margin-bottom: 8px;
  text-align: center;
}

.progress-bar-container {
  width: 100%;
  height: 8px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
  overflow: hidden;
}

.progress-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, #FFD700, #FFA500);
  border-radius: 4px;
  transition: width 0.5s ease;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
}

@media (max-width: 768px) {
  .studio-progress {
    top: 80px;
    right: 10px;
    min-width: 160px;
    padding: 12px;
  }
  
  .progress-label {
    font-size: 12px;
  }
}
</style>
