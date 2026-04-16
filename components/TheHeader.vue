<template>
  <header 
    class="fixed top-0 w-full z-50 transition-all duration-500 bg-[#0A4D68]"
    :class="{ 
      'shadow-lg py-1 md:py-1': isScrolled, 
      'py-2 md:py-2': !isScrolled
    }"
    style="margin-top: 8px;"
  >
    <nav class="flex justify-start items-center px-8">
      <!-- Desktop Menu on Left (in black area) - Uniform White Color -->
      <div class="hidden md:flex items-center space-x-2 text-white tracking-wide" style="margin-left: 20px; font-family: 'Bradley Hand ITC', cursive; font-size: 15px; font-weight: 900;">
        <NuxtLink to="/" class="nav-uniform" active-class="nav-active-bright">
          Portico
        </NuxtLink>
        <NuxtLink to="/gallery" class="nav-uniform" active-class="nav-active-bright">
          Walk Through The Gallery
        </NuxtLink>
        <NuxtLink to="/studio" class="nav-uniform" active-class="nav-active-bright">
          Virtual Studio Tour
        </NuxtLink>
        <NuxtLink to="/about" class="nav-uniform" active-class="nav-active-bright">
          Meet The Artist
        </NuxtLink>
        <NuxtLink to="/awards" class="nav-uniform" active-class="nav-active-bright">
          Awards & Recognitions
        </NuxtLink>
        <NuxtLink to="/contact" class="nav-uniform" active-class="nav-active-bright">
          Get In Touch
        </NuxtLink>
        <button @click="openTestimonials" class="nav-uniform nav-special">
          Share Your Thoughts
        </button>
      </div>

      <!-- Mobile Menu Button -->
      <button 
        @click="mobileMenuOpen = !mobileMenuOpen" 
        class="md:hidden text-artilora-ivory p-2 hover:text-artilora-green transition-colors"
        :aria-label="mobileMenuOpen ? 'Close menu' : 'Open menu'"
      >
        <svg v-if="!mobileMenuOpen" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-7 h-7">
          <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
        </svg>
        <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="w-7 h-7">
          <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>
    </nav>

    <!-- Mobile Menu -->
    <Transition name="mobile-menu">
      <div 
        v-if="mobileMenuOpen" 
        class="md:hidden bg-[#0A4D68] absolute top-full left-0 w-full border-t border-artilora-green/20"
      >
        <nav class="container mx-auto px-4 py-6 flex flex-col space-y-4 text-white" style="font-family: 'Bradley Hand ITC', cursive;">
          <NuxtLink 
            to="/" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Portico
          </NuxtLink>
          <NuxtLink 
            to="/gallery" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Walk Through The Gallery
          </NuxtLink>
          <NuxtLink 
            to="/studio" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Virtual Studio Tour
          </NuxtLink>
          <NuxtLink 
            to="/about" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Meet The Artist
          </NuxtLink>
          <NuxtLink 
            to="/awards" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Awards & Recognitions
          </NuxtLink>
          <NuxtLink 
            to="/contact" 
            @click="mobileMenuOpen = false"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg"
            active-class="bg-white/30 font-bold"
          >
            Get In Touch
          </NuxtLink>
          <button 
            @click="openTestimonials"
            class="py-3 px-4 hover:bg-white/20 rounded transition-colors text-lg text-left"
          >
            Share Your Thoughts
          </button>
        </nav>
      </div>
    </Transition>
  </header>
</template>

<script setup>
const isScrolled = ref(false)
const mobileMenuOpen = ref(false)

const handleScroll = () => {
  isScrolled.value = window.scrollY > 50
}

const openTestimonials = () => {
  mobileMenuOpen.value = false
  // Emit event to open testimonials panel
  if (process.client) {
    window.dispatchEvent(new CustomEvent('open-testimonials'))
  }
}

// Close mobile menu when route changes
const route = useRoute()
watch(() => route.path, () => {
  mobileMenuOpen.value = false
})

onMounted(() => {
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})
</script>

<style scoped>
.logo-spotlight {
  filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.3));
}

/* Uniform Navigation Styles - All Same Color */
.nav-uniform {
  position: relative;
  display: inline-block;
  padding: 6px 12px;
  border-radius: 8px;
  font-weight: 900;
  transition: all 0.3s ease;
  color: #FFFFFF;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
  border: 2px solid transparent;
  background: none;
  cursor: pointer;
  white-space: nowrap;
}

/* Special styling for Share Your Thoughts button - uses same hover as other items */
.nav-special {
  /* Inherits all styles from .nav-uniform */
}

.nav-uniform::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 3px;
  background: linear-gradient(90deg, transparent, #FFFFFF, transparent);
  transition: width 0.3s ease;
}

.nav-uniform:hover {
  background-color: rgba(255, 255, 255, 0.1);
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(255, 255, 255, 0.2);
}

.nav-uniform:hover::after {
  width: 80%;
}

/* Active State - Elegant Underline with Glow and Glitter */
.nav-active-bright {
  background-color: rgba(255, 255, 255, 0.15) !important;
  border-color: rgba(255, 255, 255, 0.3) !important;
  box-shadow: 0 4px 15px rgba(255, 255, 255, 0.4) !important;
  transform: translateY(-1px);
  color: #FFFFFF !important;
  text-shadow: 0 0 8px rgba(255, 255, 255, 0.6), 2px 2px 4px rgba(0, 0, 0, 0.5) !important;
  animation: glitterText 2s ease-in-out infinite;
  position: relative;
  overflow: hidden;
}

.nav-active-bright::before {
  content: '';
  position: absolute;
  top: -50%;
  left: -50%;
  width: 200%;
  height: 200%;
  background: linear-gradient(
    45deg,
    transparent 30%,
    rgba(255, 255, 255, 0.3) 50%,
    transparent 70%
  );
  animation: glitterMove 3s linear infinite;
}

.nav-active-bright::after {
  width: 90% !important;
  height: 3px !important;
  background: linear-gradient(90deg, transparent, #FFFFFF, transparent) !important;
  box-shadow: 0 0 10px rgba(255, 255, 255, 0.8) !important;
  animation: underlineGlow 2s ease-in-out infinite;
}

@keyframes glitterText {
  0%, 100% {
    text-shadow: 
      0 0 8px rgba(255, 255, 255, 0.6), 
      2px 2px 4px rgba(0, 0, 0, 0.5),
      0 0 15px rgba(255, 255, 255, 0.4);
  }
  50% {
    text-shadow: 
      0 0 15px rgba(255, 255, 255, 1), 
      2px 2px 4px rgba(0, 0, 0, 0.5),
      0 0 25px rgba(255, 255, 255, 0.6),
      0 0 35px rgba(255, 255, 255, 0.4);
  }
}

@keyframes glitterMove {
  0% {
    transform: translate(-50%, -50%) rotate(0deg);
  }
  100% {
    transform: translate(50%, 50%) rotate(360deg);
  }
}

@keyframes underlineGlow {
  0%, 100% {
    opacity: 1;
    box-shadow: 0 0 10px rgba(255, 255, 255, 0.8);
  }
  50% {
    opacity: 0.7;
    box-shadow: 0 0 20px rgba(255, 255, 255, 1);
  }
}

/* Mobile menu transitions */
.mobile-menu-enter-active,
.mobile-menu-leave-active {
  transition: all 0.3s ease;
}

.mobile-menu-enter-from {
  opacity: 0;
  transform: translateY(-10px);
}

.mobile-menu-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

/* Trophy Float Animation */
</style>
