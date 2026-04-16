<template>
  <div class="countdown-container">
    <div class="countdown-wrapper">
      <!-- Decorative elements -->
      
      <!-- Title -->
      <div class="countdown-title">
        <span class="title-star">✦</span>
        <h3 class="title-text">Countdown to 2026 Launch</h3>
        <span class="title-star">✦</span>
      </div>
      
      <!-- Countdown Display -->
      <div class="countdown-display">
        <!-- Days -->
        <div class="time-unit">
          <div class="time-value">{{ days }}</div>
          <div class="time-label">Days</div>
        </div>
        
        <!-- Separator -->
        <div class="time-separator">:</div>
        
        <!-- Hours -->
        <div class="time-unit">
          <div class="time-value">{{ hours }}</div>
          <div class="time-label">Hours</div>
        </div>
        
        <!-- Separator -->
        <div class="time-separator">:</div>
        
        <!-- Minutes -->
        <div class="time-unit">
          <div class="time-value">{{ minutes }}</div>
          <div class="time-label">Minutes</div>
        </div>
        
        <!-- Separator -->
        <div class="time-separator">:</div>
        
        <!-- Seconds -->
        <div class="time-unit">
          <div class="time-value">{{ seconds }}</div>
          <div class="time-label">Seconds</div>
        </div>
      </div>
      
      <!-- Launch Date -->
      <div class="launch-date">
        Official Launch: 26th of November, 2026, 02.00 AM - 06.00 AM
      </div>
    </div>
  </div>
</template>

<script setup>
const props = defineProps({
  targetDate: {
    type: String,
    default: '2026-11-26T02:00:00' // Default to Nov 26, 2026
  }
})

const days = ref(0)
const hours = ref(0)
const minutes = ref(0)
const seconds = ref(0)
const launchDateFormatted = ref('')

let intervalId = null

const updateCountdown = () => {
  const now = new Date().getTime()
  const target = new Date(props.targetDate).getTime()
  const distance = target - now
  
  if (distance < 0) {
    // Countdown finished
    days.value = 0
    hours.value = 0
    minutes.value = 0
    seconds.value = 0
    if (intervalId) clearInterval(intervalId)
    return
  }
  
  days.value = Math.floor(distance / (1000 * 60 * 60 * 24))
  hours.value = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
  minutes.value = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
  seconds.value = Math.floor((distance % (1000 * 60)) / 1000)
}

const formatLaunchDate = () => {
  const date = new Date(props.targetDate)
  const options = { year: 'numeric', month: 'long', day: 'numeric' }
  launchDateFormatted.value = date.toLocaleDateString('en-US', options)
}

onMounted(() => {
  if (process.client) {
    formatLaunchDate()
    updateCountdown()
    intervalId = setInterval(updateCountdown, 1000)
  }
})

onUnmounted(() => {
  if (intervalId) clearInterval(intervalId)
})
</script>

<style scoped>
.countdown-container {
  width: 100%;
  display: flex;
  justify-content: center;
  padding: 2rem 1rem;
}


.countdown-wrapper {
  position: relative;
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.8), rgba(0, 0, 0, 0.9));
  border: 3px solid #FFD700;
  border-radius: 20px;
  padding: 2rem 1.5rem;
  max-width: 800px;
  width: 100%;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
  backdrop-filter: blur(10px);
}


.countdown-title {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 2rem;
}

.title-star {
  color: #FFD700;
  font-size: 1.5rem;
  animation: starTwinkle 2s ease-in-out infinite;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

.title-text {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 1.75rem;
  font-weight: 700;
  color: #FFD700;
  text-shadow: 
    0 0 10px rgba(255, 215, 0, 0.8),
    0 0 20px rgba(255, 215, 0, 0.5),
    2px 2px 4px rgba(0, 0, 0, 0.9);
  letter-spacing: 1px;
}

.countdown-display {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
  flex-wrap: wrap;
}

.time-unit {
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 100px;
}

.time-value {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 3rem;
  font-weight: 900;
  color: #FFD700;
  text-shadow: 
    0 0 20px rgba(255, 215, 0, 1),
    0 0 30px rgba(255, 215, 0, 0.8),
    2px 2px 6px rgba(0, 0, 0, 0.9);
  line-height: 1;
  animation: numberPulse 1s ease-in-out infinite;
}

.time-label {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 0.875rem;
  color: #FFFFFF;
  font-weight: 600;
  margin-top: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 1px;
}

.time-separator {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 2.5rem;
  font-weight: 700;
  color: #FFD700;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
  animation: separatorBlink 2s ease-in-out infinite;
}

.launch-date {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 1rem;
  color: #FFFFFF;
  text-align: center;
  margin-top: 1.5rem;
  font-weight: 600;
  opacity: 0.9;
}

/* Animations */
@keyframes countdownGlow {
  0% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 30px rgba(255, 215, 0, 0.3),
      inset 0 0 20px rgba(255, 215, 0, 0.1);
  }
  100% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 50px rgba(255, 215, 0, 0.6),
      0 0 70px rgba(255, 215, 0, 0.4),
      inset 0 0 30px rgba(255, 215, 0, 0.2);
  }
}

@keyframes glowPulse {
  0% {
    opacity: 0.5;
    transform: scale(1);
  }
  100% {
    opacity: 1;
    transform: scale(1.05);
  }
}

@keyframes starTwinkle {
  0%, 100% {
    opacity: 0.7;
    transform: scale(1) rotate(0deg);
  }
  50% {
    opacity: 1;
    transform: scale(1.2) rotate(180deg);
  }
}

@keyframes numberPulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.05);
  }
}

@keyframes separatorBlink {
  0%, 100% {
    opacity: 1;
  }
  50% {
    opacity: 0.5;
  }
}

/* Responsive */
@media (max-width: 768px) {
  .countdown-wrapper {
    padding: 1.5rem 1rem;
  }
  
  .title-text {
    font-size: 1.25rem;
  }
  
  .title-star {
    font-size: 1.25rem;
  }
  
  .time-unit {
    min-width: 70px;
  }
  
  .time-value {
    font-size: 2rem;
  }
  
  .time-label {
    font-size: 0.75rem;
  }
  
  .time-separator {
    font-size: 1.75rem;
  }
  
  .launch-date {
    font-size: 0.875rem;
  }
}

@media (max-width: 480px) {
  .countdown-display {
    gap: 0.5rem;
  }
  
  .time-unit {
    min-width: 60px;
  }
  
  .time-value {
    font-size: 1.5rem;
  }
  
  .time-separator {
    font-size: 1.5rem;
  }
}
</style>
