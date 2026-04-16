<template>
  <div class="virtual-studio-tour">
    <StudioZoneViewer
      v-if="currentZone"
      :zone="currentZone"
      @hotspot-click="openHotspot"
    />
    
    <StudioNavigation
      :zones="zones"
      :current-index="currentZoneIndex"
      :current-zone="currentZone"
      @navigate="navigateToZone"
    />
    
    <StudioInfoPanel
      :hotspot="selectedHotspot"
      :is-open="isInfoPanelOpen"
      @close="closeInfoPanel"
    />
  </div>
</template>

<script setup>
const zones = ref([])
const currentZoneIndex = ref(0)
const selectedHotspot = ref(null)
const isInfoPanelOpen = ref(false)
const visitedZones = ref(new Set([0]))

const tourProgress = computed(() => 
  zones.value.length > 0 ? (visitedZones.value.size / zones.value.length) * 100 : 0
)

const currentZone = computed(() => zones.value[currentZoneIndex.value])

const loadZones = async () => {
  try {
    const response = await fetch('/data/studio-zones.json')
    const data = await response.json()
    zones.value = data.zones
  } catch (error) {
    console.error('Failed to load studio zones:', error)
  }
}

const navigateToZone = (index) => {
  if (index >= 0 && index < zones.value.length) {
    currentZoneIndex.value = index
    visitedZones.value.add(index)
  }
}

const openHotspot = (hotspot) => {
  selectedHotspot.value = hotspot
  isInfoPanelOpen.value = true
}

const closeInfoPanel = () => {
  isInfoPanelOpen.value = false
  selectedHotspot.value = null
}

const handleKeyPress = (e) => {
  if (isInfoPanelOpen.value) {
    if (e.key === 'Escape') closeInfoPanel()
    return
  }
  
  if (e.key === 'ArrowLeft') navigateToZone(currentZoneIndex.value - 1)
  if (e.key === 'ArrowRight') navigateToZone(currentZoneIndex.value + 1)
}

onMounted(() => {
  if (process.client) {
    loadZones()
    document.addEventListener('keydown', handleKeyPress)
  }
})

onUnmounted(() => {
  if (process.client) {
    document.removeEventListener('keydown', handleKeyPress)
  }
})
</script>

<style scoped>
.virtual-studio-tour {
  min-height: 100vh;
  background-color: #001F3F;
}
</style>
