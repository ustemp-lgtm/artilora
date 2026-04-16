<template>
  <div class="container mx-auto px-4 md:px-6 pt-20 md:pt-24 pb-16 md:pb-24 relative bg-black" style="min-height: 100vh;">
    <!-- Scroll Progress Bar -->
    <div class="scroll-progress-bar"></div>
    
    <!-- Decorative human figure - top corner -->
    <img src="/arty_human_transparent.png" alt="" class="absolute top-4 right-4 w-16 md:w-20 opacity-10 pointer-events-none" style="filter: brightness(0) saturate(100%) invert(15%) sepia(50%) saturate(500%) hue-rotate(350deg);" />
    
    <SectionReveal>
      <div class="mb-12 md:mb-20">
        <!-- Gallery Grid: 3 items per row -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-x-6 gap-y-4 max-w-7xl mx-auto items-start">
          <!-- Row 1, Item 1: Signboard/Easel Stand -->
          <div class="flex justify-center relative">
            <img src="/8_arty_signboard_transparent.png" alt="Arty's Gallery Signboard" loading="lazy" class="w-full max-w-sm h-auto" />
          </div>
          
          <!-- Row 1, Item 2: Sculpture 1 - Comfort -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(0)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/101_arty_Comfort.jpg?v=20260130-3`" alt="Comfort" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—101 Comfort
              </h3>
            </div>
          </div>
          
          <!-- Row 1, Item 3: Sculpture 2 - A Day That is Mine -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(1)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/102_arty_A_Day_That_is_Mine_1.jpg?v=20260130`" alt="A Day That is Mine" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—102 A Day That is Mine
              </h3>
            </div>
          </div>
          
          <!-- Row 2, Item 1: Sculpture 3 - The Darkness of Depth -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(2)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/103_arty_The_Darkness_of_Depth_1.jpg?v=20260130`" alt="The Darkness of Depth" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—103 The Darkness of Depth
              </h3>
            </div>
          </div>
          
          <!-- Row 2, Item 2: Sculpture 4 - Beyond That (Feminine) -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(3)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_104_Beyond_That (Feminine).jpg`" alt="Beyond That (Feminine)" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—104 Beyond That (Feminine)
              </h3>
            </div>
          </div>
          
          <!-- Row 2, Item 3: Sculpture 5 - Beyond That (Masculine) -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(4)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_105_Beyond_That (Masculine).jpg`" alt="Beyond That (Masculine)" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—105 Beyond That (Masculine)
              </h3>
            </div>
          </div>
          
          <!-- Row 3, Item 1: Sculpture 6 - Apathy -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(5)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_106_Apathy.jpg`" alt="Apathy" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—106 Apathy
              </h3>
            </div>
          </div>
          
          <!-- Row 3, Item 2: Sculpture 7 - Lady of Modesty -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(6)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_107_Lady_of_Modesty.jpg`" alt="Lady of Modesty" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—107 Lady of Modesty
              </h3>
            </div>
          </div>
          
          <!-- Row 3, Item 3: Sculpture 8 - The End of Comfort -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(7)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_108_The_End_of_Comfort.jpg`" alt="The End of Comfort" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—108 The End of Comfort
              </h3>
            </div>
          </div>
          
          <!-- Row 4, Item 1: Sculpture 9 - The Mother & Child Part 2 -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(8)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_109_The_Mother_&_child_ part_2.png`" alt="The Mother & Child Part 2" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—109 The Mother & Child Part 2
              </h3>
            </div>
          </div>
          
          <!-- Row 4, Item 2: Sculpture 10 - A Distant Solace -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(9)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_110_a_Distant_solace.png`" alt="A Distant Solace" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—110 A Distant Solace
              </h3>
            </div>
          </div>
          
          <!-- Row 4, Item 3: Sculpture 11 - Agony: The Burden Within -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(10)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_111_Agony_The_Burden_Within.png`" alt="Agony: The Burden Within" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—111 Agony: The Burden Within
              </h3>
            </div>
          </div>
          
          <!-- Row 5, Item 1: Sculpture 12 - Agony: A Shared Wound -->
          <div class="flex-shrink-0 cursor-pointer group sculpture-item sculpture-3d" @click="openLightbox(11)" @mousemove="handleMouseMove" @mouseleave="resetTilt">
            <div class="relative overflow-hidden aspect-[3/3.5] sculpture-frame sculpture-tilt">
              <img :src="`/arty_112_agony_a_shared_wound.png`" alt="Agony: A Shared Wound" class="w-full h-full object-cover transition-transform duration-700 group-hover:scale-110" />
              <div class="absolute inset-0 bg-artilora-dark/60 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex flex-col items-center justify-center text-center p-4 md:p-6">
                <h3 class="text-xl md:text-2xl font-serif text-artilora-ivory mb-2 transform translate-y-4 group-hover:translate-y-0 transition-transform duration-500" style="font-family: 'Bradley Hand ITC', cursive;">Click to Explore Details</h3>
              </div>
            </div>
            <div class="mt-1 text-center">
              <h3 class="text-xl md:text-2xl font-serif text-white" style="font-family: 'Bradley Hand ITC', cursive;">
                Arty—112 Agony: A Shared Wound
              </h3>
            </div>
          </div>
        </div>
      </div>
    </SectionReveal>

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-8">
      <!-- Grid items removed - only top sculpture shown -->
    </div>

    <!-- Lightbox with Tabs -->
    <div v-if="lightboxOpen" class="fixed inset-0 z-50 flex items-start justify-center p-4 overflow-y-auto lightbox-fade-in" @click="closeLightbox" role="dialog" aria-modal="true" aria-label="Image gallery lightbox" style="padding-top: 2rem; background: linear-gradient(135deg, rgba(0, 0, 0, 0.95) 0%, rgba(20, 20, 20, 0.95) 100%);">
      <!-- Close Button -->
      <button class="absolute top-4 md:top-6 right-4 md:right-6 text-white hover:text-artilora-green active:text-artilora-green transition-colors p-2 touch-manipulation z-10" @click="closeLightbox" aria-label="Close lightbox">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 md:w-10 md:h-10">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
      
      <!-- Previous Arrow -->
      <button 
        @click.stop="prevImage" 
        class="absolute left-4 top-1/2 -translate-y-1/2 text-white hover:text-yellow-400 transition-all p-3 bg-black/50 rounded-full hover:bg-black/70 z-10 nav-arrow"
        aria-label="Previous image"
      >
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="3" stroke="currentColor" class="w-8 h-8">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
        </svg>
      </button>
      
      <!-- Next Arrow -->
      <button 
        @click.stop="nextImage" 
        class="absolute right-4 top-1/2 -translate-y-1/2 text-white hover:text-yellow-400 transition-all p-3 bg-black/50 rounded-full hover:bg-black/70 z-10 nav-arrow"
        aria-label="Next image"
      >
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="3" stroke="currentColor" class="w-8 h-8">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
        </svg>
      </button>
      
      <div class="max-w-5xl w-full my-8 flex flex-col items-center" @click.stop>
        <!-- Image with glittering corners and zoom capability -->
        <div class="p-3 relative cursor-zoom-in" @click="toggleImageZoom">
          <!-- Glittering corner decorations -->
          <div class="absolute top-0 left-0 w-16 h-16 z-10" style="background: radial-gradient(circle at top left, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out infinite;"></div>
          <div class="absolute top-0 right-0 w-16 h-16 z-10" style="background: radial-gradient(circle at top right, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 0.5s infinite;"></div>
          <div class="absolute bottom-0 left-0 w-16 h-16 z-10" style="background: radial-gradient(circle at bottom left, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 1s infinite;"></div>
          <div class="absolute bottom-0 right-0 w-16 h-16 z-10" style="background: radial-gradient(circle at bottom right, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 1.5s infinite;"></div>
          
          <!-- Zoom hint -->
          <div class="absolute top-2 left-2 bg-black/70 text-white px-3 py-1 rounded-full text-xs z-20" style="font-family: 'Bradley Hand ITC', cursive;">
            🔍 Click to zoom
          </div>
          
          <img 
            :src="`${galleryItems[currentIndex].image}?v=20260130`" 
            :alt="galleryItems[currentIndex].title" 
            loading="eager" 
            :class="imageZoomed ? 'max-h-[65vh] cursor-zoom-out' : 'max-h-[35vh] md:max-h-[38vh]'"
            class="w-auto transition-all duration-500" 
            style="display: block; filter: drop-shadow(4px 4px 8px rgba(0,0,0,0.3));" 
          />
        </div>
        
        <!-- Title and Material -->
        <div class="text-center mt-4 md:mt-6 text-white px-4">
          <h3 class="text-xl md:text-2xl font-serif" style="font-family: 'Bradley Hand ITC', cursive;">Arty—{{ currentIndex + 101 }} {{ galleryItems[currentIndex].title }}</h3>
          <p class="text-sm md:text-base text-artilora-beige opacity-80 mt-1" style="font-family: 'Bradley Hand ITC', cursive;">{{ galleryItems[currentIndex].material }}</p>
        </div>

        <!-- Share Buttons -->
        <div class="mt-4 px-4 max-w-md mx-auto">
          <ShareButtons 
            :title="`Arty—${currentIndex + 101} ${galleryItems[currentIndex].title}`"
            :description="galleryItems[currentIndex].material"
            :image="galleryItems[currentIndex].image"
          />
        </div>

        <!-- Navigation Dots -->
        <div class="flex items-center justify-center gap-2 mt-4">
          <button 
            v-for="(item, index) in galleryItems" 
            :key="index"
            @click.stop="currentIndex = index"
            class="transition-all duration-300"
            :class="currentIndex === index ? 'w-8 h-2' : 'w-2 h-2'"
            :style="currentIndex === index ? 'background: #FFD700; border-radius: 4px;' : 'background: rgba(255, 255, 255, 0.3); border-radius: 50%;'"
            :aria-label="`View sculpture ${index + 1}`"
          ></button>
        </div>
        <p class="text-white/60 text-sm mt-2" style="font-family: 'Bradley Hand ITC', cursive;">
          {{ currentIndex + 1 }} of {{ galleryItems.length }}
        </p>

        <!-- Social Share Buttons -->
        <div class="flex items-center justify-center gap-3 mt-4 flex-wrap">
          <p class="text-white/60 text-xs mr-2" style="font-family: 'Bradley Hand ITC', cursive;">Share:</p>
          <a 
            :href="`https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent('http://192.168.10.66:3009/gallery')}`"
            target="_blank"
            class="social-share-btn bg-[#1877F2] hover:bg-[#145dbf]"
            title="Share on Facebook"
          >
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
          </a>
          <a 
            :href="`https://twitter.com/intent/tweet?text=${encodeURIComponent('Check out this beautiful aerial root sculpture from ARTILORA!')}&url=${encodeURIComponent('http://192.168.10.66:3009/gallery')}`"
            target="_blank"
            class="social-share-btn bg-[#1DA1F2] hover:bg-[#1a8cd8]"
            title="Share on Twitter"
          >
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
          </a>
          <a 
            :href="`https://wa.me/?text=${encodeURIComponent('Check out this beautiful aerial root sculpture from ARTILORA! http://192.168.10.66:3009/gallery')}`"
            target="_blank"
            class="social-share-btn bg-[#25D366] hover:bg-[#20bd5a]"
            title="Share on WhatsApp"
          >
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L0 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/></svg>
          </a>
          <a 
            :href="`https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent('http://192.168.10.66:3009/gallery')}`"
            target="_blank"
            class="social-share-btn bg-[#0A66C2] hover:bg-[#004182]"
            title="Share on LinkedIn"
          >
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
          </a>
          <a 
            href="https://www.instagram.com/"
            target="_blank"
            class="social-share-btn bg-gradient-to-br from-[#833AB4] via-[#FD1D1D] to-[#F77737] hover:opacity-80"
            title="Follow on Instagram"
          >
            <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
          </a>
        </div>

        <!-- Tabs -->
        <div class="mt-6 px-4">
          <!-- Tab Buttons -->
          <div class="flex justify-center gap-2 md:gap-4 mb-4 flex-wrap">
            <button 
              @click.stop="activeTab = 'details'" 
              :class="activeTab === 'details' ? 'bg-[#8B0000] text-white' : 'bg-white/20 text-white/70 hover:bg-white/30'"
              class="px-3 md:px-4 py-2 rounded-lg transition-all duration-300 text-xs md:text-sm font-medium flex-1 min-w-[220px]"
              style="font-family: 'Bradley Hand ITC', cursive;"
            >
              TAG NO.1<br>SCULPTURE DETAILS
            </button>
            <button 
              @click.stop="activeTab = 'myth'" 
              :class="activeTab === 'myth' ? 'bg-[#8B0000] text-white' : 'bg-white/20 text-white/70 hover:bg-white/30'"
              class="px-3 md:px-4 py-2 rounded-lg transition-all duration-300 text-xs md:text-sm font-medium flex-1 min-w-[220px]"
              style="font-family: 'Bradley Hand ITC', cursive;"
            >
              TAG NO.2<br>SCULPTURE ESSENCE
            </button>
            <button 
              @click.stop="activeTab = 'ancestralStudio'" 
              :class="activeTab === 'ancestralStudio' ? 'bg-[#8B0000] text-white' : 'bg-white/20 text-white/70 hover:bg-white/30'"
              class="px-3 md:px-4 py-2 rounded-lg transition-all duration-300 text-xs md:text-sm font-medium flex-1 min-w-[220px]"
              style="font-family: 'Bradley Hand ITC', cursive; white-space: nowrap;"
            >
              TAG NO.3<br>THE ANCESTRAL STUDIO
            </button>
          </div>

          <!-- Tab Content with Human Background - SCROLLABLE -->
          <div class="bg-white/10 backdrop-blur-sm rounded-lg p-4 md:p-6 max-w-3xl mx-auto relative max-h-[75vh] overflow-y-auto">
            <!-- Content wrapper with relative positioning -->
            <div class="relative z-10">
              <div v-if="activeTab === 'details'" class="text-white text-sm md:text-base leading-relaxed" style="font-family: 'Bradley Hand ITC', cursive; border: 3px double #D9A87C; border-radius: 12px; padding: 24px; background: linear-gradient(135deg, rgba(139, 69, 19, 0.1) 0%, rgba(217, 168, 124, 0.1) 100%); box-shadow: 0 4px 15px rgba(139, 69, 19, 0.3), inset 0 0 20px rgba(217, 168, 124, 0.2);">
                <!-- Header with Audio Button -->
                <div class="flex items-start justify-between gap-4 mb-5">
                  <div style="color: #FFD700; font-size: 1.5em; font-weight: bold; line-height: 1.4; flex: 1; text-shadow: 0 0 10px rgba(255, 215, 0, 0.8), 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 4px rgba(0, 0, 0, 0.9);">
                    TAG NO.1<br>
                    {{ galleryItems[currentIndex].title.toUpperCase() }} — ARTY — {{ String(101 + currentIndex).padStart(3, '0') }}<br>
                    SCULPTURE DETAILS
                  </div>
                  <!-- Audio Button -->
                  <div class="relative flex flex-col items-center gap-2 flex-shrink-0">
                    <div class="relative">
                      <svg class="circular-progress-small" width="60" height="60">
                        <circle cx="30" cy="30" r="26" class="progress-bg-small"></circle>
                        <circle 
                          cx="30" 
                          cy="30" 
                          r="26" 
                          class="progress-ring-small"
                          :style="{ strokeDashoffset: isSpeakingDetails ? 163 - (163 * audioProgressDetails / 100) : 163 }"
                        ></circle>
                      </svg>
                      <button @click.stop="speakDetails" class="listen-button-tiny" :class="{ 'speaking': isSpeakingDetails }">
                        <span v-if="!isSpeakingDetails">🔊</span>
                        <span v-else>⏸️</span>
                      </button>
                    </div>
                    <div v-if="isSpeakingDetails" class="waveform-container-tiny">
                      <div class="wave-bar-tiny" v-for="i in 5" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
                    </div>
                  </div>
                </div>
                <!-- Certificate Title - Bright Coral -->
                <div style="color: #FF7F50; font-size: 1.05em; font-weight: bold; margin-bottom: 16px;">
                  ARTILORA — Certificate of Creation
                </div>
                <!-- SCULPTURISMS Heading - Same style as TAG NO.1 (Gold) -->
                <div style="color: #FFD700; font-size: 1.5em; font-weight: bold; margin-bottom: 20px; line-height: 1.4;">
                  SCULPTURISMS
                </div>
                <!-- Main Details - White with styled field labels -->
                <div v-html="formatSculptureDetails(galleryItems[currentIndex].details)"></div>
                <!-- Footer - Bright Coral -->
                <div style="color: #FF7F50; font-size: 0.95em; font-weight: bold; margin-top: 16px;">
                  Certified Original: Handcrafted & Conceived at ARTILORA Studio
                </div>
              </div>
              <div v-if="activeTab === 'myth'" class="text-white text-sm md:text-base leading-relaxed" style="font-family: 'Bradley Hand ITC', cursive; border: 3px double #D9A87C; border-radius: 12px; padding: 24px; background: linear-gradient(135deg, rgba(139, 69, 19, 0.1) 0%, rgba(217, 168, 124, 0.1) 100%); box-shadow: 0 4px 15px rgba(139, 69, 19, 0.3), inset 0 0 20px rgba(217, 168, 124, 0.2);">
                <!-- Header with Audio Button -->
                <div class="flex items-start justify-between gap-4 mb-5">
                  <div style="color: #FFD700; font-size: 1.5em; font-weight: bold; line-height: 1.4; flex: 1; text-shadow: 0 0 10px rgba(255, 215, 0, 0.8), 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 4px rgba(0, 0, 0, 0.9);">
                    TAG NO.2<br>
                    {{ galleryItems[currentIndex].title.toUpperCase() }} — ARTY — {{ String(101 + currentIndex).padStart(3, '0') }}<br>
                    SCULPTURE ESSENCE
                  </div>
                  <!-- Audio Button -->
                  <div class="relative flex flex-col items-center gap-2 flex-shrink-0">
                    <div class="relative">
                      <svg class="circular-progress-small" width="60" height="60">
                        <circle cx="30" cy="30" r="26" class="progress-bg-small"></circle>
                        <circle 
                          cx="30" 
                          cy="30" 
                          r="26" 
                          class="progress-ring-small"
                          :style="{ strokeDashoffset: isSpeakingMyth ? 163 - (163 * audioProgressMyth / 100) : 163 }"
                        ></circle>
                      </svg>
                      <button @click.stop="speakMyth" class="listen-button-tiny" :class="{ 'speaking': isSpeakingMyth }">
                        <span v-if="!isSpeakingMyth">🔊</span>
                        <span v-else>⏸️</span>
                      </button>
                    </div>
                    <div v-if="isSpeakingMyth" class="waveform-container-tiny">
                      <div class="wave-bar-tiny" v-for="i in 5" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
                    </div>
                  </div>
                </div>
                <!-- Essence Text - White -->
                <p class="text-justify" style="color: white;">
                  {{ galleryItems[currentIndex].myth }}
                </p>
              </div>
              <div v-if="activeTab === 'ancestralStudio'" class="text-white text-sm md:text-base leading-relaxed" style="font-family: 'Bradley Hand ITC', cursive; border: 3px double #D9A87C; border-radius: 12px; padding: 24px; background: linear-gradient(135deg, rgba(139, 69, 19, 0.1) 0%, rgba(217, 168, 124, 0.1) 100%); box-shadow: 0 4px 15px rgba(139, 69, 19, 0.3), inset 0 0 20px rgba(217, 168, 124, 0.2);">
                <!-- Header with Audio Button -->
                <div class="flex items-start justify-between gap-4 mb-5">
                  <div style="color: #FFD700; font-size: 1.5em; font-weight: bold; line-height: 1.4; flex: 1; text-shadow: 0 0 10px rgba(255, 215, 0, 0.8), 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 4px rgba(0, 0, 0, 0.9);">
                    TAG NO.3<br>
                    {{ galleryItems[currentIndex].title.toUpperCase() }} — ARTY — {{ String(101 + currentIndex).padStart(3, '0') }}<br>
                    THE ANCESTRAL STUDIO
                  </div>
                  <!-- Audio Button -->
                  <div class="relative flex flex-col items-center gap-2 flex-shrink-0">
                    <div class="relative">
                      <svg class="circular-progress-small" width="60" height="60">
                        <circle cx="30" cy="30" r="26" class="progress-bg-small"></circle>
                        <circle 
                          cx="30" 
                          cy="30" 
                          r="26" 
                          class="progress-ring-small"
                          :style="{ strokeDashoffset: isSpeakingAncestral ? 163 - (163 * audioProgressAncestral / 100) : 163 }"
                        ></circle>
                      </svg>
                      <button @click.stop="speakAncestral" class="listen-button-tiny" :class="{ 'speaking': isSpeakingAncestral }">
                        <span v-if="!isSpeakingAncestral">🔊</span>
                        <span v-else>⏸️</span>
                      </button>
                    </div>
                    <div v-if="isSpeakingAncestral" class="waveform-container-tiny">
                      <div class="wave-bar-tiny" v-for="i in 5" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
                    </div>
                  </div>
                </div>
                
                <!-- Ancestral Home Address Section -->
                <div style="color: white; text-align: justify; margin-bottom: 24px;" v-html="formatAncestralAddress(galleryItems[currentIndex].ancestralAddress)"></div>
                
                <!-- Location Map -->
                <div class="mt-6 mb-8">
                  <p class="text-xs md:text-sm mb-2 text-center" style="color: #FFD700;">
                    📍 {{ galleryItems[currentIndex].mapLocation }}
                  </p>
                  <iframe
                    :src="`https://maps.google.com/maps?q=${galleryItems[currentIndex].mapCoordinates}&t=&z=10&ie=UTF8&iwloc=&output=embed`"
                    width="100%"
                    height="300"
                    style="border:0; border-radius: 8px;"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
                    class="shadow-lg"
                  ></iframe>
                </div>
                
                <!-- Studio Location Section -->
                <div style="color: white; text-align: justify; margin-top: 24px;" v-html="formatStudioLocation(galleryItems[currentIndex].studioInfo)"></div>
                
                <!-- Studio Map -->
                <div class="mt-6">
                  <p class="text-xs md:text-sm mb-2 text-center" style="color: #FFD700;">
                    📍 {{ galleryItems[currentIndex].studioLocation }}
                  </p>
                  <iframe
                    :src="`https://maps.google.com/maps?q=${galleryItems[currentIndex].studioCoordinates}&t=&z=15&ie=UTF8&iwloc=&output=embed`"
                    width="100%"
                    height="300"
                    style="border:0; border-radius: 8px;"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"
                    class="shadow-lg"
                  ></iframe>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Navigation Arrows -->
      <button class="absolute left-2 md:left-4 top-1/2 -translate-y-1/2 text-white hover:text-artilora-green active:text-artilora-green transition-colors p-2 touch-manipulation" @click.stop="prevImage" aria-label="Previous image">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 md:w-10 md:h-10">
          <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 19.5L8.25 12l7.5-7.5" />
        </svg>
      </button>
      <button class="absolute right-2 md:right-4 top-1/2 -translate-y-1/2 text-white hover:text-artilora-green active:text-artilora-green transition-colors p-2 touch-manipulation" @click.stop="nextImage" aria-label="Next image">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-8 h-8 md:w-10 md:h-10">
          <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
        </svg>
      </button>
    </div>
  </div>
</template>

<script setup>
useHead({
  title: 'Gallery - Artilora',
  meta: [
    { name: 'description', content: 'Explore Artilora\'s gallery of organic sculptures. Each piece reveals the hidden beauty within nature through mindful meditation and artistic presence.' },
    { name: 'keywords', content: 'art gallery, sculpture gallery, wood sculptures, organic art, nature sculptures, Artilora gallery' },
    { property: 'og:title', content: 'Gallery - Artilora' },
    { property: 'og:description', content: 'Explore organic sculptures that reveal nature\'s hidden beauty.' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: 'http://192.168.10.66:3009/gallery' },
    { property: 'og:image', content: 'http://192.168.10.66:3009/5_arty_gallery_transparent.png' }
  ]
})

const galleryItems = [
  {
    title: 'Comfort',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation on finding solace and peace within nature\'s embrace. (Arty—101)',
    image: '/101_arty_Comfort.jpg?v=20260130-3',
    details: `SCULPTURE TITLE: COMFORT : ARTY : 101
MANUSCRIPT CODE: ARTY/101/IND/KLA/260126
ANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis
FOUNDATION: Handcrafted Teakwood Plinth
SCULPTED FROM: NATURE
CONCEIVED WITHIN: ARTILORA STUDIO
ESSENCE: Rooted in an inspirational Myth
WORTH:
GRAVITY:
ELEVATION:
CHRONOCRAFT:
MOMENT OF BIRTH:
MOMENT OF REINCARNATION:
WEBSITE: https://www.artilora.art
OFFICIAL DESK: info@artilora.art`,
    myth: 'Comfort\n\nTwo forms meet where words fall silent. One bends under grief; the other becomes shelter. In this quiet embrace, pain is neither erased nor explained—only held. Limbs entwine like roots seeking ground. Here, endurance takes the shape of mercy, and stillness becomes an act of profound strength.',
    ancestralAddress: `Estimated Age of Tree / Root:
The parent banyan tree is believed to be over 80–100 years old. The aerial roots used in this sculpture matured naturally over 25–30 years before separating from the living tree.

Significance of the Location:
The tree stood beside an old ancestral home where generations once lived, prayed, and slowly dispersed. It bore silent witness to family gatherings, seasonal rituals, everyday conversations, and eventual solitude.

Discovery & Acquisition:
The material was discovered during routine clearing of the ancestral compound. Recognizing the inherent sculptural language within the roots, the artist carefully preserved and collected them, ensuring that no living part of the tree was harmed.

Cultural & Historical Context

Local Beliefs & Stories:
In local tradition, the banyan is regarded as a guardian tree—a symbol of shelter, continuity, and collective memory. Elders believe such trees absorb the joys, griefs, and prayers spoken beneath their shade.

Historical Importance of the Area:
The region is rooted in an agrarian past shaped by joint-family homes and temple-centered community life—social structures that have gradually faded but continue to live on in memory.

Spiritual & Biblical Significance:
Though not named explicitly in the Bible, the banyan embodies many biblical virtues: shelter for the weary, strength drawn from deep roots, and life sustained across generations. Like the "tree planted by streams of water" (Psalm 1:3), it offers shade, continuity, and quiet refuge. Spiritually, the banyan becomes a living metaphor for God's abiding presence—holding many lives within one enduring form.

Connection to Community:
The tree served as a natural gathering point—children played beneath it, elders rested in its shade, and travelers paused there. Its roots were never regarded as waste, only as forms waiting for renewal.

Journey of the Material:
The aerial roots were transported by hand from their place of origin to the artist's studio, without mechanized cutting. Over time, they underwent natural drying, careful cleaning, and minimal intervention, allowing the material to reveal its own form.

In the studio, the roots were not forced into shape. Instead, Comfort emerged through attentive listening—honoring the material's memory, curves, and quiet strength.

Conceptual Note:
This material speaks of belonging without possession. Just as comfort often arises not from words but from presence, these roots carry the weight of time, shelter, and endurance—transforming lived silence into form.`,
    mapCoordinates: '10.8505,76.2711', // Kerala (placeholder)
    mapLocation: 'Kerala, India',
    studioInfo: `Studio Name:
ARTILORA Studio

Full Address:
[Street Address]
[City, State - PIN Code]
[Country]

Contact Information:
Phone: +91 9645340782
Email: info@artilora.art
Private: somanjose@artilora.art
Website: https://www.artilora.art

Studio Hours:
[To be updated - e.g., Monday to Saturday: 10:00 AM - 6:00 PM]
[Sunday: By appointment only]

Visiting Instructions:
[To be updated - Any specific directions, parking information, or appointment requirements]

About the Studio:
ARTILORA Studio is where nature's silent forms are transformed into sculptural expressions through a disciplined creative process that honors both material and meaning.

Treat each department as a chapter rather than a step.

CHAPTERS OF THE STUDIO
• TO DO — On the Workboard
• DO NOT — Beyond the Frame
• DOING — Being Sculpted
• DONE — Crafted to Completion
• OUTDONE — Legendary
• OUTCOMES — Living Beyond the Studio

TO DO — On the Workboard
Where intention waits and observation begins. This is the realm of listening. Raw material rests untouched as ideas gather quietly around it. Observation, patience, and intuitive foresight guide this phase, allowing the sculpture to reveal its own possibilities before the hand intervenes.

DO NOT — Beyond the Frame
Where restraint protects the soul of the work. This phase honors discipline and reverence. Certain lines are never crossed, certain forces never imposed. It is the wisdom of knowing when not to act—preserving the material's essence by resisting excess, haste, and domination.

DOING — Being Sculpted
Where hands, tools, and material enter dialogue. Here, creation finds its pulse. Hands engage, tools respond, and the grain begins to speak. Through skilled craftsmanship and sensitivity, form slowly emerges, discovering its posture, rhythm, and presence.

DONE — Crafted to Completion
Where balance is reached and silence settles. The work comes to rest within itself. Surfaces are refined, proportions resolved, and the sculpture arrives at quiet readiness. Completion is not an ending, but a moment of harmony—when nothing more needs to be added or removed.

OUTDONE — Legendary
Where a work transcends making and becomes memory. This is a rare crossing. Some works move beyond completion into legacy, carrying stories larger than the studio itself. They echo time, emotion, and lived experience—no longer merely crafted, but enduring.

OUTCOMES — Living Beyond the Studio
Where the work continues its journey. In homes, galleries, and silent encounters, the sculpture shapes emotion, memory, and reflection. Each viewer completes the work anew, carrying its meaning forward in ways the maker cannot predict.

The studio welcomes collectors, art enthusiasts, and those seeking to commission custom pieces. Prior appointment is recommended for personalized consultations.`,
    studioCoordinates: '10.8505,76.2711', // Placeholder - update with actual studio coordinates
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'A Day That is Mine',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation on personal time and solitude within nature\'s embrace. (Arty—102)',
    image: '/102_arty_A_Day_That_is_Mine_1.jpg?v=20260130',
    details: `SCULPTURE TITLE: A DAY THAT IS MINE : ARTY : 102
MANUSCRIPT CODE: ARTY/102/IND/KLA/260214
ANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis
FOUNDATION: Handcrafted Teakwood Plinth
SCULPTED FROM: NATURE
CONCEIVED WITHIN: ARTILORA STUDIO
ESSENCE: Rooted in an inspirational Myth
WORTH:
GRAVITY:
ELEVATION:
CHRONOCRAFT:
MOMENT OF BIRTH:
MOMENT OF REINCARNATION:
WEBSITE: https://www.artilora.art
OFFICIAL DESK: info@artilora.art`,
    myth: 'A Day That is Mine\n\nThere is a quiet myth that says every human life is granted one day that truly belongs to them—not to duty, memory, or expectation. On that day, two selves walk together: the one shaped by all that has been endured, and the one still becoming. They move forward side by side, neither leading nor following, bound by the same pulse of time. This sculpture captures that moment—the rare, sacred day when a person walks in agreement with themselves, carrying the past without being chained to it, and stepping into tomorrow without fear.',
    ancestralAddress: `Estimated Age of Tree / Root:
[To be updated]

Significance of the Location:
[To be updated]

Discovery & Acquisition:
[To be updated]

Cultural & Historical Context

Local Beliefs & Stories:
[To be updated]

Historical Importance of the Area:
[To be updated]

Spiritual & Biblical Significance:
[To be updated]

Connection to Community:
[To be updated]

Journey of the Material:
[To be updated]

Conceptual Note:
[To be updated]`,
    mapCoordinates: '10.8505,76.2711', // Kerala (placeholder)
    mapLocation: 'Kerala, India',
    studioInfo: `Studio Name:
ARTILORA Studio

Full Address:
[Street Address]
[City, State - PIN Code]
[Country]

Contact Information:
Phone: +91 9645340782
Email: info@artilora.art
Private: somanjose@artilora.art
Website: https://www.artilora.art

Studio Hours:
[To be updated - e.g., Monday to Saturday: 10:00 AM - 6:00 PM]
[Sunday: By appointment only]

Visiting Instructions:
[To be updated - Any specific directions, parking information, or appointment requirements]

About the Studio:
ARTILORA Studio is where nature's silent forms are transformed into sculptural expressions through a disciplined creative process that honors both material and meaning.

Treat each department as a chapter rather than a step.

CHAPTERS OF THE STUDIO
• TO DO — On the Workboard
• DO NOT — Beyond the Frame
• DOING — Being Sculpted
• DONE — Crafted to Completion
• OUTDONE — Legendary
• OUTCOMES — Living Beyond the Studio

TO DO — On the Workboard
Where intention waits and observation begins. This is the realm of listening. Raw material rests untouched as ideas gather quietly around it. Observation, patience, and intuitive foresight guide this phase, allowing the sculpture to reveal its own possibilities before the hand intervenes.

DO NOT — Beyond the Frame
Where restraint protects the soul of the work. This phase honors discipline and reverence. Certain lines are never crossed, certain forces never imposed. It is the wisdom of knowing when not to act—preserving the material's essence by resisting excess, haste, and domination.

DOING — Being Sculpted
Where hands, tools, and material enter dialogue. Here, creation finds its pulse. Hands engage, tools respond, and the grain begins to speak. Through skilled craftsmanship and sensitivity, form slowly emerges, discovering its posture, rhythm, and presence.

DONE — Crafted to Completion
Where balance is reached and silence settles. The work comes to rest within itself. Surfaces are refined, proportions resolved, and the sculpture arrives at quiet readiness. Completion is not an ending, but a moment of harmony—when nothing more needs to be added or removed.

OUTDONE — Legendary
Where a work transcends making and becomes memory. This is a rare crossing. Some works move beyond completion into legacy, carrying stories larger than the studio itself. They echo time, emotion, and lived experience—no longer merely crafted, but enduring.

OUTCOMES — Living Beyond the Studio
Where the work continues its journey. In homes, galleries, and silent encounters, the sculpture shapes emotion, memory, and reflection. Each viewer completes the work anew, carrying its meaning forward in ways the maker cannot predict.

The studio welcomes collectors, art enthusiasts, and those seeking to commission custom pieces. Prior appointment is recommended for personalized consultations.`,
    studioCoordinates: '10.8505,76.2711', // Placeholder - update with actual studio coordinates
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'The Darkness of Depth',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation on the profound depths within nature\'s embrace. (Arty—103)',
    image: '/103_arty_The_Darkness_of_Depth_1.jpg?v=20260130',
    details: `SCULPTURE TITLE: THE DARKNESS OF DEPTH : ARTY : 103
MANUSCRIPT CODE: ARTY/103/IND/KLA/260214
ANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis
FOUNDATION: Handcrafted Teakwood Plinth
SCULPTED FROM: NATURE
CONCEIVED WITHIN: ARTILORA STUDIO
ESSENCE: Rooted in an inspirational Myth
WORTH:
GRAVITY:
ELEVATION:
CHRONOCRAFT:
MOMENT OF BIRTH:
MOMENT OF REINCARNATION:
WEBSITE: https://www.artilora.art
OFFICIAL DESK: info@artilora.art`,
    myth: 'The Darkness of Depth\n\nAn old myth says that darkness is not an enemy, but a sacred chamber where the soul is asked to sit still. In that place, stripped of light and distraction, a person curls inward and listens to the roots of their own being. The weight above is not punishment, it is protection, holding the self together until truth ripens. This sculpture speaks of that moment when despair feels complete, yet unseen beneath it, strength is quietly rearranging itself, preparing the heart to rise with deeper wisdom than before.',
    ancestralAddress: `Estimated Age of Tree / Root:
[To be updated]

Significance of the Location:
[To be updated]

Discovery & Acquisition:
[To be updated]

Cultural & Historical Context

Local Beliefs & Stories:
[To be updated]

Historical Importance of the Area:
[To be updated]

Spiritual & Biblical Significance:
[To be updated]

Connection to Community:
[To be updated]

Journey of the Material:
[To be updated]

Conceptual Note:
[To be updated]`,
    mapCoordinates: '10.8505,76.2711', // Kerala (placeholder)
    mapLocation: 'Kerala, India',
    studioInfo: `Studio Name:
ARTILORA Studio

Full Address:
[Street Address]
[City, State - PIN Code]
[Country]

Contact Information:
Phone: +91 9645340782
Email: info@artilora.art
Private: somanjose@artilora.art
Website: https://www.artilora.art

Studio Hours:
[To be updated - e.g., Monday to Saturday: 10:00 AM - 6:00 PM]
[Sunday: By appointment only]

Visiting Instructions:
[To be updated - Any specific directions, parking information, or appointment requirements]

About the Studio:
ARTILORA Studio is where nature's silent forms are transformed into sculptural expressions through a disciplined creative process that honors both material and meaning.

Treat each department as a chapter rather than a step.

CHAPTERS OF THE STUDIO
• TO DO — On the Workboard
• DO NOT — Beyond the Frame
• DOING — Being Sculpted
• DONE — Crafted to Completion
• OUTDONE — Legendary
• OUTCOMES — Living Beyond the Studio

TO DO — On the Workboard
Where intention waits and observation begins. This is the realm of listening. Raw material rests untouched as ideas gather quietly around it. Observation, patience, and intuitive foresight guide this phase, allowing the sculpture to reveal its own possibilities before the hand intervenes.

DO NOT — Beyond the Frame
Where restraint protects the soul of the work. This phase honors discipline and reverence. Certain lines are never crossed, certain forces never imposed. It is the wisdom of knowing when not to act—preserving the material's essence by resisting excess, haste, and domination.

DOING — Being Sculpted
Where hands, tools, and material enter dialogue. Here, creation finds its pulse. Hands engage, tools respond, and the grain begins to speak. Through skilled craftsmanship and sensitivity, form slowly emerges, discovering its posture, rhythm, and presence.

DONE — Crafted to Completion
Where balance is reached and silence settles. The work comes to rest within itself. Surfaces are refined, proportions resolved, and the sculpture arrives at quiet readiness. Completion is not an ending, but a moment of harmony—when nothing more needs to be added or removed.

OUTDONE — Legendary
Where a work transcends making and becomes memory. This is a rare crossing. Some works move beyond completion into legacy, carrying stories larger than the studio itself. They echo time, emotion, and lived experience—no longer merely crafted, but enduring.

OUTCOMES — Living Beyond the Studio
Where the work continues its journey. In homes, galleries, and silent encounters, the sculpture shapes emotion, memory, and reflection. Each viewer completes the work anew, carrying its meaning forward in ways the maker cannot predict.

The studio welcomes collectors, art enthusiasts, and those seeking to commission custom pieces. Prior appointment is recommended for personalized consultations.`,
    studioCoordinates: '10.8505,76.2711', // Placeholder - update with actual studio coordinates
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Beyond That (Feminine)',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—104)',
    image: '/arty_104_beyond_that_feminine.jpg',
    details: 'SCULPTURE TITLE: BEYOND THAT (FEMININE) : ARTY : 104\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Beyond That (Feminine)\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Beyond That (Masculine)',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—105)',
    image: '/arty_105_beyond_that_masculine.jpg',
    details: 'SCULPTURE TITLE: BEYOND THAT (MASCULINE) : ARTY : 105\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Beyond That (Masculine)\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Apathy',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—106)',
    image: '/arty_106_Apathy.jpg',
    details: 'SCULPTURE TITLE: APATHY : ARTY : 106\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Apathy\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Lady of Modesty',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—107)',
    image: '/arty_107_Lady_of_Modesty.jpg',
    details: 'SCULPTURE TITLE: LADY OF MODESTY : ARTY : 107\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Lady of Modesty\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'The End of Comfort',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—108)',
    image: '/arty_108_The_End_of_Comfort.jpg',
    details: 'SCULPTURE TITLE: THE END OF COMFORT : ARTY : 108\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'The End of Comfort\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'The Mother & Child Part 2',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—109)',
    image: '/arty_105_mother_child_part2.png',
    details: 'SCULPTURE TITLE: THE MOTHER & CHILD PART 2 : ARTY : 109\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'The Mother & Child Part 2\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'A Distant Solace',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—110)',
    image: '/arty_110_a_Distant_solace.png',
    details: 'SCULPTURE TITLE: A DISTANT SOLACE : ARTY : 110\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'A Distant Solace\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Agony: The Burden Within',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—111)',
    image: '/agony_the_burden_within.png',
    details: 'SCULPTURE TITLE: AGONY: THE BURDEN WITHIN : ARTY : 111\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Agony: The Burden Within\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  },
  {
    title: 'Agony: A Shared Wound',
    material: 'Aerial Root Sculpture in Ficus benghalensis',
    description: 'A meditation within nature\'s embrace. (Arty—112)',
    image: '/agony_a_shared_wound.png',
    details: 'SCULPTURE TITLE: AGONY: A SHARED WOUND : ARTY : 112\nMANUSCRIPT CODE: [To be updated]\nANATOMY: Polished Aerial Root Sculpture in Ficus Benghalensis\nFOUNDATION: Handcrafted Teakwood Plinth\nSCULPTED FROM: NATURE\nCONCEIVED WITHIN: ARTILORA STUDIO',
    myth: 'Agony: A Shared Wound\n\n[Myth story to be updated]',
    ancestralAddress: 'Estimated Age of Tree / Root:\n[To be updated]',
    mapCoordinates: '10.8505,76.2711',
    mapLocation: 'Kerala, India',
    studioInfo: 'Studio Name:\nARTILORA Studio\nABOUT THE STUDIO: [To be updated]',
    studioCoordinates: '10.8505,76.2711',
    studioLocation: 'ARTILORA Studio, Kerala, India'
  }
]


const lightboxOpen = ref(false)
const currentIndex = ref(0)
const activeTab = ref('details')
const imageZoomed = ref(false)
const tagImageZoomed = ref(false)

// 3D Tilt Effect - Mouse tracking
const handleMouseMove = (event) => {
  if (!process.client) return
  
  const card = event.currentTarget
  const tiltElement = card.querySelector('.sculpture-tilt')
  if (!tiltElement) return
  
  const rect = card.getBoundingClientRect()
  const x = event.clientX - rect.left
  const y = event.clientY - rect.top
  
  const centerX = rect.width / 2
  const centerY = rect.height / 2
  
  const rotateX = ((y - centerY) / centerY) * -10 // Max 10 degrees tilt
  const rotateY = ((x - centerX) / centerX) * 10
  
  tiltElement.classList.add('tilting')
  tiltElement.style.transform = `
    perspective(1000px) 
    rotateX(${rotateX}deg) 
    rotateY(${rotateY}deg) 
    scale(1.05)
  `
}

const resetTilt = (event) => {
  if (!process.client) return
  
  const card = event.currentTarget
  const tiltElement = card.querySelector('.sculpture-tilt')
  if (!tiltElement) return
  
  tiltElement.classList.remove('tilting')
  tiltElement.style.transform = 'perspective(1000px) rotateX(0deg) rotateY(0deg) scale(1)'
}

const openLightbox = (index) => {
  currentIndex.value = index
  activeTab.value = 'details' // Reset to details tab
  lightboxOpen.value = true
  imageZoomed.value = false
  if (typeof document !== 'undefined') {
    document.body.style.overflow = 'hidden'
  }
  // Scroll modal content to top
  if (typeof window !== 'undefined') {
    setTimeout(() => {
      const modalContent = document.querySelector('.fixed.inset-0.z-50')
      if (modalContent) {
        modalContent.scrollTop = 0
      }
    }, 50)
  }
}

const closeLightbox = () => {
  lightboxOpen.value = false
  imageZoomed.value = false
  if (typeof document !== 'undefined') {
    document.body.style.overflow = 'auto'
  }
}

const toggleImageZoom = () => {
  imageZoomed.value = !imageZoomed.value
}

const toggleTagImageZoom = () => {
  tagImageZoomed.value = !tagImageZoomed.value
}

const nextImage = () => {
  currentIndex.value = (currentIndex.value + 1) % galleryItems.length
  imageZoomed.value = false // Reset zoom when changing images
}

const prevImage = () => {
  currentIndex.value = (currentIndex.value - 1 + galleryItems.length) % galleryItems.length
  imageZoomed.value = false // Reset zoom when changing images
}

// Keyboard navigation
const handleKeyPress = (event) => {
  if (!lightboxOpen.value) return
  
  if (event.key === 'Escape') {
    closeLightbox()
  } else if (event.key === 'ArrowRight') {
    nextImage()
  } else if (event.key === 'ArrowLeft') {
    prevImage()
  }
}

// Touch/Swipe gestures for mobile
let touchStartX = 0
let touchEndX = 0

const handleTouchStart = (event) => {
  touchStartX = event.changedTouches[0].screenX
}

const handleTouchEnd = (event) => {
  touchEndX = event.changedTouches[0].screenX
  handleSwipe()
}

const handleSwipe = () => {
  const swipeThreshold = 50
  if (touchEndX < touchStartX - swipeThreshold) {
    // Swipe left - next image
    nextImage()
  }
  if (touchEndX > touchStartX + swipeThreshold) {
    // Swipe right - previous image
    prevImage()
  }
}

// Setup event listeners
onMounted(() => {
  if (process.client) {
    document.addEventListener('keydown', handleKeyPress)
    document.addEventListener('touchstart', handleTouchStart)
    document.addEventListener('touchend', handleTouchEnd)
  }
})

// Cleanup event listeners
onUnmounted(() => {
  if (process.client) {
    document.removeEventListener('keydown', handleKeyPress)
    document.removeEventListener('touchstart', handleTouchStart)
    document.removeEventListener('touchend', handleTouchEnd)
  }
})

const formatAncestralAddress = (text) => {
  // Replace subheadings with bright styled HTML - no glow
  return text
    .replace(/^(Estimated Age of Tree \/ Root:|Significance of the Location:|Discovery & Acquisition:|Cultural & Historical Context|Local Beliefs & Stories:|Historical Importance of the Area:|Spiritual & Biblical Significance:|Connection to Community:|Journey of the Material:|Conceptual Note:)\n/gm, 
      '<strong style="font-size: 1.15em; color: #FFD700; display: block; margin-top: 12px; margin-bottom: 0px; line-height: 1.2;">$1</strong>')
    .replace(/\n/g, '<br>')
}

const formatSculptureDetails = (text) => {
  // Replace field labels with bright styled HTML - no glow
  return text
    .replace(/^(SCULPTURE TITLE:|MANUSCRIPT CODE:|ANATOMY:|FOUNDATION:|SCULPTED FROM:|CONCEIVED WITHIN:|ESSENCE:|WORTH:|GRAVITY:|ELEVATION:|CHRONOCRAFT:|MOMENT OF BIRTH:|MOMENT OF REINCARNATION:|WEBSITE:|OFFICIAL DESK:)/gm, 
      '<span class="field-label" style="color: #00BFFF; font-weight: bold; font-size: 1.05em;">$1</span>')
    .replace(/\n/g, '<br>')
}

const formatStudioLocation = (text) => {
  // Replace studio section headings and phase titles with bright styled HTML - no glow
  return text
    .replace(/^(Studio Name:|Full Address:|Contact Information:|Studio Hours:|Visiting Instructions:|About the Studio:)\n/gm, 
      '<strong style="font-size: 1.15em; color: #FFD700; display: block; margin-top: 12px; margin-bottom: 0px; line-height: 1.2;">$1</strong>')
    .replace(/CHAPTERS OF THE STUDIO\n/gm, 
      '<strong style="font-size: 1.2em; color: #FFD700; display: block; margin-top: 20px; margin-bottom: 8px; font-weight: bold; text-align: left;">CHAPTERS OF THE STUDIO</strong>')
    // Bullet points in the list - bright color, no glow
    .replace(/• (TO DO — On the Workboard|DO NOT — Beyond the Frame|DOING — Being Sculpted|DONE — Crafted to Completion|OUTDONE — Legendary|OUTCOMES — Living Beyond the Studio)/gm, 
      '• <span style="color: #00BFFF; font-weight: bold; font-size: 1.05em;">$1</span>')
    // Full chapter headings - bright color, no glow
    .replace(/^(TO DO — On the Workboard|DO NOT — Beyond the Frame|DOING — Being Sculpted|DONE — Crafted to Completion|OUTDONE — Legendary|OUTCOMES — Living Beyond the Studio)\n/gm, 
      '<strong style="font-size: 1.25em; color: #00BFFF; display: block; margin-top: 20px; margin-bottom: 6px; font-weight: 900; letter-spacing: 0.5px;">$1</strong>')
    .replace(/\n/g, '<br>')
}

// Audio functionality for gallery
const isSpeakingDetails = ref(false)
const isSpeakingMyth = ref(false)
const isSpeakingAncestral = ref(false)
const audioProgressDetails = ref(0)
const audioProgressMyth = ref(0)
const audioProgressAncestral = ref(0)
let speechSynthesis = null
let currentUtterance = null
let progressInterval = null

// Generic speak function for gallery
const createGallerySpeakFunction = (speakingRef, progressRef, getTextFn) => {
  return () => {
    if (process.client) {
      speechSynthesis = window.speechSynthesis
      
      if (speakingRef.value) {
        speechSynthesis.cancel()
        speakingRef.value = false
        progressRef.value = 0
        if (progressInterval) clearInterval(progressInterval)
        return
      }
      
      const text = getTextFn()
      currentUtterance = new SpeechSynthesisUtterance(text)
      
      // Wait for voices to load
      const setVoice = () => {
        const voices = speechSynthesis.getVoices()
        
        // Try multiple strategies to get a female voice
        let selectedVoice = voices.find(v => v.name.includes('Zira')) ||
                           voices.find(v => v.name.toLowerCase().includes('female')) ||
                           voices.find(v => !v.name.toLowerCase().includes('male') && v.lang.startsWith('en'))
        
        if (selectedVoice) {
          currentUtterance.voice = selectedVoice
        }
        
        currentUtterance.rate = 0.75
        currentUtterance.pitch = 0.6
        currentUtterance.volume = 1.0
        
        const estimatedDuration = (text.length / 15) * 1000 / currentUtterance.rate
        
        currentUtterance.onstart = () => {
          speakingRef.value = true
          progressRef.value = 0
          const startTime = Date.now()
          progressInterval = setInterval(() => {
            const elapsed = Date.now() - startTime
            const progress = Math.min((elapsed / estimatedDuration) * 100, 99)
            progressRef.value = progress
          }, 100)
        }
        
        currentUtterance.onend = () => {
          speakingRef.value = false
          progressRef.value = 100
          if (progressInterval) clearInterval(progressInterval)
          setTimeout(() => { progressRef.value = 0 }, 500)
        }
        
        currentUtterance.onerror = () => {
          speakingRef.value = false
          progressRef.value = 0
          if (progressInterval) clearInterval(progressInterval)
        }
        
        speechSynthesis.speak(currentUtterance)
      }
      
      // Ensure voices are loaded
      if (speechSynthesis.getVoices().length > 0) {
        setVoice()
      } else {
        speechSynthesis.onvoiceschanged = setVoice
      }
    }
  }
}

// Speak functions for each tab
const speakDetails = createGallerySpeakFunction(
  isSpeakingDetails, 
  audioProgressDetails, 
  () => galleryItems[currentIndex.value].details
)

const speakMyth = createGallerySpeakFunction(
  isSpeakingMyth, 
  audioProgressMyth, 
  () => galleryItems[currentIndex.value].myth
)

const speakAncestral = createGallerySpeakFunction(
  isSpeakingAncestral, 
  audioProgressAncestral, 
  () => galleryItems[currentIndex.value].ancestralAddress + ' ' + galleryItems[currentIndex.value].studioInfo
)
// Scroll Progress Bar
if (typeof window !== 'undefined') {
  window.addEventListener('scroll', () => {
    const scrollProgress = document.querySelector('.scroll-progress-bar')
    if (scrollProgress) {
      const scrollTop = window.pageYOffset || document.documentElement.scrollTop
      const scrollHeight = document.documentElement.scrollHeight - document.documentElement.clientHeight
      const scrollPercent = (scrollTop / scrollHeight) * 100
      scrollProgress.style.width = scrollPercent + '%'
    }
  })
  
  // Custom Cursor Trail
  const cursorTrail = []
  const trailLength = 8
  
  for (let i = 0; i < trailLength; i++) {
    const trail = document.createElement('div')
    trail.className = 'cursor-trail'
    trail.style.opacity = (1 - i / trailLength) * 0.6
    trail.style.transform = `scale(${1 - i / trailLength})`
    document.body.appendChild(trail)
    cursorTrail.push(trail)
  }
  
  let mouseX = 0
  let mouseY = 0
  
  document.addEventListener('mousemove', (e) => {
    mouseX = e.clientX
    mouseY = e.clientY
  })
  
  function animateCursor() {
    let x = mouseX
    let y = mouseY
    
    cursorTrail.forEach((trail, index) => {
      const nextTrail = cursorTrail[index + 1] || cursorTrail[0]
      
      trail.style.left = x - 4 + 'px'
      trail.style.top = y - 4 + 'px'
      
      x += (parseInt(nextTrail.style.left) || x) * 0.1
      y += (parseInt(nextTrail.style.top) || y) * 0.1
    })
    
    requestAnimationFrame(animateCursor)
  }
  
  animateCursor()
}

</script>

<style scoped>
/* ========== LIGHTBOX ANIMATIONS ========== */
.lightbox-fade-in {
  animation: fadeIn 0.3s ease-out;
}

@keyframes fadeIn {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
}

.nav-arrow {
  transition: all 0.3s ease;
}

.nav-arrow:hover {
  transform: translateY(-50%) scale(1.1);
}

.nav-arrow:active {
  transform: translateY(-50%) scale(0.95);
}

@keyframes glitter {
  0%, 100% {
    opacity: 0.3;
    transform: scale(1);
  }
  50% {
    opacity: 1;
    transform: scale(1.2);
  }
}

/* ========== SOCIAL SHARE BUTTONS ========== */
.social-share-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  border-radius: 50%;
  color: white;
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
}

.social-share-btn:hover {
  transform: translateY(-3px) scale(1.1);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4);
}

.social-share-btn:active {
  transform: translateY(-1px) scale(1.05);
}

/* ========== SCROLL PROGRESS BAR ========== */
.scroll-progress-bar {
  position: fixed;
  top: 0;
  left: 0;
  height: 4px;
  background: linear-gradient(90deg, #8B0000, #FFD700, #8B0000);
  width: 0%;
  z-index: 9999;
  transition: width 0.1s ease-out;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
}

/* ========== CUSTOM CURSOR TRAIL ========== */
.cursor-trail {
  position: fixed;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.8), rgba(255, 215, 0, 0.3));
  pointer-events: none;
  z-index: 9998;
  transition: opacity 0.3s ease;
}

/* ========== ZOOM CURSOR ========== */
.cursor-zoom-in {
  cursor: zoom-in;
}

.cursor-zoom-out {
  cursor: zoom-out;
}

/* ========== MICRO-ANIMATIONS ========== */
button, a, .sculpture-item {
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

button:hover, a:hover {
  transform: translateY(-2px);
}

button:active, a:active {
  transform: translateY(0px) scale(0.98);
}

/* Tab buttons pulse */
button:hover {
  animation: buttonPulse 0.6s ease-in-out;
}

@keyframes buttonPulse {
  0%, 100% {
    box-shadow: 0 0 0 0 rgba(139, 0, 0, 0.7);
  }
  50% {
    box-shadow: 0 0 0 10px rgba(139, 0, 0, 0);
  }
}

/* ========== SMOOTH SCROLL ========== */
html {
  scroll-behavior: smooth;
}

/* ========== 3D TILT EFFECT ========== */
.sculpture-tilt {
  transform-style: preserve-3d;
  transition: transform 0.1s ease-out;
  will-change: transform;
}

.sculpture-3d {
  perspective: 1000px;
}

/* ========== LUXURY HOVER EFFECTS ========== */
.sculpture-frame {
  border: 2px solid transparent;
  border-radius: 4px;
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
  position: relative;
}

.sculpture-item:hover .sculpture-frame {
  border-color: rgba(139, 0, 0, 0.7);
  box-shadow: 
    0 10px 40px rgba(0, 0, 0, 0.3);
}

/* ========== 3D TILT & ZOOM EFFECT ========== */
.sculpture-3d {
  perspective: 1000px;
  transform-style: preserve-3d;
}

.sculpture-tilt {
  transition: transform 0.3s ease-out, box-shadow 0.3s ease-out;
  will-change: transform;
}

.sculpture-3d:hover .sculpture-tilt {
  transform: scale(1.05);
  box-shadow: 
    0 20px 60px rgba(0, 0, 0, 0.4),
    0 0 30px rgba(255, 215, 0, 0.2);
}

/* Enhanced zoom on image inside */
.sculpture-3d:hover img {
  transform: scale(1.15);
}

/* Smooth tilt animation */
.sculpture-tilt.tilting {
  transition: transform 0.1s ease-out;
}

/* ========== FADE-IN ANIMATIONS ========== */
.sculpture-item {
  opacity: 0;
  transform: translateY(40px);
  animation: luxuryFadeIn 1s cubic-bezier(0.4, 0, 0.2, 1) forwards;
}

.sculpture-item:nth-child(2) {
  animation-delay: 0.15s;
}

.sculpture-item:nth-child(3) {
  animation-delay: 0.3s;
}

.sculpture-item:nth-child(4) {
  animation-delay: 0.45s;
}

@keyframes luxuryFadeIn {
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

/* ========== ELEGANT TYPOGRAPHY ========== */
.sculpture-title {
  color: #8B0000;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
  position: relative;
  padding-bottom: 10px;
  transition: all 0.3s ease;
}

/* ========== NEW DECORATIVE SCULPTURE TITLES ========== */
.sculpture-title-container {
  padding: 12px 0;
}

.sculpture-title-decorative {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  animation: titleFloat 3s ease-in-out infinite;
}

.sculpture-title-elegant {
  font-family: 'Bradley Hand ITC', cursive;
  color: #FFFFFF;
  text-shadow: 
    0 0 10px rgba(255, 215, 0, 0.6),
    0 0 20px rgba(255, 215, 0, 0.4),
    2px 2px 4px rgba(0, 0, 0, 0.8);
  position: relative;
  padding: 10px 20px;
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.1), rgba(139, 0, 0, 0.2));
  border-radius: 8px;
  border: 2px solid rgba(255, 215, 0, 0.3);
  backdrop-filter: blur(5px);
  transition: all 0.3s ease;
  text-align: center;
}

.sculpture-number {
  font-size: 16px;
  font-weight: 700;
  letter-spacing: 1.5px;
  color: #FFD700;
  margin-bottom: 2px;
}

.sculpture-name {
  font-size: 18px;
  font-weight: 700;
  letter-spacing: 1px;
  color: #FFFFFF;
}

.sculpture-title-elegant:hover {
  transform: scale(1.05);
  text-shadow: 
    0 0 15px rgba(255, 215, 0, 0.8),
    0 0 25px rgba(255, 215, 0, 0.6),
    2px 2px 6px rgba(0, 0, 0, 0.9);
  border-color: rgba(255, 215, 0, 0.6);
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.2), rgba(139, 0, 0, 0.3));
}

.title-ornament-left,
.title-ornament-right {
  color: #FFD700;
  font-size: 22px;
  animation: ornamentTwinkle 2s ease-in-out infinite;
  filter: drop-shadow(0 0 8px rgba(255, 215, 0, 0.8));
}

.title-ornament-left {
  animation-delay: 0s;
}

.title-ornament-right {
  animation-delay: 1s;
}

@keyframes titleFloat {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-3px);
  }
}

@keyframes ornamentTwinkle {
  0%, 100% {
    opacity: 0.6;
    transform: scale(1) rotate(0deg);
  }
  50% {
    opacity: 1;
    transform: scale(1.2) rotate(180deg);
  }
}

.title-underline {
  display: block;
  width: 80px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #FFD700, #8B0000, #FFD700, transparent);
  margin: 8px auto 0;
  opacity: 0;
  transform: scaleX(0);
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.sculpture-item:hover .title-underline {
  opacity: 1;
  transform: scaleX(1);
}

.sculpture-item:hover .sculpture-title {
  transform: translateY(-2px);
  letter-spacing: 1.5px;
}

/* ========== LUXURY BACKGROUND - NAVY BLUE (NO GRID) ========== */
body {
  background-color: #1a3a52;
}

/* ========== CUSTOM CURSOR TRAIL ========== */
.cursor-trail {
  position: fixed;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.8), transparent);
  pointer-events: none;
  z-index: 9999;
  animation: cursorPulse 1s ease-out infinite;
}

@keyframes cursorPulse {
  0%, 100% {
    transform: scale(1);
    opacity: 0.6;
  }
  50% {
    transform: scale(1.5);
    opacity: 0.3;
  }
}

/* ========== SMOOTH PAGE TRANSITIONS ========== */
.page-enter-active,
.page-leave-active {
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.page-enter-from {
  opacity: 0;
  transform: translateY(20px);
}

.page-leave-to {
  opacity: 0;
  transform: translateY(-20px);
}

/* ========== PARALLAX SCROLL EFFECT ========== */
.parallax-layer {
  transition: transform 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.sculpture-title-glitter {
  color: #8B0000;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.3);
}

/* ========== GALLERY AUDIO VISUALIZATION (SMALLER SIZE) ========== */

/* Circular Progress Ring - Small */
.circular-progress-small {
  transform: rotate(-90deg);
}

.progress-bg-small {
  fill: none;
  stroke: rgba(255, 215, 0, 0.2);
  stroke-width: 3;
}

.progress-ring-small {
  fill: none;
  stroke: #FFD700;
  stroke-width: 3;
  stroke-linecap: round;
  stroke-dasharray: 163;
  stroke-dashoffset: 163;
  transition: stroke-dashoffset 0.1s linear;
  filter: drop-shadow(0 0 6px rgba(255, 215, 0, 0.8));
}

/* Listen Button Inside Ring - Tiny */
.listen-button-tiny {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.8), rgba(255, 215, 0, 0.3));
  border: 2px solid #FFD700;
  border-radius: 50%;
  width: 38px;
  height: 38px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 18px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 3px 12px rgba(255, 215, 0, 0.3);
  flex-shrink: 0;
}

.listen-button-tiny:hover {
  transform: translate(-50%, -50%) scale(1.1);
  box-shadow: 0 5px 18px rgba(255, 215, 0, 0.5);
}

.listen-button-tiny.speaking {
  animation: pulseTiny 1s ease-in-out infinite;
}

/* Waveform Below Ring - Tiny */
.waveform-container-tiny {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 2px;
  height: 20px;
}

.wave-bar-tiny {
  width: 2px;
  background: linear-gradient(180deg, #FFD700, #FFA500);
  border-radius: 1px;
  animation: waveAnimationTiny 0.8s ease-in-out infinite;
  box-shadow: 0 0 4px rgba(255, 215, 0, 0.6);
}

@keyframes waveAnimationTiny {
  0%, 100% { height: 6px; }
  50% { height: 18px; }
}

@keyframes pulseTiny {
  0%, 100% {
    transform: translate(-50%, -50%) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) scale(1.05);
  }
}

/* ========== PRINT STYLES ========== */
@media print {
  @page { 
    margin: 0; 
    size: A4 portrait; 
  }
  
  * {
    -webkit-print-color-adjust: exact !important;
    print-color-adjust: exact !important;
  }
  
  body, html { 
    background: white !important; 
    margin: 0 !important;
    padding: 0 !important;
  }
  
  /* HIDE EVERYTHING FIRST */
  body > * {
    display: none !important;
  }
  
  /* Show only the main container */
  .container {
    display: block !important;
    margin: 0 !important;
    padding: 0 !important;
    max-width: 100% !important;
  }
  
  /* Show only the grid */
  .grid {
    display: block !important;
    margin: 0 !important;
    padding: 0 !important;
  }
  
  /* HIDE ALL GRID CHILDREN BY DEFAULT */
  .grid > * {
    display: none !important;
  }
  
  /* SHOW ONLY SCULPTURE ITEMS */
  .grid > .sculpture-item {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: center !important;
    page-break-before: always !important;
    page-break-after: always !important;
    page-break-inside: avoid !important;
    width: 100vw !important;
    height: 100vh !important;
    margin: 0 !important;
    padding: 2cm 1.5cm !important;
    background: white !important;
    box-sizing: border-box !important;
  }
  
  /* First sculpture no page break before */
  .grid > .sculpture-item:first-of-type {
    page-break-before: auto !important;
  }
  
  /* Last sculpture no page break after */
  .grid > .sculpture-item:nth-of-type(3) {
    page-break-after: auto !important;
  }
  
  /* Sculpture frame takes most space */
  .sculpture-item .sculpture-frame {
    flex: 1 !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    width: 100% !important;
    margin-bottom: 1cm !important;
  }
  
  /* Images fill available space */
  .sculpture-item img {
    display: block !important;
    max-width: 100% !important;
    max-height: 70vh !important;
    width: auto !important;
    height: auto !important;
    object-fit: contain !important;
    filter: brightness(1.3) contrast(1.2) saturate(1.4) !important;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4) !important;
    border: 6px solid #FFD700 !important;
    border-radius: 15px !important;
  }
  
  /* Hide hover overlays */
  .sculpture-item .absolute {
    display: none !important;
  }
  
  /* Name at bottom */
  .sculpture-item > div:last-child {
    width: 100% !important;
    margin: 0 !important;
  }
  
  /* Sculpture names prominent */
  .sculpture-item h3 {
    display: block !important;
    color: #000000 !important;
    font-size: 32px !important;
    font-weight: bold !important;
    text-align: center !important;
    margin: 0 auto !important;
    padding: 20px 40px !important;
    background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%) !important;
    border-radius: 12px !important;
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.3) !important;
    width: fit-content !important;
  }
}
</style>

