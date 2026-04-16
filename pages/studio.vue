<template>
  <div class="studio-page">
    <VirtualStudioTour />
    <StudioCTA />
    <StudioHero />
  </div>
</template>

<script setup>
useHead({
  title: 'Virtual Studio Tour - Artilora',
  meta: [
    { 
      name: 'description', 
      content: 'Explore the Artilora studio where aerial root sculptures are created. Take a virtual tour through the workshop, inspiration corner, and creative spaces.' 
    }
  ]
})
</script>

<style scoped>
.studio-page {
  background-color: #001F3F;
  min-height: 100vh;
}
</style>
