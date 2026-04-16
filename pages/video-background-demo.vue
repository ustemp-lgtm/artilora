<template>
  <div class="video-demo">
    <!-- Hero Section with Video Background -->
    <VideoBackground :overlayOpacity="0.6">
      <div class="text-center max-w-4xl">
        <h1 class="text-6xl md:text-8xl font-bold text-[#FFD700] mb-6 animate-fade-in" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 40px rgba(255, 215, 0, 0.8);">
          ARTILORA
        </h1>
        <p class="text-3xl md:text-4xl text-white mb-8 animate-fade-in-delay-1" 
           style="font-family: 'Bradley Hand ITC', cursive;">
          Born of Nature, Shaped by Art
        </p>
        <p class="text-xl text-[#FFD700]/90 mb-12 animate-fade-in-delay-2">
          Experience the beauty of video backgrounds
        </p>
        <button class="px-10 py-4 bg-[#FFD700] text-black font-bold rounded-lg text-xl
                       transform transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-[#FFD700]/50
                       animate-fade-in-delay-3"
                style="font-family: 'Bradley Hand ITC', cursive;">
          Explore Gallery
        </button>
      </div>
    </VideoBackground>

    <!-- About Section with Video Background -->
    <VideoBackground :overlayOpacity="0.7">
      <div class="max-w-5xl">
        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div class="text-left">
            <h2 class="text-5xl font-bold text-[#FFD700] mb-6" 
                style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 20px rgba(255, 215, 0, 0.6);">
              The Artist's Vision
            </h2>
            <p class="text-xl text-white/90 mb-6 leading-relaxed">
              Artilora is a fusion of Art and Flora — symbolizing the union of creativity and nature. 
              Every piece reflects the belief that true art already exists within natural forms, waiting to be discovered.
            </p>
            <p class="text-lg text-[#FFD700]/80 italic">
              "Nature begins the creation; the artist completes it."
            </p>
          </div>
          
          <div class="relative">
            <div class="aspect-square rounded-lg overflow-hidden border-4 border-[#FFD700] 
                        shadow-2xl shadow-[#FFD700]/30 transform hover:scale-105 transition-all duration-500">
              <img src="/artilora_logo_transparent.png" alt="Artilora" class="w-full h-full object-cover">
            </div>
          </div>
        </div>
      </div>
    </VideoBackground>

    <!-- Sculptures Section with Video Background -->
    <VideoBackground :overlayOpacity="0.5">
      <div class="max-w-6xl w-full">
        <h2 class="text-5xl md:text-6xl font-bold text-[#FFD700] mb-16 text-center" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 30px rgba(255, 215, 0, 0.6);">
          Featured Sculptures
        </h2>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
          <!-- Sculpture 1 -->
          <div class="sculpture-card group">
            <div class="relative overflow-hidden rounded-xl border-3 border-[#FFD700] bg-black/60 backdrop-blur-md p-6
                        transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
              <div class="aspect-[3/4] mb-4 overflow-hidden rounded-lg">
                <img src="/101_arty_Comfort.png" alt="Comfort" 
                     class="w-full h-full object-cover transform transition-transform duration-700 group-hover:scale-110">
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty-101: Comfort
              </h3>
              <p class="text-white/80 text-sm">
                Two forms meet where words fall silent. One bends under grief; the other becomes shelter.
              </p>
            </div>
          </div>
          
          <!-- Sculpture 2 -->
          <div class="sculpture-card group">
            <div class="relative overflow-hidden rounded-xl border-3 border-[#FFD700] bg-black/60 backdrop-blur-md p-6
                        transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
              <div class="aspect-[3/4] mb-4 overflow-hidden rounded-lg">
                <img src="/102_arty_A_day_That_is-Mine.png" alt="A Day That is Mine" 
                     class="w-full h-full object-cover transform transition-transform duration-700 group-hover:scale-110">
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty-102: A Day That is Mine
              </h3>
              <p class="text-white/80 text-sm">
                The rare, sacred day when a person walks in agreement with themselves.
              </p>
            </div>
          </div>
          
          <!-- Sculpture 3 -->
          <div class="sculpture-card group">
            <div class="relative overflow-hidden rounded-xl border-3 border-[#FFD700] bg-black/60 backdrop-blur-md p-6
                        transform transition-all duration-500 hover:scale-105 hover:shadow-2xl hover:shadow-[#FFD700]/50">
              <div class="aspect-[3/4] mb-4 overflow-hidden rounded-lg">
                <img src="/103_arty_The_Darkness_of_Depth.png" alt="The Darkness of Depth" 
                     class="w-full h-full object-cover transform transition-transform duration-700 group-hover:scale-110">
              </div>
              <h3 class="text-2xl text-[#FFD700] font-bold mb-2" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty-103: The Darkness of Depth
              </h3>
              <p class="text-white/80 text-sm">
                Darkness is not an enemy, but a sacred chamber where the soul sits still.
              </p>
            </div>
          </div>
        </div>
      </div>
    </VideoBackground>

    <!-- Call to Action with Video Background -->
    <VideoBackground :overlayOpacity="0.8">
      <div class="text-center max-w-3xl">
        <h2 class="text-5xl md:text-6xl font-bold text-[#FFD700] mb-8" 
            style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 30px rgba(255, 215, 0, 0.6);">
          Ready to Add Your Videos?
        </h2>
        <p class="text-xl text-white/90 mb-8 leading-relaxed">
          This component works with any video format (MP4, WebM). Simply place your studio tour or nature videos 
          in the <code class="text-[#FFD700] bg-black/50 px-2 py-1 rounded">/public/videos/</code> folder 
          and update the <code class="text-[#FFD700] bg-black/50 px-2 py-1 rounded">videoSrc</code> prop.
        </p>
        
        <div class="bg-black/60 backdrop-blur-md border-2 border-[#FFD700] rounded-lg p-8 mb-8 text-left">
          <h3 class="text-2xl text-[#FFD700] font-bold mb-4" style="font-family: 'Bradley Hand ITC', cursive;">
            How to Use:
          </h3>
          <ol class="text-white/90 space-y-3 list-decimal list-inside">
            <li>Record a short video (10-30 seconds) of your studio or nature scenes</li>
            <li>Convert to MP4 format (recommended for best compatibility)</li>
            <li>Place video in <code class="text-[#FFD700]">/public/videos/</code> folder</li>
            <li>Update component: <code class="text-[#FFD700]">videoSrc="/videos/your-video.mp4"</code></li>
            <li>Adjust overlay opacity (0-1) for text readability</li>
          </ol>
        </div>
        
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <NuxtLink to="/" 
                    class="px-8 py-4 bg-[#FFD700] text-black font-bold rounded-lg text-xl
                           transform transition-all duration-300 hover:scale-110 hover:shadow-2xl hover:shadow-[#FFD700]/50"
                    style="font-family: 'Bradley Hand ITC', cursive;">
            Return Home
          </NuxtLink>
          <button class="px-8 py-4 bg-transparent border-2 border-[#FFD700] text-[#FFD700] font-bold rounded-lg text-xl
                         transform transition-all duration-300 hover:scale-110 hover:bg-[#FFD700] hover:text-black"
                  style="font-family: 'Bradley Hand ITC', cursive;">
            View More Demos
          </button>
        </div>
      </div>
    </VideoBackground>

    <!-- Info Banner -->
    <div class="bg-gradient-to-r from-[#FFD700] to-[#8B6914] py-6 px-4 text-center">
      <p class="text-black font-bold text-lg" style="font-family: 'Bradley Hand ITC', cursive;">
        💡 Currently showing animated gradient background. Add your video to see it in action!
      </p>
    </div>
  </div>
</template>

<script setup>
import VideoBackground from '~/components/VideoBackground.vue'

useHead({
  title: 'Video Background Demo - Artilora',
  meta: [
    { name: 'description', content: 'Experience elegant video backgrounds for your art gallery' }
  ]
})
</script>

<style scoped>
.video-demo {
  background: #000;
}

.animate-fade-in {
  animation: fadeIn 1s ease-out forwards;
}

.animate-fade-in-delay-1 {
  animation: fadeIn 1s ease-out 0.3s forwards;
  opacity: 0;
}

.animate-fade-in-delay-2 {
  animation: fadeIn 1s ease-out 0.6s forwards;
  opacity: 0;
}

.animate-fade-in-delay-3 {
  animation: fadeIn 1s ease-out 0.9s forwards;
  opacity: 0;
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

.sculpture-card {
  animation: slideUp 0.8s ease-out forwards;
}

.sculpture-card:nth-child(1) {
  animation-delay: 0.2s;
  opacity: 0;
}

.sculpture-card:nth-child(2) {
  animation-delay: 0.4s;
  opacity: 0;
}

.sculpture-card:nth-child(3) {
  animation-delay: 0.6s;
  opacity: 0;
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(50px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

code {
  font-family: 'Courier New', monospace;
  font-size: 0.9em;
}
</style>
