<template>
  <div class="scroll-demo bg-black min-h-screen">
    <!-- Hero Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 relative overflow-hidden">
      <!-- Background grid -->
      <div class="absolute inset-0 opacity-10">
        <div class="grid-pattern"></div>
      </div>
      
      <ScrollAnimated animation="fade-up" :duration="1000">
        <h1 class="text-6xl md:text-8xl font-bold text-[#FFD700] mb-6 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 30px rgba(255, 215, 0, 0.6);">
          Smooth Scroll Animations
        </h1>
      </ScrollAnimated>
      
      <ScrollAnimated animation="fade-up" :delay="200" :duration="1000">
        <p class="text-2xl md:text-3xl text-white mb-8 text-center" 
           style="font-family: 'Bradley Hand ITC', cursive;">
          Elements appear gracefully as you scroll
        </p>
      </ScrollAnimated>
      
      <ScrollAnimated animation="zoom-in" :delay="400" :duration="1000">
        <div class="text-lg text-[#FFD700]/80 text-center max-w-2xl mb-12">
          Scroll down to see different animation styles
        </div>
      </ScrollAnimated>
      
      <!-- Scroll indicator -->
      <div class="mt-8 animate-bounce">
        <svg class="w-8 h-8 text-[#FFD700]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 14l-7 7m0 0l-7-7m7 7V3"></path>
        </svg>
      </div>
    </section>

    <!-- Fade Up Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 py-20">
      <ScrollAnimated animation="fade-up">
        <h2 class="text-5xl font-bold text-[#FFD700] mb-8 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
          Fade Up Animation
        </h2>
      </ScrollAnimated>
      
      <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl mt-12">
        <ScrollAnimated animation="fade-up" :delay="0">
          <div class="card">
            <div class="card-inner">
              <div class="w-16 h-16 bg-[#FFD700] rounded-full mx-auto mb-4 flex items-center justify-center">
                <span class="text-3xl">🎨</span>
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-3" style="font-family: 'Bradley Hand ITC', cursive;">
                Art
              </h3>
              <p class="text-white/80">
                Elements slide up smoothly from below
              </p>
            </div>
          </div>
        </ScrollAnimated>
        
        <ScrollAnimated animation="fade-up" :delay="200">
          <div class="card">
            <div class="card-inner">
              <div class="w-16 h-16 bg-[#FFD700] rounded-full mx-auto mb-4 flex items-center justify-center">
                <span class="text-3xl">🌿</span>
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-3" style="font-family: 'Bradley Hand ITC', cursive;">
                Nature
              </h3>
              <p class="text-white/80">
                With a gentle fade-in effect
              </p>
            </div>
          </div>
        </ScrollAnimated>
        
        <ScrollAnimated animation="fade-up" :delay="400">
          <div class="card">
            <div class="card-inner">
              <div class="w-16 h-16 bg-[#FFD700] rounded-full mx-auto mb-4 flex items-center justify-center">
                <span class="text-3xl">✨</span>
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-3" style="font-family: 'Bradley Hand ITC', cursive;">
                Magic
              </h3>
              <p class="text-white/80">
                Creating a professional feel
              </p>
            </div>
          </div>
        </ScrollAnimated>
      </div>
    </section>

    <!-- Zoom In Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 py-20 bg-gradient-to-b from-black via-[#0a0a1a] to-black">
      <ScrollAnimated animation="zoom-in">
        <h2 class="text-5xl font-bold text-[#FFD700] mb-8 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
          Zoom In Animation
        </h2>
      </ScrollAnimated>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-12 max-w-5xl mt-12">
        <ScrollAnimated animation="zoom-in" :delay="0">
          <div class="sculpture-showcase">
            <img src="/101_arty_Comfort.png" alt="Comfort" class="w-full h-80 object-cover rounded-lg mb-4">
            <h3 class="text-3xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
              Arty-101: Comfort
            </h3>
            <p class="text-white/80">
              Images scale up from smaller size
            </p>
          </div>
        </ScrollAnimated>
        
        <ScrollAnimated animation="zoom-in" :delay="300">
          <div class="sculpture-showcase">
            <img src="/102_arty_A_day_That_is-Mine.png" alt="A Day That is Mine" class="w-full h-80 object-cover rounded-lg mb-4">
            <h3 class="text-3xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
              Arty-102: A Day That is Mine
            </h3>
            <p class="text-white/80">
              Perfect for highlighting important content
            </p>
          </div>
        </ScrollAnimated>
      </div>
    </section>

    <!-- Fade Left & Right Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 py-20">
      <ScrollAnimated animation="fade-up">
        <h2 class="text-5xl font-bold text-[#FFD700] mb-8 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
          Directional Animations
        </h2>
      </ScrollAnimated>
      
      <div class="max-w-4xl mt-12 space-y-12">
        <!-- From Left -->
        <ScrollAnimated animation="fade-left">
          <div class="flex items-center gap-6 bg-black/50 border-2 border-[#FFD700] rounded-lg p-6">
            <div class="w-20 h-20 bg-[#FFD700] rounded-full flex items-center justify-center flex-shrink-0">
              <span class="text-4xl">←</span>
            </div>
            <div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                Fade from Left
              </h3>
              <p class="text-white/80">
                Content slides in from the left side
              </p>
            </div>
          </div>
        </ScrollAnimated>
        
        <!-- From Right -->
        <ScrollAnimated animation="fade-right">
          <div class="flex items-center gap-6 bg-black/50 border-2 border-[#FFD700] rounded-lg p-6">
            <div class="w-20 h-20 bg-[#FFD700] rounded-full flex items-center justify-center flex-shrink-0">
              <span class="text-4xl">→</span>
            </div>
            <div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                Fade from Right
              </h3>
              <p class="text-white/80">
                Content slides in from the right side
              </p>
            </div>
          </div>
        </ScrollAnimated>
      </div>
    </section>

    <!-- Staggered Animation Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 py-20 bg-gradient-to-b from-black via-[#1a0a00] to-black">
      <ScrollAnimated animation="fade-up">
        <h2 class="text-5xl font-bold text-[#FFD700] mb-8 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
          Staggered Animations
        </h2>
      </ScrollAnimated>
      
      <ScrollAnimated animation="fade-up" :delay="200">
        <p class="text-xl text-white/80 text-center mb-12 max-w-2xl">
          Multiple elements appear one after another
        </p>
      </ScrollAnimated>
      
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6 max-w-5xl">
        <ScrollAnimated v-for="i in 8" :key="i" animation="zoom-in" :delay="i * 100">
          <div class="aspect-square bg-gradient-to-br from-[#FFD700] to-[#8B6914] rounded-lg flex items-center justify-center
                      transform transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-[#FFD700]/50">
            <span class="text-4xl font-bold text-black">{{ i }}</span>
          </div>
        </ScrollAnimated>
      </div>
    </section>

    <!-- Final CTA Section -->
    <section class="min-h-screen flex flex-col items-center justify-center px-4 py-20">
      <ScrollAnimated animation="zoom-in">
        <div class="text-center max-w-3xl">
          <p class="text-4xl md:text-5xl text-[#FFD700] italic mb-8" 
             style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.4);">
            "Every scroll reveals beauty"
          </p>
          <p class="text-xl text-white/90 mb-12">
            — Smooth animations make your site feel premium
          </p>
          
          <NuxtLink to="/" 
                    class="inline-block px-8 py-4 bg-[#FFD700] text-black font-bold rounded-lg text-xl
                           transform transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-[#FFD700]/50"
                    style="font-family: 'Bradley Hand ITC', cursive;">
            Return to Homepage
          </NuxtLink>
        </div>
      </ScrollAnimated>
    </section>
  </div>
</template>

<script setup>
import ScrollAnimated from '~/components/ScrollAnimated.vue'

useHead({
  title: 'Scroll Animations Demo - Artilora',
  meta: [
    { name: 'description', content: 'Experience smooth scroll animations' }
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

.card {
  background: rgba(0, 0, 0, 0.5);
  border: 2px solid #FFD700;
  border-radius: 1rem;
  padding: 2rem;
  text-align: center;
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.card:hover {
  transform: translateY(-10px);
  box-shadow: 0 20px 40px rgba(255, 215, 0, 0.3);
}

.card-inner {
  position: relative;
  z-index: 1;
}

.sculpture-showcase {
  background: rgba(0, 0, 0, 0.5);
  border: 2px solid #FFD700;
  border-radius: 1rem;
  padding: 1.5rem;
  backdrop-filter: blur(10px);
  transition: all 0.3s ease;
}

.sculpture-showcase:hover {
  transform: scale(1.05);
  box-shadow: 0 20px 40px rgba(255, 215, 0, 0.4);
}

.sculpture-showcase img {
  border: 2px solid #FFD700;
  transition: all 0.3s ease;
}

.sculpture-showcase:hover img {
  box-shadow: 0 0 30px rgba(255, 215, 0, 0.6);
}
</style>
