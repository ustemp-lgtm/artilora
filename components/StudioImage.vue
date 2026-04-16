<template>
  <div class="studio-image-container">
    <img 
      :src="src" 
      :alt="alt"
      class="studio-image"
      @load="onImageLoad"
      @error="onImageError"
    />
    
    <StudioHotspot
      v-for="hotspot in hotspots"
      v-show="imageLoaded"
      :key="hotspot.id"
      :hotspot="hotspot"
      :style="getHotspotStyle(hotspot)"
      @click="$emit('hotspot-click', hotspot)"
    />
  </div>
</template>

<script setup>
const props = defineProps({
  src: {
    type: String,
    required: true
  },
  alt: {
    type: String,
    required: true
  },
  hotspots: {
    type: Array,
    default: () => []
  }
})

const emit = defineEmits(['hotspot-click'])

const imageLoaded = ref(false)

const getHotspotStyle = (hotspot) => {
  return {
    left: `${hotspot.x}%`,
    top: `${hotspot.y}%`,
    transform: 'translate(-50%, -50%)'
  }
}

const onImageLoad = () => {
  imageLoaded.value = true
}

const onImageError = () => {
  console.warn('Failed to load studio image:', props.src)
}
</script>

<style scoped>
.studio-image-container {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.studio-image {
  max-width: 100%;
  max-height: 70vh;
  width: auto;
  height: auto;
  object-fit: contain;
  border-radius: 12px;
  box-shadow: 0 0 40px rgba(255, 215, 0, 0.3);
}

@media (max-width: 768px) {
  .studio-image {
    max-height: 50vh;
  }
}
</style>
