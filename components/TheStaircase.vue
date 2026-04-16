<template>
  <div class="fixed left-0 top-1/2 -translate-y-1/2 z-[100] flex flex-col items-start pointer-events-none">
    
    <!-- Title / Invitation hidden on small screens -->
    <div class="bg-black/30 backdrop-blur-sm border border-[#FFD700]/20 rounded-r-xl p-3 mb-4 ml-0 shadow-lg pointer-events-auto transform transition-transform duration-500 max-w-[220px]" :class="isHovered ? 'translate-x-0' : '-translate-x-[200px]'">
      <p class="text-[#FFD700] text-sm font-bold text-left leading-tight" style="font-family: 'Bradley Hand ITC', cursive;">
        Leave your mark on Artilora. Choose a step to place your bouquet.
      </p>
      <div class="flex justify-between items-center mt-2 border-t border-[#FFD700]/20 pt-2">
        <span class="text-[#FFD700] font-bold text-sm">{{ myTributes }} 💐</span>
        <span class="text-white text-xs" style="font-family: 'Bradley Hand ITC', cursive;">- Hats off to you -</span>
      </div>
    </div>

    <!-- The Staircase -->
    <div 
      class="flex flex-col pointer-events-auto group bg-transparent py-6 pl-0 pr-4"
      @mouseenter="isHovered = true"
      @mouseleave="isHovered = false"
    >
      <div 
        v-for="step in steps" 
        :key="step.id"
        class="flex items-center justify-start cursor-pointer group/step relative"
        @click="confirmDrop(step)"
      >
        <!-- The Physical Step Block -->
        <div 
          class="bg-gradient-to-r from-transparent to-[#FFD700]/20 transition-all duration-300 relative border-t border-r border-[#FFD700]/30 backdrop-blur-[2px] rounded-tr-md flex items-center z-10 hover:z-20 shrink-0"
          :style="{ width: `${20 + ((11 - step.id) * 8)}px`, height: '36px' }"
          :class="isHovered ? 'to-[#FFD700]/40 border-[#FFD700]/60' : 'opacity-60'"
        >
          <div class="absolute -right-12 top-1/2 -translate-y-1/2 text-[#FFD700] text-[10px] font-bold opacity-0 group-hover/step:opacity-100 transition-opacity whitespace-nowrap drop-shadow-md" style="font-family: 'Bradley Hand ITC', cursive;">
            Step {{step.id}}
          </div>
        </div>

        <!-- The Step Counter (Hidden until hover on sidebar) -->
        <div class="bg-black/90 border border-[#FFD700]/40 rounded-full px-3 py-1 flex items-center justify-between gap-1 overflow-hidden transition-all duration-300 shadow-[0_0_10px_rgba(255,215,0,0.2)] whitespace-nowrap ml-3 z-0"
          :class="isHovered ? 'w-auto max-w-[120px] opacity-100' : 'w-0 opacity-0 px-0 ml-0 border-transparent'"
        >
          <span class="text-sm shadow-glow transition-transform duration-300 group-hover/step:scale-125 origin-center" :class="{'animate-bloom': animatingStep === step.id}">💐</span>
          <span class="text-[11px] text-[#FFD700] font-bold ml-1" style="font-family: 'Bradley Hand ITC', cursive;">{{ formatCount(step.globalCount) }}</span>
        </div>
      </div>
    </div>

    <!-- Confirmation Modal -->
    <div v-if="selectedStep" class="fixed inset-0 z-[200] flex items-center justify-center bg-black/70 backdrop-blur-sm pointer-events-auto">
      <div class="bg-[#001F3F] border-2 border-[#FFD700] p-8 rounded-2xl shadow-[0_0_40px_rgba(255,215,0,0.4)] max-w-sm w-full mx-4 transform transition-all animate-bounce-in relative overflow-hidden">
        <!-- Decorative subtle background grid -->
        <div class="absolute inset-0 z-0 opacity-10" style="background-image: linear-gradient(#FFD700 1px, transparent 1px), linear-gradient(90deg, #FFD700 1px, transparent 1px); background-size: 20px 20px;"></div>
        
        <div class="relative z-10">
          <h3 class="text-[#FFD700] text-2xl font-bold mb-4 text-center tracking-wider" style="font-family: 'Bradley Hand ITC', cursive;">Leave Your Mark</h3>
          <p class="text-white text-xl text-center mb-6 font-bold" style="font-family: 'Bradley Hand ITC', cursive;">
            Submit your Bouquet to Step {{ selectedStep.id }}? <span class="text-2xl animate-pulse inline-block">💐</span>
          </p>
          
          <div class="mb-6 flex flex-col items-center gap-2">
            <label class="text-[#FFD700]/80 text-sm font-bold" style="font-family: 'Bradley Hand ITC', cursive;">Sign Your Name (Optional)</label>
            <input v-model="tributeName" type="text" placeholder="Anonymous" maxlength="20" class="w-full max-w-[200px] bg-black/60 border border-[#FFD700]/40 rounded-lg px-4 py-2 text-center text-[#FFD700] focus:outline-none focus:border-[#FFD700] placeholder-[#FFD700]/30 shadow-[inset_0_0_10px_rgba(255,215,0,0.1)] transition-colors" style="font-family: 'Bradley Hand ITC', cursive;" @keyup.enter="submitBouquet" />
          </div>

          <div class="flex justify-center gap-6">
            <button @click="selectedStep = null" class="px-6 py-2 border border-[#FFD700]/50 text-[#FFD700] font-bold rounded-lg hover:bg-[#FFD700]/10 transition-colors" style="font-family: 'Bradley Hand ITC', cursive;">Cancel</button>
            <button @click="submitBouquet" class="px-6 py-2 bg-[#8B0000] text-white font-bold border border-[#FFD700] rounded-lg focus:outline-none hover:shadow-[0_0_20px_rgba(255,215,0,0.6)] hover:bg-[#660000] transition-all transform hover:scale-105" style="font-family: 'Bradley Hand ITC', cursive;">Yes, Drop</button>
          </div>
        </div>
      </div>
    </div>

    <!-- Live Feed Ticker / Toasts -->
    <div class="fixed bottom-6 left-6 z-[150] pointer-events-none flex flex-col items-start gap-2 max-w-[300px]">
      <transition-group name="toast">
        <div v-for="toast in activeToasts" :key="toast.id" class="bg-black/80 backdrop-blur-md border border-[#FFD700]/30 rounded-lg px-4 py-2 shadow-[0_0_15px_rgba(255,215,0,0.15)] flex items-center gap-3">
          <span class="text-lg animate-pulse shadow-glow">💐</span>
          <span class="text-white text-[13px] leading-tight" style="font-family: 'Bradley Hand ITC', cursive;">
            <b class="text-[#FFD700]">{{ toast.name }}</b> placed a bouquet on Step {{ toast.step }}
          </span>
        </div>
      </transition-group>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'

const isHovered = ref(false)
const selectedStep = ref(null)
const animatingStep = ref(null)
const myTributes = ref(0)
const tributeName = ref('')
const activeToasts = ref([])
let toastIdCounter = 0
let simulationInterval = null

const simulatedNames = ['Soman', 'Elena', 'David', 'Anonymous', 'ArtLover', 'Marco', 'Sophie', 'Isabella', 'Artemis']

const showToast = (name, step) => {
  const id = toastIdCounter++
  activeToasts.value.push({ id, name: name || 'Anonymous', step })
  setTimeout(() => {
    activeToasts.value = activeToasts.value.filter(t => t.id !== id)
  }, 4000)
}

// Initial arbitrary numbers to mimic "1,240" etc.
const baseCounts = [
  55, 305, 1120, 95, 2100, 110, 430, 850, 210, 1240
]

// Step 10 at top, Step 1 at bottom
const steps = ref(
  Array.from({ length: 10 }, (_, i) => ({
    id: 10 - i, 
    globalCount: baseCounts[i]
  }))
)

// Formatting number with commas
const formatCount = (num) => {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
}

onMounted(() => {
  if (process.client) {
    const savedTributes = localStorage.getItem('artilora_tributes')
    if (savedTributes) {
      myTributes.value = parseInt(savedTributes)
    }
    const savedName = localStorage.getItem('artilora_tribute_name')
    if (savedName) {
      tributeName.value = savedName
    }

    // Load saved global increments 
    steps.value.forEach(step => {
      const savedCount = localStorage.getItem(`artilora_step_${step.id}`)
      if (savedCount) {
        step.globalCount += parseInt(savedCount)
      }
    })

    // Simulate real-time WebSocket events from other visitors
    simulationInterval = setInterval(() => {
      // 30% chance someone drops a bouquet every 3 seconds
      if (Math.random() > 0.7) {
        const randomIdx = Math.floor(Math.random() * 10)
        steps.value[randomIdx].globalCount++
        
        // Show simulated toast
        const randomName = simulatedNames[Math.floor(Math.random() * simulatedNames.length)]
        showToast(randomName, steps.value[randomIdx].id)
        
        // Very occasionally, briefly glow a step to show "activity" if looking closely
        const stepId = steps.value[randomIdx].id
        const el = document.getElementById(`step-line-${stepId}`)
        if (el) {
          el.style.filter = 'brightness(1.5) drop-shadow(0 0 10px white)'
          setTimeout(() => {
            el.style.filter = ''
          }, 500)
        }
      }
    }, 3000)
  }
})

onUnmounted(() => {
  if (simulationInterval) clearInterval(simulationInterval)
})

const confirmDrop = (step) => {
  selectedStep.value = step
}

const submitBouquet = () => {
  if (!selectedStep.value) return

  const targetId = selectedStep.value.id
  selectedStep.value = null
  
  // Increment local state
  myTributes.value++
  if (process.client) {
    localStorage.setItem('artilora_tributes', myTributes.value.toString())
  }

  // Increment specific step
  const stepObj = steps.value.find(s => s.id === targetId)
  if (stepObj) {
    stepObj.globalCount++
    
    // Save the user's increment
    if (process.client) {
      const currentSaved = parseInt(localStorage.getItem(`artilora_step_${targetId}`) || "0")
      localStorage.setItem(`artilora_step_${targetId}`, (currentSaved + 1).toString())
      localStorage.setItem('artilora_tribute_name', tributeName.value)
    }

    // Show toast for self
    showToast(tributeName.value, targetId)

    // Trigger bloom animation
    animatingStep.value = targetId
    setTimeout(() => {
      animatingStep.value = null
    }, 1200)
  }
}
</script>

<style scoped>
.animate-bounce-in {
  animation: bounceIn 0.5s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

@keyframes bounceIn {
  0% { opacity: 0; transform: scale(0.8) translateY(20px); }
  100% { opacity: 1; transform: scale(1) translateY(0); }
}

.animate-bloom {
  animation: bloomEffect 1.2s cubic-bezier(0, 0, 0.2, 1);
  display: inline-block;
}

@keyframes bloomEffect {
  0% { transform: scale(1); filter: drop-shadow(0 0 0px rgba(255,105,180,0)); }
  20% { transform: scale(2.2) rotate(-15deg); filter: brightness(1.5) drop-shadow(0 0 25px rgba(255,215,0,1)); }
  50% { transform: scale(1.8) rotate(10deg); filter: brightness(1.3) drop-shadow(0 0 15px rgba(255,105,180,0.8)); }
  100% { transform: scale(1.25) rotate(0deg); filter: brightness(1) drop-shadow(0 0 5px rgba(255,182,193,0.5)); }
}

/* Base shadow for the flower emoji */
.shadow-glow {
  filter: drop-shadow(0 0 5px rgba(255,182,193,0.4));
}

/* Smooth sizing transitions */
.transition-all {
  transition-property: all;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 300ms;
}

/* Toast animations */
.toast-enter-active,
.toast-leave-active {
  transition: all 0.5s ease;
}
.toast-enter-from {
  opacity: 0;
  transform: translateX(-30px);
}
.toast-leave-to {
  opacity: 0;
  transform: translateY(20px);
  position: absolute;
}
</style>
