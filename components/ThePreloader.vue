<template>
  <Transition name="fade">
    <!-- Click to Start Screen -->
    <div
      v-if="showClickToStart"
      @click="handleStart"
      @pointerup="handleStart"
      @touchend.prevent="handleStart"
      @keydown.enter.prevent="handleStart"
      @keydown.space.prevent="handleStart"
      class="fixed inset-0 z-[101] bg-black flex flex-col items-center justify-center cursor-pointer"
      style="background-color: #000000; user-select: none; -webkit-user-select: none; touch-action: manipulation;"
      role="button"
      tabindex="0"
      aria-label="Enter Artilora"
    >
      <!-- Preload Comfortaa font -->
      <link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap" rel="stylesheet">
      
      <!-- Animated Golden Lines -->
      <div class="absolute inset-0 flex items-center justify-center pointer-events-none overflow-hidden">
        <div class="golden-line line-top-1"></div>
        <div class="golden-line line-top-2"></div>
      </div>
      
      <div class="text-center relative z-10 pointer-events-none">
        <p class="text-2xl md:text-4xl text-gold animate-pulse mb-2" style="font-family: 'Bradley Hand ITC', cursive; color: #87CEFA;">
          Click to proceed
        </p>
        <p class="text-2xl md:text-4xl text-gold animate-pulse" style="font-family: 'Bradley Hand ITC', cursive; color: #87CEFA; margin-left: 120px;">
          where Artilora awaits you
        </p>
      </div>
    </div>
    
    <div v-else-if="showPreloader" class="fixed inset-0 z-[100] bg-black flex flex-col items-center justify-end pb-32 overflow-hidden transition-opacity duration-1000" :class="{ 'opacity-0': !isLoading }" style="background-color: #000000;">
      
      <!-- Logo Top Left -->
      <div class="absolute top-8 left-8 md:top-12 md:left-12 opacity-0 animate-fade-in-down z-30">
        <img src="/arty_logo_latest.png?v=2026" alt="Artilora" class="h-48 w-auto" />
      </div>

      <!-- Elegant Corner Decorations -->
      <div class="corner-decoration top-left"></div>
      <div class="corner-decoration top-right"></div>
      <div class="corner-decoration bottom-left"></div>
      <div class="corner-decoration bottom-right"></div>

      <!-- FULL SCREEN Impact Flash -->
      <div class="impact-flash-fullscreen"></div>

      <!-- Screen shake container -->
      <div class="screen-shake">
        <!-- Center Text -->
        <div class="text-center px-6 max-w-5xl mx-auto w-full relative z-10 flex flex-col items-center justify-center min-h-screen">
          
          <!-- ARTILORA - Using image - simple fade in center -->
          <div class="w-full flex justify-center items-center opacity-0 animate-fade-in-center">
            <img src="/Artilora_name.png" alt="ARTILORA" class="h-[38rem] md:h-[44rem] w-auto object-contain py-4" style="filter: drop-shadow(0 8px 16px rgba(0, 0, 0, 0.9));" />
          </div>
          
          <!-- Sculpted By Nature - Each letter separately - simple fade -->
          <div class="flex justify-center items-center flex-wrap sculpted-letters -mt-80" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">
            <span class="letter-sm letter-s1-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">S</span>
            <span class="letter-sm letter-c-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">c</span>
            <span class="letter-sm letter-u-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">u</span>
            <span class="letter-sm letter-l2-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">l</span>
            <span class="letter-sm letter-p-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">p</span>
            <span class="letter-sm letter-t2-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">t</span>
            <span class="letter-sm letter-e-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">e</span>
            <span class="letter-sm letter-d-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">d</span>
            <span class="letter-sm letter-space-fade">&nbsp;</span>
            <span class="letter-sm letter-b-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">B</span>
            <span class="letter-sm letter-y-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">y</span>
            <span class="letter-sm letter-space2-fade">&nbsp;</span>
            <span class="letter-sm letter-n-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">N</span>
            <span class="letter-sm letter-a3-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">a</span>
            <span class="letter-sm letter-t3-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">t</span>
            <span class="letter-sm letter-u2-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">u</span>
            <span class="letter-sm letter-r3-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">r</span>
            <span class="letter-sm letter-e2-fade" style="font-family: 'Bradley Hand ITC', sans-serif; font-style: normal;">e</span>
          </div>
        </div>
      </div>

      <!-- Counter Bottom Right -->
      <div class="absolute bottom-8 right-8 md:bottom-12 md:right-12 font-sans text-6xl md:text-8xl text-white/90 font-bold tracking-tighter z-20">
        <span class="counter-text">{{ count }}</span>
      </div>
    </div>
  </Transition>
</template>

<script setup>
const isLoading = useState('isLoading', () => true)
const showPreloader = ref(false)
const showClickToStart = ref(true)
const count = ref(0)
const hasStarted = ref(false)
let boomAudio = null
let progressTimer = null
let autoStartTimer = null

if (typeof window !== 'undefined') {
  boomAudio = new Audio('/boom.mp3')
  boomAudio.volume = 1.0
  boomAudio.load()
}

const playBoomSound = () => {
  if (boomAudio) {
    boomAudio.currentTime = 0
    boomAudio.play().catch(e => console.log('Audio play failed:', e))
  }
}

const startAnimation = () => {
  if (hasStarted.value) return
  hasStarted.value = true

  showClickToStart.value = false
  showPreloader.value = true
  
  if (typeof document !== 'undefined') {
    document.body.style.overflow = 'hidden'
  }

  // Play boom sound when text appears
  setTimeout(() => {
    playBoomSound()
  }, 2000)

  // Reduced duration to 3 seconds to match animation completion
  const duration = 3000
  const interval = 20
  const steps = duration / interval
  const increment = 100 / steps
  
  let currentProgress = 0

  progressTimer = setInterval(() => {
    currentProgress += increment
    if (currentProgress >= 100) {
      count.value = 100
      clearInterval(progressTimer)
      progressTimer = null
      isLoading.value = false
      setTimeout(() => {
        showPreloader.value = false
        if (typeof document !== 'undefined') {
          document.body.style.overflow = ''
        }
      }, 300)
    } else {
      count.value = Math.round(currentProgress)
    }
  }, interval)
}

const handleStart = () => {
  startAnimation()
}

onMounted(() => {
  // Fallback: if interaction is missed on first paint, auto-start after a short delay.
  autoStartTimer = setTimeout(() => {
    if (showClickToStart.value) {
      startAnimation()
    }
  }, 4000)
})

onUnmounted(() => {
  if (autoStartTimer) {
    clearTimeout(autoStartTimer)
    autoStartTimer = null
  }

  if (progressTimer) {
    clearInterval(progressTimer)
    progressTimer = null
  }

  if (typeof document !== 'undefined') {
    document.body.style.overflow = ''
  }
})
</script>

<style scoped>
/* Load Comfortaa font directly */
@font-face {
  font-family: 'ComfortaaLocal';
  font-style: normal;
  font-weight: 400;
  font-display: swap;
  src: url('https://fonts.gstatic.com/s/comfortaa/v45/1Pt_g8LJRfWJmhDAuUsSQamb1W0lwk4S4TjMPrQVIT9c2c8.woff2') format('woff2');
}

@font-face {
  font-family: 'ComfortaaLocal';
  font-style: normal;
  font-weight: 700;
  font-display: swap;
  src: url('https://fonts.gstatic.com/s/comfortaa/v45/1Pt_g8LJRfWJmhDAuUsSQamb1W0lwk4S4WjNPrQVIT9c2c8.woff2') format('woff2');
}

/* Comfortaa font loaded */

/* Animated Golden Lines */
.golden-line {
  position: absolute;
  background: linear-gradient(90deg, transparent, #FFD700, transparent);
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.5);
}

/* Horizontal lines above text */
.line-top-1 {
  top: 35%;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 2px;
  animation: lineDrawHorizontal 2s ease-out 0s forwards;
}

.line-top-2 {
  top: 38%;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 1px;
  animation: lineDrawHorizontal 2s ease-out 0.3s forwards;
}

/* Horizontal lines below text */
.line-bottom-1 {
  bottom: 35%;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 2px;
  animation: lineDrawHorizontal 2s ease-out 0.6s forwards;
}

.line-bottom-2 {
  bottom: 38%;
  left: 50%;
  transform: translateX(-50%);
  width: 0;
  height: 1px;
  animation: lineDrawHorizontal 2s ease-out 0.9s forwards;
}

@keyframes lineDrawHorizontal {
  0% {
    width: 0;
    opacity: 0;
  }
  10% {
    opacity: 1;
  }
  100% {
    width: 400px;
    opacity: 0.8;
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s ease-in-out;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

.animate-fade-in-down {
  animation: fadeInDown 1s ease-out forwards;
}

@keyframes fadeInDown {
  from { opacity: 0; transform: translateY(-20px); }
  to { opacity: 1; transform: translateY(0); }
}

.counter-text {
  font-variant-numeric: tabular-nums;
}

/* Screen shake - REMOVED */
.screen-shake {
  /* No shake animation */
}

@keyframes screenShake {
  0%, 100% { transform: translate(0, 0); }
  10% { transform: translate(-25px, -20px); }
  20% { transform: translate(25px, 20px); }
  30% { transform: translate(-20px, 15px); }
  40% { transform: translate(20px, -15px); }
  50% { transform: translate(-15px, 10px); }
  60% { transform: translate(15px, -10px); }
  70% { transform: translate(-10px, 5px); }
  80% { transform: translate(10px, -5px); }
  90% { transform: translate(-5px, 2px); }
}

/* ARTILORA Image animation - simple, no glow - CURRENT STYLE */
.animate-from-logo-artilora-simple {
  animation: fromLogoSimple 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

/* ARTILORA Image animation - simple and SLOWER with gentle spin */
.animate-from-logo-artilora-simple-slow {
  animation: fromLogoSimpleSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

/* STYLE 1: Current - gentle 10° tilt */
@keyframes fromLogoSimple {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-10deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* Gentle spin version - 180° slow rotation */
@keyframes fromLogoSimpleSpin {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-180deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 2: Full 360° spin - one complete rotation */
.animate-from-logo-artilora-spin360 {
  animation: fromLogoSpin360 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoSpin360 {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-360deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 3: Flip horizontal - like a card flip */
.animate-from-logo-artilora-flip {
  animation: fromLogoFlip 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoFlip {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotateY(180deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotateY(0deg) scale(1);
  }
}

/* STYLE 4: Spiral - 720° double spin */
.animate-from-logo-artilora-spiral {
  animation: fromLogoSpiral 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoSpiral {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-720deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 5: Tumble - 3D rotation */
.animate-from-logo-artilora-tumble {
  animation: fromLogoTumble 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoTumble {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-180deg) rotateX(180deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) rotateX(0deg) scale(1);
  }
}

/* STYLE 6: Triple spin - 1080° (3 full rotations) */
.animate-from-logo-artilora-triple {
  animation: fromLogoTriple 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoTriple {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-1080deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 7: Mega spin - 1440° (4 full rotations) */
.animate-from-logo-artilora-mega {
  animation: fromLogoMega 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoMega {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-1440deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 8: Ultra spin - 1800° (5 full rotations) */
.animate-from-logo-artilora-ultra {
  animation: fromLogoUltra 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoUltra {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-1800deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* STYLE 9: Bounce arrival - bounces as it comes */
.animate-from-logo-artilora-bounce {
  animation: fromLogoBounce 2.5s cubic-bezier(0.68, -0.55, 0.265, 1.55) forwards;
}

@keyframes fromLogoBounce {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) scale(1);
  }
}

/* STYLE 10: Elastic arrival - stretches and bounces */
.animate-from-logo-artilora-elastic {
  animation: fromLogoElastic 2.5s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
}

@keyframes fromLogoElastic {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) scaleX(0.1) scaleY(0.1);
  }
  50% {
    transform: translate(-22.5vw, -22.5vh) scaleX(1.2) scaleY(0.8);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) scaleX(1) scaleY(1);
  }
}

/* STYLE 11: Zoom in - fast zoom from small to big */
.animate-from-logo-artilora-zoom {
  animation: fromLogoZoom 2.5s ease-out forwards;
}

@keyframes fromLogoZoom {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) scale(0.05);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) scale(1);
  }
}

/* STYLE 12: Slide and fade - smooth slide from left */
.animate-from-logo-artilora-slide {
  animation: fromLogoSlide 2.5s ease-out forwards;
}

@keyframes fromLogoSlide {
  0% {
    opacity: 0;
    transform: translate(-45vw, 0) scale(0.5);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) scale(1);
  }
}

/* STYLE 13: Spiral zoom - spinning while zooming */
.animate-from-logo-artilora-spiralzoom {
  animation: fromLogoSpiralZoom 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards;
}

@keyframes fromLogoSpiralZoom {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-720deg) scale(0.05);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* ARTILORA Image animation - from logo with 10° spin */
.animate-from-logo-artilora {
  animation: fromLogoArtilora 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) forwards, glowPulseImg 2s ease-in-out 3s infinite;
}

@keyframes fromLogoArtilora {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-10deg) scale(0.1);
    filter: drop-shadow(0 0 30px gold) drop-shadow(0 0 60px white);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
    filter: drop-shadow(0 0 10px gold);
  }
}

@keyframes glowPulseImg {
  0%, 100% { filter: drop-shadow(0 0 10px rgba(139, 0, 0, 0.5)) drop-shadow(0 0 20px rgba(255, 215, 0, 0.3)); }
  50% { filter: drop-shadow(0 0 30px rgba(139, 0, 0, 0.8)) drop-shadow(0 0 50px rgba(255, 215, 0, 0.5)); }
}

/* ARTILORA Letters - Large - Century Gothic (rounded system font) */
.artilora-letters {
  font-size: 8rem;
  font-weight: 700;
  color: #8B0000;
  font-family: 'Century Gothic', sans-serif;
}

.letter {
  display: inline-block;
  opacity: 0;
  font-family: 'Century Gothic', sans-serif;
  filter: drop-shadow(0 0 20px gold) drop-shadow(0 0 40px white);
}

/* Each ARTILORA letter comes one by one - 20° gentle spin */
.letter-a1 { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 0s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-r { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 0.25s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-t { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 0.5s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-i { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 0.75s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-l { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 1s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-o { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 1.25s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-r2 { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 1.5s forwards, glowPulse 2s ease-in-out 5s infinite; }
.letter-a2 { animation: letterFromLogo 2.5s cubic-bezier(0.25, 0.1, 0.25, 1) 1.75s forwards, glowPulse 2s ease-in-out 5s infinite; }

/* Sculpted By Nature Letters - Bigger - Bradley Hand ITC Font - No glow */
.sculpted-letters {
  font-size: 2rem;
  font-family: 'Bradley Hand ITC', sans-serif !important;
  font-weight: 400;
  font-style: normal !important;
  color: #FFD700;
}

.letter-sm {
  display: inline-block;
  opacity: 0;
  font-family: 'Bradley Hand ITC', sans-serif !important;
  font-style: normal !important;
}

/* Each Sculpted By Nature letter - comes after ARTILORA, smooth, no glow - VERY SLOW with spin */
.letter-s1 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2s forwards; }
.letter-c { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.12s forwards; }
.letter-u { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.24s forwards; }
.letter-l2 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.36s forwards; }
.letter-p { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.48s forwards; }
.letter-t2 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.6s forwards; }
.letter-e { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.72s forwards; }
.letter-d { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.84s forwards; }
.letter-space { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 2.96s forwards; }
.letter-b { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.08s forwards; }
.letter-y { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.2s forwards; }
.letter-space2 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.32s forwards; }
.letter-n { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.44s forwards; }
.letter-a3 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.56s forwards; }
.letter-t3 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.68s forwards; }
.letter-u2 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.8s forwards; }
.letter-r3 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 3.92s forwards; }
.letter-e2 { animation: letterFromLogoSmSpin 10s cubic-bezier(0.25, 0.1, 0.25, 1) 4.04s forwards; }

/* Letter animation - simple, no glow */
@keyframes letterFromLogoSmSimple {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(10deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* Letter animation with gentle spin - 180° slow rotation */
@keyframes letterFromLogoSmSpin {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(180deg) scale(0.1);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
  }
}

/* Letter animation from logo - 10° very gentle spin, smooth */
@keyframes letterFromLogo {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(-10deg) scale(0.1);
    filter: drop-shadow(0 0 30px gold) drop-shadow(0 0 60px white);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
    filter: drop-shadow(0 0 10px gold);
  }
}

@keyframes letterFromLogoSm {
  0% {
    opacity: 0;
    transform: translate(-45vw, -45vh) rotate(10deg) scale(0.1);
    filter: drop-shadow(0 0 20px gold) drop-shadow(0 0 40px white);
  }
  100% {
    opacity: 1;
    transform: translate(0, 0) rotate(0deg) scale(1);
    filter: drop-shadow(0 0 5px gold);
  }
}

@keyframes glowPulse {
  0%, 100% { filter: drop-shadow(0 0 10px rgba(139, 0, 0, 0.5)) drop-shadow(0 0 20px rgba(255, 215, 0, 0.3)); }
  50% { filter: drop-shadow(0 0 30px rgba(139, 0, 0, 0.8)) drop-shadow(0 0 50px rgba(255, 215, 0, 0.5)); }
}

@keyframes glowPulseText {
  0%, 100% { text-shadow: 0 0 10px rgba(255, 215, 0, 0.5), 0 0 20px rgba(255, 215, 0, 0.3); }
  50% { text-shadow: 0 0 25px rgba(255, 215, 0, 0.9), 0 0 50px rgba(255, 215, 0, 0.6); }
}

/* Particles from LOGO - More particles throughout the animation with trail */
/* Particles from LOGO - More particles throughout the animation - clear and solid */
/* Particles from LOGO - Root human image */
.particle-logo {
  position: absolute;
  width: 60px;
  height: 60px;
  top: 120px;
  left: 120px;
  opacity: 0;
  z-index: 20;
  background-image: url('/arty_human_transparent.png?v=2026');
  background-size: contain;
  background-repeat: no-repeat;
  background-position: center;
}



/* Only 1 human - directly below "Sculpted By Nature" with spacing */
.p-logo-right { 
  animation: pRiseInPlace 3s ease-out 12s forwards; 
  width: 180px; 
  height: 180px;
  /* Position centered below "Sculpted By Nature" with gap */
  left: calc(50vw - 90px);
  top: calc(58vh);
}

/* Animation for human rising in place - no travel, no spin, just fade and grow */
@keyframes pRiseInPlace {
  0% { 
    opacity: 0; 
    transform: scale(0.3) translateY(20px);
  }
  100% { 
    opacity: 1; 
    transform: scale(1) translateY(0);
  }
}

/* Old animations for humans that STAY - no longer used */
/* Human 1: Left side - more space from text */
@keyframes pFromLogoStayLeft {
  0% { 
    opacity: 1; 
    transform: translate(0, 0) scale(1) rotate(0deg); 
  }
  100% { 
    opacity: 1; 
    transform: translate(calc(26vw - 120px), calc(52vh - 120px)) scale(1) rotate(1080deg); 
  }
}

/* Human 2: Right side - good position */
@keyframes pFromLogoStayRight {
  0% { 
    opacity: 1; 
    transform: translate(0, 0) scale(1) rotate(0deg); 
  }
  100% { 
    opacity: 1; 
    transform: translate(calc(61vw - 120px), calc(52vh - 120px)) scale(1) rotate(1080deg); 
  }
}

/* Animations for humans that DISAPPEAR after arriving */
@keyframes pFromLogoDisappear1 {
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(12vw - 120px), calc(10vh - 120px)) scale(0.8); }
  50% { transform: translate(calc(30vw - 120px), calc(22vh - 120px)) scale(1.5); }
  75% { transform: translate(calc(42vw - 120px), calc(35vh - 120px)) scale(2.2); }
  90% { opacity: 1; transform: translate(calc(50vw - 120px), calc(48vh - 120px)) scale(3); }
  100% { opacity: 0; transform: translate(calc(50vw - 120px), calc(48vh - 120px)) scale(3); }
}

@keyframes pFromLogoDisappear2 {
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(15vw - 120px), calc(15vh - 120px)) scale(0.8); }
  50% { transform: translate(calc(28vw - 120px), calc(28vh - 120px)) scale(1.5); }
  75% { transform: translate(calc(40vw - 120px), calc(38vh - 120px)) scale(2.2); }
  90% { opacity: 1; transform: translate(calc(48vw - 120px), calc(48vh - 120px)) scale(3); }
  100% { opacity: 0; transform: translate(calc(48vw - 120px), calc(48vh - 120px)) scale(3); }
}

@keyframes pFromLogoDisappear3 {
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(18vw - 120px), calc(8vh - 120px)) scale(0.8); }
  50% { transform: translate(calc(35vw - 120px), calc(18vh - 120px)) scale(1.5); }
  75% { transform: translate(calc(45vw - 120px), calc(32vh - 120px)) scale(2.2); }
  90% { opacity: 1; transform: translate(calc(52vw - 120px), calc(48vh - 120px)) scale(3); }
  100% { opacity: 0; transform: translate(calc(52vw - 120px), calc(48vh - 120px)) scale(3); }
}

@keyframes pFromLogoDisappear4 {
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(10vw - 120px), calc(12vh - 120px)) scale(0.8); }
  50% { transform: translate(calc(25vw - 120px), calc(25vh - 120px)) scale(1.5); }
  75% { transform: translate(calc(38vw - 120px), calc(38vh - 120px)) scale(2.2); }
  90% { opacity: 1; transform: translate(calc(47vw - 120px), calc(48vh - 120px)) scale(3); }
  100% { opacity: 0; transform: translate(calc(47vw - 120px), calc(48vh - 120px)) scale(3); }
}

@keyframes pFromLogo1 { 
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(12vw - 120px), calc(10vh - 120px)) scale(0.6); }
  50% { transform: translate(calc(30vw - 120px), calc(22vh - 120px)) scale(1.1); }
  75% { transform: translate(calc(42vw - 120px), calc(35vh - 120px)) scale(1.6); }
  100% { opacity: 1; transform: translate(calc(50vw - 120px), calc(40vh - 120px)) scale(2.5); } 
}
@keyframes pFromLogo2 { 
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(15vw - 120px), calc(15vh - 120px)) scale(0.6); }
  50% { transform: translate(calc(28vw - 120px), calc(28vh - 120px)) scale(1.1); }
  75% { transform: translate(calc(40vw - 120px), calc(38vh - 120px)) scale(1.6); }
  100% { opacity: 1; transform: translate(calc(48vw - 120px), calc(40vh - 120px)) scale(2.5); } 
}
@keyframes pFromLogo3 { 
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(18vw - 120px), calc(8vh - 120px)) scale(0.6); }
  50% { transform: translate(calc(35vw - 120px), calc(18vh - 120px)) scale(1.1); }
  75% { transform: translate(calc(45vw - 120px), calc(32vh - 120px)) scale(1.6); }
  100% { opacity: 1; transform: translate(calc(52vw - 120px), calc(40vh - 120px)) scale(2.5); } 
}
@keyframes pFromLogo4 { 
  0% { opacity: 1; transform: translate(0, 0) scale(0.05); }
  25% { transform: translate(calc(10vw - 120px), calc(12vh - 120px)) scale(0.6); }
  50% { transform: translate(calc(25vw - 120px), calc(25vh - 120px)) scale(1.1); }
  75% { transform: translate(calc(38vw - 120px), calc(38vh - 120px)) scale(1.6); }
  100% { opacity: 1; transform: translate(calc(47vw - 120px), calc(40vh - 120px)) scale(2.5); } 
}

/* Particles for Sculpted By Nature - Round golden particles */
.particle-logo-lower {
  position: absolute;
  width: 45px;
  height: 45px;
  background: gold;
  border-radius: 50%;
  top: 120px;
  left: 120px;
  opacity: 0;
  box-shadow: 0 0 14px 4px rgba(255, 215, 0, 0.5);
  z-index: 20;
}

.p-lower-1 { animation: pFromLogoLower1 11s ease-out 2s forwards; width: 16px; height: 16px; }
.p-lower-2 { animation: pFromLogoLower2 14s ease-out 2.3s forwards; width: 11px; height: 11px; }
.p-lower-3 { animation: pFromLogoLower3 9s ease-out 2.6s forwards; width: 18px; height: 18px; }
.p-lower-4 { animation: pFromLogoLower4 13s ease-out 2.9s forwards; width: 13px; height: 13px; }
.p-lower-5 { animation: pFromLogoLower1 10s ease-out 3.2s forwards; width: 15px; height: 15px; }
.p-lower-6 { animation: pFromLogoLower2 8s ease-out 3.5s forwards; width: 20px; height: 20px; }
.p-lower-7 { animation: pFromLogoLower3 15s ease-out 3.8s forwards; width: 9px; height: 9px; }
.p-lower-8 { animation: pFromLogoLower4 11s ease-out 4.1s forwards; width: 14px; height: 14px; }
.p-lower-9 { animation: pFromLogoLower1 12s ease-out 4.4s forwards; width: 17px; height: 17px; }
.p-lower-10 { animation: pFromLogoLower2 9s ease-out 4.7s forwards; width: 12px; height: 12px; }
.p-lower-11 { animation: pFromLogoLower3 14s ease-out 5s forwards; width: 16px; height: 16px; }
.p-lower-12 { animation: pFromLogoLower4 10s ease-out 5.3s forwards; width: 19px; height: 19px; }
.p-lower-13 { animation: pFromLogoLower1 13s ease-out 5.6s forwards; width: 10px; height: 10px; }
.p-lower-14 { animation: pFromLogoLower2 11s ease-out 5.9s forwards; width: 15px; height: 15px; }
.p-lower-15 { animation: pFromLogoLower3 8s ease-out 6.2s forwards; width: 18px; height: 18px; }
.p-lower-16 { animation: pFromLogoLower4 15s ease-out 6.5s forwards; width: 13px; height: 13px; }
.p-lower-17 { animation: pFromLogoLower1 10s ease-out 6.8s forwards; width: 17px; height: 17px; }
.p-lower-18 { animation: pFromLogoLower2 12s ease-out 7.1s forwards; width: 11px; height: 11px; }
.p-lower-19 { animation: pFromLogoLower3 9s ease-out 7.4s forwards; width: 14px; height: 14px; }
.p-lower-20 { animation: pFromLogoLower4 14s ease-out 7.7s forwards; width: 16px; height: 16px; }
.p-lower-21 { animation: pFromLogoLower1 10s ease-out 8s forwards; width: 14px; height: 14px; }
.p-lower-22 { animation: pFromLogoLower2 12s ease-out 8.3s forwards; width: 18px; height: 18px; }
.p-lower-23 { animation: pFromLogoLower3 9s ease-out 8.6s forwards; width: 12px; height: 12px; }
.p-lower-24 { animation: pFromLogoLower4 13s ease-out 8.9s forwards; width: 16px; height: 16px; }
.p-lower-25 { animation: pFromLogoLower1 11s ease-out 9.2s forwards; width: 20px; height: 20px; }
.p-lower-26 { animation: pFromLogoLower2 8s ease-out 9.5s forwards; width: 11px; height: 11px; }
.p-lower-27 { animation: pFromLogoLower3 14s ease-out 9.8s forwards; width: 17px; height: 17px; }
.p-lower-28 { animation: pFromLogoLower4 10s ease-out 10.1s forwards; width: 13px; height: 13px; }
.p-lower-29 { animation: pFromLogoLower1 15s ease-out 10.4s forwards; width: 19px; height: 19px; }
.p-lower-30 { animation: pFromLogoLower2 9s ease-out 10.7s forwards; width: 15px; height: 15px; }
.p-lower-31 { animation: pFromLogoLower3 12s ease-out 11s forwards; width: 21px; height: 21px; }
.p-lower-32 { animation: pFromLogoLower4 11s ease-out 11.3s forwards; width: 10px; height: 10px; }
.p-lower-33 { animation: pFromLogoLower1 8s ease-out 11.6s forwards; width: 16px; height: 16px; }
.p-lower-34 { animation: pFromLogoLower2 13s ease-out 11.9s forwards; width: 18px; height: 18px; }
.p-lower-35 { animation: pFromLogoLower3 10s ease-out 2.15s forwards; width: 14px; height: 14px; }
.p-lower-36 { animation: pFromLogoLower4 14s ease-out 2.45s forwards; width: 20px; height: 20px; }
.p-lower-37 { animation: pFromLogoLower1 9s ease-out 2.75s forwards; width: 12px; height: 12px; }
.p-lower-38 { animation: pFromLogoLower2 11s ease-out 3.05s forwards; width: 17px; height: 17px; }
.p-lower-39 { animation: pFromLogoLower3 12s ease-out 3.35s forwards; width: 13px; height: 13px; }
.p-lower-40 { animation: pFromLogoLower4 8s ease-out 3.65s forwards; width: 19px; height: 19px; }
.p-lower-41 { animation: pFromLogoLower1 15s ease-out 3.95s forwards; width: 15px; height: 15px; }
.p-lower-42 { animation: pFromLogoLower2 10s ease-out 4.25s forwards; width: 11px; height: 11px; }
.p-lower-43 { animation: pFromLogoLower3 13s ease-out 4.55s forwards; width: 18px; height: 18px; }
.p-lower-44 { animation: pFromLogoLower4 9s ease-out 4.85s forwards; width: 16px; height: 16px; }
.p-lower-45 { animation: pFromLogoLower1 11s ease-out 5.15s forwards; width: 14px; height: 14px; }
.p-lower-46 { animation: pFromLogoLower2 14s ease-out 5.45s forwards; width: 20px; height: 20px; }
.p-lower-47 { animation: pFromLogoLower3 8s ease-out 5.75s forwards; width: 12px; height: 12px; }
.p-lower-48 { animation: pFromLogoLower4 12s ease-out 6.05s forwards; width: 17px; height: 17px; }
.p-lower-49 { animation: pFromLogoLower1 10s ease-out 6.35s forwards; width: 13px; height: 13px; }
.p-lower-50 { animation: pFromLogoLower2 9s ease-out 6.65s forwards; width: 19px; height: 19px; }

@keyframes pFromLogoLower1 { 
  0% { opacity: 1; transform: translate(0, 0); }
  25% { transform: translate(calc(12vw - 120px), calc(15vh - 120px)); }
  50% { transform: translate(calc(30vw - 120px), calc(32vh - 120px)); }
  75% { transform: translate(calc(42vw - 120px), calc(48vh - 120px)); }
  100% { opacity: 0; transform: translate(calc(50vw - 120px), calc(60vh - 120px)); }
}
@keyframes pFromLogoLower2 { 
  0% { opacity: 1; transform: translate(0, 0); }
  25% { transform: translate(calc(15vw - 120px), calc(18vh - 120px)); }
  50% { transform: translate(calc(28vw - 120px), calc(38vh - 120px)); }
  75% { transform: translate(calc(40vw - 120px), calc(52vh - 120px)); }
  100% { opacity: 0; transform: translate(calc(48vw - 120px), calc(62vh - 120px)); }
}
@keyframes pFromLogoLower3 { 
  0% { opacity: 1; transform: translate(0, 0); }
  25% { transform: translate(calc(18vw - 120px), calc(12vh - 120px)); }
  50% { transform: translate(calc(35vw - 120px), calc(28vh - 120px)); }
  75% { transform: translate(calc(45vw - 120px), calc(45vh - 120px)); }
  100% { opacity: 0; transform: translate(calc(52vw - 120px), calc(58vh - 120px)); }
}
@keyframes pFromLogoLower4 { 
  0% { opacity: 1; transform: translate(0, 0); }
  25% { transform: translate(calc(10vw - 120px), calc(16vh - 120px)); }
  50% { transform: translate(calc(25vw - 120px), calc(35vh - 120px)); }
  75% { transform: translate(calc(38vw - 120px), calc(50vh - 120px)); }
  100% { opacity: 0; transform: translate(calc(47vw - 120px), calc(60vh - 120px)); }
}

/* FULL SCREEN Flash - DISABLED */
.impact-flash-fullscreen {
  display: none;
}

/* Simple fade-in animation for ARTILORA - no spin, no travel */
.animate-fade-in-center {
  animation: simpleFadeIn 2s ease-out forwards;
}

@keyframes simpleFadeIn {
  0% {
    opacity: 0;
    transform: scale(0.95);
  }
  100% {
    opacity: 1;
    transform: scale(1);
  }
}

/* Simple fade-in for Sculpted By Nature letters - no spin, no travel */
.letter-s1-fade { animation: simpleFadeIn 0.3s ease-out 0.5s forwards; }
.letter-c-fade { animation: simpleFadeIn 0.3s ease-out 0.6s forwards; }
.letter-u-fade { animation: simpleFadeIn 0.3s ease-out 0.7s forwards; }
.letter-l2-fade { animation: simpleFadeIn 0.3s ease-out 0.8s forwards; }
.letter-p-fade { animation: simpleFadeIn 0.3s ease-out 0.9s forwards; }
.letter-t2-fade { animation: simpleFadeIn 0.3s ease-out 1.0s forwards; }
.letter-e-fade { animation: simpleFadeIn 0.3s ease-out 1.1s forwards; }
.letter-d-fade { animation: simpleFadeIn 0.3s ease-out 1.2s forwards; }
.letter-space-fade { animation: simpleFadeIn 0.3s ease-out 1.3s forwards; }
.letter-b-fade { animation: simpleFadeIn 0.3s ease-out 1.4s forwards; }
.letter-y-fade { animation: simpleFadeIn 0.3s ease-out 1.5s forwards; }
.letter-space2-fade { animation: simpleFadeIn 0.3s ease-out 1.6s forwards; }
.letter-n-fade { animation: simpleFadeIn 0.3s ease-out 1.7s forwards; }
.letter-a3-fade { animation: simpleFadeIn 0.3s ease-out 1.8s forwards; }
.letter-t3-fade { animation: simpleFadeIn 0.3s ease-out 1.9s forwards; }
.letter-u2-fade { animation: simpleFadeIn 0.3s ease-out 2.0s forwards; }
.letter-r3-fade { animation: simpleFadeIn 0.3s ease-out 2.1s forwards; }
.letter-e2-fade { animation: simpleFadeIn 0.3s ease-out 2.2s forwards; }

</style>
