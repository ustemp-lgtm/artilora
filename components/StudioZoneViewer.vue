<template>
  <div class="zone-viewer">
    <StudioImage 
      :src="zone.image" 
      alt=""
      :hotspots="zone.hotspots"
      @hotspot-click="$emit('hotspot-click', $event)"
    />
    

  </div>
</template>

<script setup>
defineProps({
  zone: {
    type: Object,
    required: true
  }
})

defineEmits(['hotspot-click'])
</script>

<style scoped>
.zone-viewer {
  width: 100%;
  max-width: 1400px;
  margin: 0 auto;
  padding: 40px 20px;
  animation: fadeIn 0.5s ease-in-out;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

@media (max-width: 768px) {
  .zone-viewer {
    padding: 20px 16px;
  }
}
</style>
