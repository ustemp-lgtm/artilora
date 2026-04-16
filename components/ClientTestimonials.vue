<template>
  <div class="testimonial-widget">
    <!-- Testimonial Panel -->
    <Transition name="slide-panel">
      <div v-if="isOpen" class="testimonial-panel">
        <!-- Header -->
        <div class="panel-header">
          <h3>Share Your Experience</h3>
          <button @click="isOpen = false" class="close-btn" aria-label="Close">×</button>
        </div>

        <!-- Tabs -->
        <div class="tabs">
          <button 
            @click="activeTab = 'submit'"
            :class="{ 'active': activeTab === 'submit' }"
            class="tab-btn"
          >
            Submit
          </button>
          <button 
            @click="activeTab = 'view'"
            :class="{ 'active': activeTab === 'view' }"
            class="tab-btn"
          >
            View Comments
          </button>
        </div>

        <!-- Submit Form -->
        <div v-if="activeTab === 'submit'" class="panel-content">
          <form @submit.prevent="submitTestimonial" class="testimonial-form">
            <div class="form-group">
              <label for="name">Your Name</label>
              <input 
                id="name"
                v-model="form.name" 
                type="text" 
                placeholder="Enter your name"
                required
              />
            </div>

            <div class="form-group">
              <label for="email">Email (Optional)</label>
              <input 
                id="email"
                v-model="form.email" 
                type="email" 
                placeholder="your@email.com"
              />
            </div>

            <div class="form-group">
              <label for="message">Your Message</label>
              <textarea 
                id="message"
                v-model="form.message" 
                placeholder="Share your thoughts, appreciation, or feedback..."
                rows="5"
                required
              ></textarea>
            </div>

            <div class="form-group">
              <label for="rating">Rating</label>
              <div class="star-rating">
                <button
                  v-for="star in 5"
                  :key="star"
                  type="button"
                  @click="form.rating = star"
                  class="star"
                  :class="{ 'filled': star <= form.rating }"
                >
                  ⭐
                </button>
              </div>
            </div>

            <button type="submit" class="submit-btn" :disabled="isSubmitting">
              <span v-if="!isSubmitting">Submit</span>
              <span v-else>Sending...</span>
            </button>

            <p v-if="submitMessage" class="submit-message" :class="submitStatus">
              {{ submitMessage }}
            </p>
          </form>
        </div>

        <!-- View Comments -->
        <div v-if="activeTab === 'view'" class="panel-content">
          <div class="testimonials-list">
            <div v-if="testimonials.length === 0" class="no-testimonials">
              <p>No comments yet. Be the first to share!</p>
            </div>
            <div 
              v-for="(testimonial, index) in testimonials" 
              :key="index"
              class="testimonial-item"
            >
              <div class="testimonial-header">
                <div class="author-info">
                  <span class="author-name">{{ testimonial.name }}</span>
                  <div class="stars">
                    <span v-for="star in testimonial.rating" :key="star">⭐</span>
                  </div>
                </div>
                <span class="date">{{ formatDate(testimonial.date) }}</span>
              </div>
              <p class="testimonial-message">{{ testimonial.message }}</p>
            </div>
          </div>
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup>
const isOpen = ref(false)
const activeTab = ref('submit')
const isSubmitting = ref(false)
const submitMessage = ref('')
const submitStatus = ref('')

const form = ref({
  name: '',
  email: '',
  message: '',
  rating: 5
})

const testimonials = ref([
  {
    name: 'Sample Visitor',
    message: 'Beautiful artwork! The sculptures speak to the soul.',
    rating: 5,
    date: new Date('2024-01-15')
  }
])

const submitTestimonial = async () => {
  isSubmitting.value = true
  submitMessage.value = ''
  
  try {
    // Add to local list (in production, this would send to a backend)
    testimonials.value.unshift({
      name: form.value.name,
      message: form.value.message,
      rating: form.value.rating,
      date: new Date()
    })
    
    // Reset form
    form.value = {
      name: '',
      email: '',
      message: '',
      rating: 5
    }
    
    submitMessage.value = 'Thank you for sharing your thoughts!'
    submitStatus.value = 'success'
    
    // Switch to view tab after 2 seconds
    setTimeout(() => {
      activeTab.value = 'view'
      submitMessage.value = ''
    }, 2000)
    
  } catch (error) {
    submitMessage.value = 'Something went wrong. Please try again.'
    submitStatus.value = 'error'
  } finally {
    isSubmitting.value = false
  }
}

const formatDate = (date) => {
  const d = new Date(date)
  return d.toLocaleDateString('en-US', { month: 'short', day: 'numeric', year: 'numeric' })
}

// Listen for open event from navigation
onMounted(() => {
  if (process.client) {
    window.addEventListener('open-testimonials', () => {
      isOpen.value = true
    })
  }
})
</script>

<style scoped>
.testimonial-widget {
  position: fixed;
  right: 20px;
  top: 80px;
  z-index: 1000;
}

.testimonial-panel {
  position: fixed;
  right: 20px;
  top: 80px;
  width: 400px;
  max-width: calc(100vw - 40px);
  max-height: calc(100vh - 100px);
  background: #0A4D68;
  border: 2px solid #088395;
  border-radius: 16px;
  box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5);
  overflow: hidden;
  display: flex;
  flex-direction: column;
}

.panel-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px;
  background: linear-gradient(135deg, #088395 0%, #0A4D68 100%);
  border-bottom: 2px solid #088395;
}

.panel-header h3 {
  font-family: 'Bradley Hand ITC', cursive;
  color: #FFD700;
  font-size: 20px;
  margin: 0;
  font-weight: bold;
}

.close-btn {
  background: none;
  border: none;
  color: white;
  font-size: 32px;
  cursor: pointer;
  line-height: 1;
  padding: 0;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: transform 0.2s;
}

.close-btn:hover {
  transform: rotate(90deg);
}

.tabs {
  display: flex;
  background: rgba(0, 0, 0, 0.2);
}

.tab-btn {
  flex: 1;
  padding: 12px;
  background: transparent;
  border: none;
  color: white;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.3s;
  border-bottom: 3px solid transparent;
}

.tab-btn:hover {
  background: rgba(255, 255, 255, 0.1);
}

.tab-btn.active {
  background: rgba(255, 215, 0, 0.1);
  border-bottom-color: #FFD700;
  color: #FFD700;
  font-weight: bold;
}

.panel-content {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
}

.testimonial-form {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.form-group label {
  font-family: 'Bradley Hand ITC', cursive;
  color: #FFD700;
  font-size: 14px;
  font-weight: bold;
}

.form-group input,
.form-group textarea {
  padding: 10px;
  border: 2px solid #088395;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.1);
  color: white;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
}

.form-group input::placeholder,
.form-group textarea::placeholder {
  color: rgba(255, 255, 255, 0.5);
}

.form-group input:focus,
.form-group textarea:focus {
  outline: none;
  border-color: #FFD700;
  background: rgba(255, 255, 255, 0.15);
}

.star-rating {
  display: flex;
  gap: 8px;
}

.star {
  background: none;
  border: none;
  font-size: 28px;
  cursor: pointer;
  transition: transform 0.2s;
  filter: grayscale(100%);
  opacity: 0.5;
}

.star.filled {
  filter: grayscale(0%);
  opacity: 1;
}

.star:hover {
  transform: scale(1.2);
}

.submit-btn {
  padding: 12px 24px;
  background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%);
  color: #001F3F;
  border: none;
  border-radius: 8px;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s;
}

.submit-btn:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.4);
}

.submit-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.submit-message {
  text-align: center;
  padding: 10px;
  border-radius: 8px;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
}

.submit-message.success {
  background: rgba(0, 255, 0, 0.2);
  color: #00ff00;
  border: 1px solid #00ff00;
}

.submit-message.error {
  background: rgba(255, 0, 0, 0.2);
  color: #ff6b6b;
  border: 1px solid #ff6b6b;
}

.testimonials-list {
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.no-testimonials {
  text-align: center;
  padding: 40px 20px;
  color: rgba(255, 255, 255, 0.6);
  font-family: 'Bradley Hand ITC', cursive;
}

.testimonial-item {
  background: rgba(0, 0, 0, 0.3);
  border: 1px solid #088395;
  border-radius: 12px;
  padding: 16px;
}

.testimonial-header {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-bottom: 12px;
}

.author-info {
  display: flex;
  flex-direction: column;
  gap: 4px;
}

.author-name {
  font-family: 'Bradley Hand ITC', cursive;
  color: #FFD700;
  font-weight: bold;
  font-size: 16px;
}

.stars {
  font-size: 14px;
}

.date {
  font-size: 12px;
  color: rgba(255, 255, 255, 0.6);
  font-family: 'Bradley Hand ITC', cursive;
}

.testimonial-message {
  color: white;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  line-height: 1.6;
  margin: 0;
}

/* Transitions */
.slide-panel-enter-active,
.slide-panel-leave-active {
  transition: all 0.3s ease;
}

.slide-panel-enter-from {
  opacity: 0;
  transform: translateY(20px);
}

.slide-panel-leave-to {
  opacity: 0;
  transform: translateY(20px);
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .testimonial-panel {
    right: 10px;
    top: 70px;
    width: calc(100vw - 20px);
    max-height: calc(100vh - 90px);
  }
}
</style>
