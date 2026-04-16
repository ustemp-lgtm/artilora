<template>
  <div class="min-h-screen relative">
    <!-- Custom Cursor with Golden Particles -->
    <CustomCursor />
    
    <!-- Custom Cursor with Golden Particles -->
    <CustomCursor />
    
    <!-- Loading Bar for Page Transitions -->
    <LoadingBar />
    
    <!-- Floating Particles Effect - Magical atmosphere -->
    <FloatingParticles 
      :particle-count="30" 
      color="golden" 
      density="medium" 
      speed="slow" 
    />
    
    <ThePreloader />
    <NuxtLayout>
    <!-- Page Transitions -->
      <NuxtPage :transition="{
        name: 'page',
        mode: 'out-in',
        onBeforeEnter: onBeforeEnter,
        onEnter: onEnter,
        onAfterEnter: onAfterEnter
      }" />
    </NuxtLayout>
    
    <!-- AI Art Consultant - Available on all pages -->
    <AIArtConsultant />

    <!-- Client Testimonials & Comments -->
    <ClientTestimonials />
  </div>
</template>

<script setup>
const route = useRoute()

// Force cache clear on mount
onMounted(() => {
  if (process.client) {
    // Check if this is a cached version
    const buildTime = '2026-02-15-20:00:00' // FORCE CACHE CLEAR - Global background color fix
    const lastBuildTime = localStorage.getItem('artilora_build_time')
    
    if (lastBuildTime !== buildTime) {
      console.log('New build detected, clearing cache...')
      localStorage.setItem('artilora_build_time', buildTime)
      
      // Clear service worker cache if exists
      if ('serviceWorker' in navigator) {
        navigator.serviceWorker.getRegistrations().then(registrations => {
          registrations.forEach(registration => registration.unregister())
        })
      }
      
      // Clear all caches
      if ('caches' in window) {
        caches.keys().then(names => {
          names.forEach(name => caches.delete(name))
        })
      }
      
      // Force reload after cache clear
      setTimeout(() => {
        window.location.reload(true)
      }, 100)
    }
  }
})

// Page transition hooks
const onBeforeEnter = (el) => {
  el.style.opacity = 0
  el.style.transform = 'translateY(20px)'
}

const onEnter = (el, done) => {
  el.offsetHeight // Trigger reflow
  el.style.transition = 'opacity 0.5s ease-out, transform 0.5s ease-out'
  el.style.opacity = 1
  el.style.transform = 'translateY(0)'
  setTimeout(done, 500)
}

const onAfterEnter = (el) => {
  el.style.transition = ''
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap');

/* Force dark navy background everywhere to prevent white flashes */
html, body {
  background-color: #001F3F !important;
  margin: 0 !important;
  padding: 0 !important;
  overflow-x: hidden;
}

/* Remove any top spacing */
body > div {
  margin-top: 0 !important;
  padding-top: 0 !important;
}

/* Global Smooth Scroll */
html {
  scroll-behavior: smooth;
}

/* Smooth scrolling for all elements */
* {
  scroll-behavior: smooth;
}

/* ========== HIDE GRID PATTERN OVER IMAGES ========== */
/* Create stacking context for image containers to block grid */
.sculpture-item,
.sculpture-frame,
img[src*="arty_podium"],
img[src*="Comfort"],
img[src*="A_Day_That_is_Mine"],
img[src*="The_Darkness_of_Depth"] {
  position: relative;
  z-index: 10;
  isolation: isolate;
}

/* Add solid background to image containers */
.sculpture-item::before,
.aspect-\[4\/5\]::before {
  content: '';
  position: absolute;
  inset: 0;
  background-color: #001F3F;
  z-index: -1;
}

/* ========== PAGE TRANSITIONS ========== */
/* Fade and slide up transition */
.page-enter-active,
.page-leave-active {
  transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.page-enter-from {
  opacity: 0;
  transform: translateY(20px);
}

.page-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

/* Ensure smooth transition container */
.page-enter-active {
  transition-delay: 0.1s;
}

/* Prevent layout shift during transitions */
.layout-enter-active,
.layout-leave-active {
  transition: opacity 0.3s ease;
}

.layout-enter-from,
.layout-leave-to {
  opacity: 0;
}
</style>
