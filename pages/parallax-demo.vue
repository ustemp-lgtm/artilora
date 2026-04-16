<template>
  <div class="parallax-demo">
    <!-- Hero Section with Parallax -->
    <ParallaxSection class="hero-parallax">
      <template #background>
        <div class="absolute inset-0 bg-gradient-to-b from-black via-[#1a0a00] to-black"></div>
        <div class="absolute inset-0 opacity-20">
          <div class="grid-pattern"></div>
        </div>
      </template>
      
      <template #midground>
        <div class="absolute inset-0 flex items-center justify-center">
          <div class="golden-glow"></div>
        </div>
      </template>
      
      <template #foreground>
        <div class="relative z-10 flex flex-col items-center justify-center min-h-screen text-center px-4">
          <h1 class="text-6xl md:text-8xl font-bold text-[#FFD700] mb-6" 
              style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 30px rgba(255, 215, 0, 0.6);">
            ARTILORA
          </h1>
          <p class="text-2xl md:text-3xl text-white mb-4" 
             style="font-family: 'Bradley Hand ITC', cursive;">
            Born of Nature, Shaped by Art
          </p>
          <p class="text-lg text-[#FFD700]/80 max-w-2xl">
            Scroll down to experience the parallax effect
          </p>
          
          <!-- Scroll indicator -->
          <div class="mt-12 animate-bounce">
            <svg class="w-8 h-8 text-[#FFD700]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
            </svg>
          </div>
        </div>
      </template>
    </ParallaxSection>

    <!-- Sculpture Section with Parallax -->
    <ParallaxSection class="sculpture-parallax">
      <template #background>
        <div class="absolute inset-0 bg-gradient-to-b from-black via-[#0a0a1a] to-black"></div>
      </template>
      
      <template #midground>
        <div class="absolute inset-0 flex items-center justify-center opacity-30">
          <img src="/artilora_logo_transparent.png" alt="" class="w-96 h-96 object-contain blur-sm">
        </div>
      </template>
      
      <template #foreground>
        <div class="relative z-10 flex flex-col items-center justify-center min-h-screen px-4 py-20">
          <h2 class="text-5xl md:text-6xl font-bold text-[#FFD700] mb-12 text-center" 
              style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
            Featured Sculptures
          </h2>
          
          <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl">
            <!-- Sculpture 1 -->
            <div class="sculpture-card group">
              <div class="relative overflow-hidden rounded-lg border-2 border-[#FFD700] p-4 bg-black/50 backdrop-blur-sm
                          transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
                <img src="/101_arty_Comfort.png" alt="Comfort" class="w-full h-64 object-cover rounded-lg mb-4">
                <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                  Arty-101: Comfort
                </h3>
                <p class="text-white/80 text-sm">
                  Two forms meet where words fall silent...
                </p>
              </div>
            </div>
            
            <!-- Sculpture 2 -->
            <div class="sculpture-card group">
              <div class="relative overflow-hidden rounded-lg border-2 border-[#FFD700] p-4 bg-black/50 backdrop-blur-sm
                          transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
                <img src="/102_arty_A_day_That_is-Mine.png" alt="A Day That is Mine" class="w-full h-64 object-cover rounded-lg mb-4">
                <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                  Arty-102: A Day That is Mine
                </h3>
                <p class="text-white/80 text-sm">
                  The rare, sacred day when a person walks in agreement...
                </p>
              </div>
            </div>
            
            <!-- Sculpture 3 -->
            <div class="sculpture-card group">
              <div class="relative overflow-hidden rounded-lg border-2 border-[#FFD700] p-4 bg-black/50 backdrop-blur-sm
                          transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
                <img src="/103_arty_The_Darkness_of_Depth.png" alt="The Darkness of Depth" class="w-full h-64 object-cover rounded-lg mb-4">
                <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                  Arty-103: The Darkness of Depth
                </h3>
                <p class="text-white/80 text-sm">
                  Darkness is not an enemy, but a sacred chamber...
                </p>
              </div>
            </div>
          </div>
        </div>
      </template>
    </ParallaxSection>

    <!-- Philosophy Section with Parallax -->
    <ParallaxSection class="philosophy-parallax">
      <template #background>
        <div class="absolute inset-0 bg-gradient-to-b from-black via-[#1a0a0a] to-black"></div>
        <div class="absolute inset-0 opacity-10">
          <div class="grid-pattern"></div>
        </div>
      </template>
      
      <template #midground>
        <div class="absolute inset-0 flex items-center justify-center">
          <div class="w-full h-full bg-gradient-radial from-[#FFD700]/10 via-transparent to-transparent"></div>
        </div>
      </template>
      
      <template #foreground>
        <div class="relative z-10 flex flex-col items-center justify-center min-h-screen px-4 py-20">
          <div class="max-w-4xl text-center">
            <p class="text-4xl md:text-5xl text-[#FFD700] italic mb-8" 
               style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.4);">
              "Nature begins the creation; the artist completes it."
            </p>
            <p class="text-xl text-white/90 mb-12">
              — The Artilora Philosophy
            </p>
            
            <NuxtLink to="/" 
                      class="inline-block px-8 py-4 bg-[#FFD700] text-black font-bold rounded-lg
                             transform transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-[#FFD700]/50"
                      style="font-family: 'Bradley Hand ITC', cursive;">
              Return to Homepage
            </NuxtLink>
          </div>
        </div>
      </template>
    </ParallaxSection>
  </div>
</template>

<script setup>
import ParallaxSection from '~/components/ParallaxSection.vue'

useHead({
  title: 'Parallax Demo - Artilora',
  meta: [
    { name: 'description', content: 'Experience the parallax scrolling effect' }
  ]
})
</script>

<style scoped>
.grid-pattern {
  background-image: 
    linear-gradient(rgba(255, 215, 0, 0.1) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 215, 0, 0.1) 1px, transparent 1px);
  background-size: 30px 30px;
  width: 100%;
  height: 100%;
}

.golden-glow {
  width: 600px;
  height: 600px;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.3) 0%, transparent 70%);
  filter: blur(60px);
  animation: pulse 4s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
    opacity: 0.3;
  }
  50% {
    transform: scale(1.2);
    opacity: 0.5;
  }
}

.sculpture-card {
  animation: fadeInUp 0.8s ease-out forwards;
  opacity: 0;
}

.sculpture-card:nth-child(1) {
  animation-delay: 0.2s;
}

.sculpture-card:nth-child(2) {
  animation-delay: 0.4s;
}

.sculpture-card:nth-child(3) {
  animation-delay: 0.6s;
}

@keyframes fadeInUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>
