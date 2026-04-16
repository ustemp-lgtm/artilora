<template>
  <div class="newsletter-signup">
    <div class="newsletter-container">
      <div class="newsletter-icon">📱</div>
      <h3 class="newsletter-title">Stay Connected With Artilora Updates-</h3>
      <p class="newsletter-description">
        Receive updates about new sculptures, exhibitions, and the stories behind each creation.
      </p>
      
      <form @submit.prevent="handleSubmit" class="newsletter-form">
        <div class="input-group">
          <input
            v-model="email"
            type="email"
            placeholder="Enter your email"
            required
            class="newsletter-input"
            :disabled="isSubmitting"
          />
          <button 
            type="submit" 
            class="newsletter-button"
            :disabled="isSubmitting"
          >
            {{ isSubmitting ? 'Subscribing...' : 'Subscribe' }}
          </button>
        </div>
        
        <p v-if="message" :class="['message', messageType]">
          {{ message }}
        </p>
      </form>
      
      <p class="newsletter-privacy">
        We respect your privacy. Unsubscribe anytime.
      </p>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue'
import { useAnalytics } from '~/composables/useAnalytics'

const email = ref('')
const message = ref('')
const messageType = ref('')
const isSubmitting = ref(false)
const { trackEvent } = useAnalytics()

const handleSubmit = async () => {
  if (!email.value) return
  
  isSubmitting.value = true
  message.value = ''
  
  try {
    // Track newsletter signup attempt
    trackEvent('newsletter_signup_attempt', { email: email.value.substring(0, 5) + '***' })
    
    // TODO: Replace with your actual newsletter service (Mailchimp, SendGrid, etc.)
    // For now, we'll simulate a successful submission
    await new Promise(resolve => setTimeout(resolve, 1000))
    
    // Store email locally (you'll want to send this to your backend)
    const subscribers = JSON.parse(localStorage.getItem('newsletter_subscribers') || '[]')
    if (!subscribers.includes(email.value)) {
      subscribers.push({
        email: email.value,
        date: new Date().toISOString()
      })
      localStorage.setItem('newsletter_subscribers', JSON.stringify(subscribers))
    }
    
    message.value = '✓ Thank you! You\'re now subscribed to Artilora updates.'
    messageType.value = 'success'
    email.value = ''
    
    // Track successful signup
    trackEvent('newsletter_signup_success')
    
  } catch (error) {
    message.value = '✗ Something went wrong. Please try again.'
    messageType.value = 'error'
    trackEvent('newsletter_signup_error')
  } finally {
    isSubmitting.value = false
  }
}
</script>

<style scoped>
.newsletter-signup {
  background: linear-gradient(135deg, rgba(0, 31, 63, 0.95), rgba(139, 0, 0, 0.9));
  padding: 60px 20px;
  position: relative;
  overflow: hidden;
}

.newsletter-signup::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(circle at 50% 50%, rgba(255, 215, 0, 0.1), transparent 70%);
  pointer-events: none;
}

.newsletter-container {
  max-width: 600px;
  margin: 0 auto;
  text-align: center;
  position: relative;
  z-index: 1;
}

.newsletter-icon {
  font-size: 48px;
  margin-bottom: 20px;
  animation: float 3s ease-in-out infinite;
}

@keyframes float {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-10px); }
}

.newsletter-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 20px;
  font-weight: bold;
  color: #FFD700;
  margin-bottom: 15px;
  text-shadow: 0 2px 10px rgba(255, 215, 0, 0.3);
}

.newsletter-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFFFFF;
  margin-bottom: 30px;
  line-height: 1.6;
}

.newsletter-form {
  margin-bottom: 15px;
}

.input-group {
  display: flex;
  gap: 10px;
  margin-bottom: 15px;
}

.newsletter-input {
  flex: 1;
  padding: 15px 20px;
  border: 2px solid #FFD700;
  border-radius: 8px;
  background: rgba(255, 255, 255, 0.1);
  color: #FFFFFF;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.newsletter-input::placeholder {
  color: rgba(255, 255, 255, 0.6);
}

.newsletter-input:focus {
  outline: none;
  background: rgba(255, 255, 255, 0.15);
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.3);
}

.newsletter-button {
  padding: 15px 30px;
  background: linear-gradient(135deg, #FFD700, #FFA500);
  border: none;
  border-radius: 8px;
  color: #001F3F;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  white-space: nowrap;
}

.newsletter-button:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 5px 20px rgba(255, 215, 0, 0.5);
}

.newsletter-button:disabled {
  opacity: 0.6;
  cursor: not-allowed;
}

.message {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  padding: 10px;
  border-radius: 5px;
  margin-top: 10px;
}

.message.success {
  background: rgba(0, 255, 0, 0.1);
  color: #90EE90;
  border: 1px solid rgba(0, 255, 0, 0.3);
}

.message.error {
  background: rgba(255, 0, 0, 0.1);
  color: #FF6B6B;
  border: 1px solid rgba(255, 0, 0, 0.3);
}

.newsletter-privacy {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 12px;
  color: rgba(255, 255, 255, 0.6);
  font-style: italic;
}

@media (max-width: 768px) {
  .input-group {
    flex-direction: column;
  }
  
  .newsletter-title {
    font-size: 16px;
  }
  
  .newsletter-description {
    font-size: 14px;
  }
}
</style>
