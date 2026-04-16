<template>
  <Transition name="modal-fade">
    <div 
      v-if="isOpen" 
      class="info-panel-overlay"
      @click="$emit('close')"
    >
      <div class="info-panel" @click.stop>
        <button class="close-btn" @click="$emit('close')">
          <svg width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
            <line x1="18" y1="6" x2="6" y2="18"></line>
            <line x1="6" y1="6" x2="18" y2="18"></line>
          </svg>
        </button>
        
        <img 
          v-if="hotspot?.image"
          :src="hotspot.image"
          :alt="hotspot.title"
          class="hotspot-image"
        />
        
        <div class="hotspot-info">
          <h3 class="hotspot-title">{{ hotspot?.title }}</h3>
          <p class="hotspot-category">{{ hotspot?.category }}</p>
          <p class="hotspot-description">{{ hotspot?.description }}</p>
        </div>
      </div>
    </div>
  </Transition>
</template>

<script setup>
defineProps({
  hotspot: {
    type: Object,
    default: null
  },
  isOpen: {
    type: Boolean,
    default: false
  }
})

defineEmits(['close'])
</script>

<style scoped>
.info-panel-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.9);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 20px;
}

.info-panel {
  background-color: #000000;
  background-image: 
    linear-gradient(rgba(255, 215, 0, 0.05) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 215, 0, 0.05) 1px, transparent 1px);
  background-size: 30px 30px;
  border: 2px solid #FFD700;
  border-radius: 16px;
  max-width: 600px;
  width: 100%;
  max-height: 80vh;
  overflow-y: auto;
  padding: 32px;
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.2);
  position: relative;
}

.close-btn {
  position: absolute;
  top: 16px;
  right: 16px;
  background: none;
  border: none;
  color: #FFD700;
  cursor: pointer;
  font-size: 24px;
  transition: transform 0.3s ease;
  padding: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.close-btn:hover {
  transform: scale(1.2);
}

.hotspot-image {
  width: 100%;
  height: auto;
  border-radius: 12px;
  margin-bottom: 24px;
}

.hotspot-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 32px;
  color: #FFD700;
  margin-bottom: 8px;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

.hotspot-category {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FF7F50;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 16px;
}

.hotspot-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  color: #FFFFFF;
  line-height: 1.7;
}

.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.3s ease;
}

.modal-fade-enter-from,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-fade-enter-active .info-panel {
  animation: modalSlideUp 0.3s ease-out;
}

@keyframes modalSlideUp {
  from {
    transform: translateY(50px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}

@media (max-width: 768px) {
  .info-panel {
    padding: 24px;
    max-height: 90vh;
  }
  
  .hotspot-title {
    font-size: 24px;
  }
  
  .hotspot-description {
    font-size: 15px;
  }
}
</style>
