<template>
  <div class="ai-consultant">
    <!-- Floating Chat Button -->
    <button 
      v-if="!isOpen" 
      @click="openChat" 
      class="chat-button"
      title="Ask the Artilorian Counsel"
    >
      <svg viewBox="0 0 24 24" width="28" height="28" fill="currentColor">
        <path d="M20 2H4c-1.1 0-2 .9-2 2v18l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H6l-2 2V4h16v12z"/>
        <circle cx="12" cy="10" r="1.5"/>
        <circle cx="8" cy="10" r="1.5"/>
        <circle cx="16" cy="10" r="1.5"/>
      </svg>
      <span class="pulse-ring"></span>
    </button>

    <!-- Chat Window -->
    <div v-if="isOpen" class="chat-window">
      <!-- Header -->
      <div class="chat-header">
        <div class="header-content">
          <div class="ai-avatar">
            <svg viewBox="0 0 24 24" width="24" height="24" fill="currentColor">
              <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm-1-13h2v6h-2zm0 8h2v2h-2z"/>
            </svg>
          </div>
          <div>
            <h3>Ask the Artilorian Counsel</h3>
            <p class="status">Six Voices. Six Chapters. Direct Insight.</p>
          </div>
        </div>
        <button @click="closeChat" class="close-btn">
          <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
            <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
          </svg>
        </button>
      </div>

      <!-- Messages -->
      <div class="chat-messages" ref="messagesContainer">
        <div v-for="(message, index) in messages" :key="index" :class="['message', message.type]">
          <div class="message-content">
            <p v-html="message.text"></p>
            <span class="message-time">{{ message.time }}</span>
          </div>
        </div>
        <div v-if="isTyping" class="message ai typing-indicator">
          <div class="message-content">
            <div class="typing-dots">
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
        </div>
      </div>

      <!-- Quick Suggestions -->
      <div v-if="showSuggestions" class="quick-suggestions">
        <button 
          v-for="(suggestion, index) in suggestions" 
          :key="index"
          @click="sendMessage(suggestion)"
          class="suggestion-btn"
        >
          {{ suggestion }}
        </button>
      </div>

      <!-- Input -->
      <div class="chat-input">
        <input 
          v-model="userInput" 
          @keyup.enter="sendUserMessage"
          placeholder="Ask about sculptures, pricing, shipping..."
          type="text"
        />
        <button @click="sendUserMessage" :disabled="!userInput.trim()">
          <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
            <path d="M2.01 21L23 12 2.01 3 2 10l15 2-15 2z"/>
          </svg>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, nextTick, onMounted, onUnmounted } from 'vue'

const isOpen = ref(false)
const userInput = ref('')
const messages = ref([])
const isTyping = ref(false)
const showSuggestions = ref(true)
const messagesContainer = ref(null)

// Analytics tracking
const analytics = useAnalytics()
let chatOpenTime = 0
let userMessageCount = 0

const suggestions = [
  "Tell me about Primus",
  "What materials do you use?",
  "Do you ship internationally?",
  "Show me your sculptures",
  "Custom commissions?",
  "Sustainability practices?"
]

// Expanded Knowledge base about Artilora
const knowledgeBase = {
  primus: "Primus is more than a sculpture - it's the first inward pause from which ARTILORA emerged. Formed from Aerial Root Sculpture in Ficus benghalensis, it embodies humility as strength and silence as origin. This piece is not for sale and remains in our studio as a witness and compass. It represents the moment of stillness where form learned to listen before it learned to rise.",
  
  materials: "We work exclusively with Aerial Root Sculptures from Ficus benghalensis (Banyan tree). These natural materials have known time, weight, and patience - some roots are decades old. Each piece is shaped through listening rather than force, honoring the natural form. The roots are sustainably sourced from naturally fallen branches and pruned sections, never harming living trees.",
  
  shipping: "Yes, we ship internationally to over 50 countries! Each sculpture is carefully packaged with premium materials including custom wooden crates, foam padding, and moisture barriers to ensure safe delivery. Shipping typically takes 7-14 days internationally, 3-5 days domestically. We provide full insurance and tracking. Shipping costs vary by location and sculpture size - contact us for a detailed quote.",
  
  process: "Our creative process is about recognition rather than invention - gently uncovering the beauty already dwelling within nature. We listen to the material and allow truth to take form through patience and reverence. Each sculpture goes through careful cleaning, natural preservation treatment, and months of observation before the final form emerges. We never force a shape - we reveal what's already there.",
  
  pricing: "Each sculpture is unique and priced based on size, complexity, time invested, and the rarity of the root material. Small pieces start at $500, medium sculptures range $1500-$3500, and large statement pieces can reach $5000-$15000. We offer payment plans for larger pieces. Contact us for specific pricing on pieces that interest you.",
  
  custom: "Yes, we accept custom commissions! Share your vision with us, and we'll work together to create a piece that resonates with your space and spirit. The process typically takes 2-4 months depending on complexity. We'll provide sketches, progress photos, and involve you in key decisions. Commission deposits are 40% upfront, with the balance due upon completion.",
  
  care: "Aerial root sculptures are remarkably durable but should be kept away from direct moisture and extreme humidity. Dust gently with a soft, dry cloth every few weeks. Avoid direct sunlight to prevent fading. They develop a beautiful patina over time, adding to their character. For outdoor display, we recommend a covered area. Professional restoration services are available if needed.",
  
  philosophy: "ARTILORA is a quiet harmony of Art and Flora. We believe the most profound art is not created, but revealed. Every wound carried by nature is felt as a deep pain in our heart. Our work is a meditation on impermanence, resilience, and the silent wisdom of natural forms. We don't impose - we listen, honor, and allow.",
  
  sculptures: "Our collection includes several signature pieces: <strong>Comfort</strong> (101) - a meditation on rest and refuge; <strong>A Day That is Mine</strong> (102) - celebrating personal sovereignty; <strong>The Darkness of Depth</strong> (103) - exploring inner shadows; <strong>Beyond That Feminine</strong> (104) - honoring maternal strength; <strong>Beyond That Masculine</strong> (105) - examining masculine vulnerability. Each piece tells a unique story through natural form.",
  
  awards: "ARTILORA has been honored with recognition from international art communities. Our work has been featured in sustainable art exhibitions and eco-conscious design showcases. We've received commendations for innovative use of natural materials and our commitment to environmental stewardship. Visit our Awards page to see our full recognition history.",
  
  exhibitions: "Our sculptures have been exhibited in galleries across India and internationally. We participate in select art fairs, sustainable design exhibitions, and private gallery showings. We also offer virtual studio tours where you can explore our creative space and see works in progress. Contact us to schedule a private viewing or virtual consultation.",
  
  installation: "We provide complete installation guidance with every sculpture. For wall-mounted pieces, we include custom mounting hardware and detailed instructions. For floor sculptures, we advise on optimal placement, lighting, and display. For large installations, we can arrange professional installation services in major cities. We're always available for consultation to ensure your piece is displayed beautifully and safely.",
  
  corporate: "We work with corporate clients, interior designers, and architects to create statement pieces for offices, hotels, restaurants, and public spaces. We offer volume discounts for multiple pieces, custom sizing to fit specific spaces, and can develop exclusive designs aligned with your brand values. Our corporate clients appreciate the conversation-starting nature of our work and its connection to sustainability.",
  
  artist: "ARTILORA was founded by an artist who found profound meaning in the discarded and overlooked. What began as a personal meditation on nature's resilience has grown into a studio dedicated to revealing the hidden beauty in aerial roots. Every piece carries the artist's deep reverence for natural forms and belief that true art emerges from listening, not imposing.",
  
  sustainability: "Sustainability is at our core. We source materials exclusively from naturally fallen branches, storm damage, and necessary pruning - never harming living trees. We use non-toxic, eco-friendly preservation treatments. Our packaging materials are recyclable or biodegradable. We partner with reforestation projects, planting three trees for every sculpture sold. Art and environmental responsibility are inseparable in our practice.",
  
  dimensions: "Our sculptures range from intimate desk pieces (6-12 inches) to dramatic statement installations (4-6 feet). Most popular sizes are medium pieces (18-30 inches) perfect for shelves, mantels, or side tables. We can provide exact dimensions and weight for any piece you're interested in. Custom sizing is available for commissioned works.",
  
  delivery: "Delivery timelines: Domestic (India) 3-5 business days, International 7-14 business days. We ship via trusted carriers with full tracking and insurance. Signature required upon delivery. If you're not satisfied, we offer a 14-day return policy (return shipping at buyer's expense). Damaged items are fully covered by our insurance - we'll replace or refund immediately.",
  
  contact: "Reach us at <strong>+91 9447 166 189</strong> (WhatsApp available) or <strong>artilora@gmail.com</strong>. We typically respond within 24 hours. For urgent inquiries, WhatsApp is fastest. We're based in India but serve clients worldwide. Schedule a video call to discuss custom projects or see pieces in detail.",
  
  gallery: "Visit our Gallery page to explore our full collection of available sculptures. Each piece includes detailed photos, dimensions, materials, and the story behind its creation. You can also take a Virtual Studio Tour to see our creative process and works in progress. New pieces are added regularly.",
  
  payment: "We accept international credit cards, PayPal, bank transfers, and for Indian clients, UPI and NEFT. All transactions are secure and encrypted. For custom commissions, we require 40% deposit to begin work, 40% at completion preview, and 20% before shipping. Payment plans available for purchases over $2000."
}

const openChat = () => {
  isOpen.value = true
  chatOpenTime = Date.now()
  
  // Track chat open event
  analytics.trackChatOpen()
  
  if (messages.value.length === 0) {
    addAIMessage("Welcome to the Artilorian Counsel. We are here to guide you through the world of aerial root sculptures—answering questions about materials, shipping, pricing, and the philosophy behind each creation. How may we assist you today?")
  }
}

const closeChat = () => {
  isOpen.value = false
  
  // Track chat close event with session data
  const sessionDuration = Math.round((Date.now() - chatOpenTime) / 1000) // in seconds
  analytics.trackChatClose(userMessageCount, sessionDuration)
}

const sendMessage = (text) => {
  // Track suggestion click
  analytics.trackChatSuggestion(text)
  
  userInput.value = text
  sendUserMessage()
}

const sendUserMessage = () => {
  if (!userInput.value.trim()) return
  
  const message = userInput.value
  userMessageCount++
  
  // Track user message
  analytics.trackChatMessage(message, userMessageCount)
  
  addUserMessage(message)
  userInput.value = ''
  showSuggestions.value = false
  
  // Simulate AI thinking
  isTyping.value = true
  setTimeout(() => {
    const response = generateResponse(message)
    isTyping.value = false
    addAIMessage(response)
  }, 1000 + Math.random() * 1000)
}

const addUserMessage = (text) => {
  messages.value.push({
    type: 'user',
    text: text,
    time: getCurrentTime()
  })
  scrollToBottom()
}

const addAIMessage = (text) => {
  messages.value.push({
    type: 'ai',
    text: text,
    time: getCurrentTime()
  })
  scrollToBottom()
}

const generateResponse = (input) => {
  const lowerInput = input.toLowerCase()
  
  // Greetings
  if (lowerInput.includes('hello') || lowerInput.includes('hi') || lowerInput.includes('hey')) {
    return "Hello! I'm here to help you explore Artilora's unique aerial root sculptures. What would you like to know?"
  }
  
  // Gratitude
  if (lowerInput.includes('thank')) {
    return "You're very welcome! Feel free to ask if you have any other questions about our sculptures or Artilora."
  }
  
  // Primus
  if (lowerInput.includes('primus')) {
    return knowledgeBase.primus
  }
  
  // Sculptures & Collection
  if (lowerInput.includes('sculpture') || lowerInput.includes('collection') || lowerInput.includes('pieces') || 
      lowerInput.includes('comfort') || lowerInput.includes('darkness') || lowerInput.includes('feminine') || 
      lowerInput.includes('masculine') || lowerInput.includes('101') || lowerInput.includes('102') || 
      lowerInput.includes('103') || lowerInput.includes('104') || lowerInput.includes('105')) {
    return knowledgeBase.sculptures
  }
  
  // Materials
  if (lowerInput.includes('material') || lowerInput.includes('wood') || lowerInput.includes('root') || 
      lowerInput.includes('banyan') || lowerInput.includes('ficus')) {
    return knowledgeBase.materials
  }
  
  // Shipping & Delivery
  if (lowerInput.includes('ship') || lowerInput.includes('deliver') || lowerInput.includes('international') || 
      lowerInput.includes('tracking') || lowerInput.includes('package')) {
    return knowledgeBase.shipping + "<br><br>" + knowledgeBase.delivery
  }
  
  // Process & Creation
  if (lowerInput.includes('process') || lowerInput.includes('how') || lowerInput.includes('make') || 
      lowerInput.includes('create') || lowerInput.includes('craft')) {
    return knowledgeBase.process
  }
  
  // Pricing & Payment
  if (lowerInput.includes('price') || lowerInput.includes('cost') || lowerInput.includes('expensive') || 
      lowerInput.includes('payment') || lowerInput.includes('pay')) {
    return knowledgeBase.pricing + "<br><br>" + knowledgeBase.payment
  }
  
  // Custom Orders & Commissions
  if (lowerInput.includes('custom') || lowerInput.includes('commission') || lowerInput.includes('order') || 
      lowerInput.includes('bespoke')) {
    return knowledgeBase.custom
  }
  
  // Care & Maintenance
  if (lowerInput.includes('care') || lowerInput.includes('maintain') || lowerInput.includes('clean') || 
      lowerInput.includes('preserve')) {
    return knowledgeBase.care
  }
  
  // Philosophy & About
  if (lowerInput.includes('philosophy') || lowerInput.includes('artilora') || lowerInput.includes('about') || 
      lowerInput.includes('story') || lowerInput.includes('meaning')) {
    return knowledgeBase.philosophy
  }
  
  // Awards & Recognition
  if (lowerInput.includes('award') || lowerInput.includes('recognition') || lowerInput.includes('prize') || 
      lowerInput.includes('honor')) {
    return knowledgeBase.awards
  }
  
  // Exhibitions & Gallery
  if (lowerInput.includes('exhibit') || lowerInput.includes('gallery') || lowerInput.includes('show') || 
      lowerInput.includes('display') || lowerInput.includes('view')) {
    return knowledgeBase.exhibitions + "<br><br>" + knowledgeBase.gallery
  }
  
  // Installation
  if (lowerInput.includes('install') || lowerInput.includes('mount') || lowerInput.includes('hang') || 
      lowerInput.includes('placement')) {
    return knowledgeBase.installation
  }
  
  // Corporate & Business
  if (lowerInput.includes('corporate') || lowerInput.includes('business') || lowerInput.includes('office') || 
      lowerInput.includes('hotel') || lowerInput.includes('commercial')) {
    return knowledgeBase.corporate
  }
  
  // Artist & Story
  if (lowerInput.includes('artist') || lowerInput.includes('founder') || lowerInput.includes('creator') || 
      lowerInput.includes('who made')) {
    return knowledgeBase.artist
  }
  
  // Sustainability & Environment
  if (lowerInput.includes('sustain') || lowerInput.includes('eco') || lowerInput.includes('environment') || 
      lowerInput.includes('green') || lowerInput.includes('ethical')) {
    return knowledgeBase.sustainability
  }
  
  // Dimensions & Size
  if (lowerInput.includes('size') || lowerInput.includes('dimension') || lowerInput.includes('big') || 
      lowerInput.includes('small') || lowerInput.includes('large') || lowerInput.includes('height') || 
      lowerInput.includes('width')) {
    return knowledgeBase.dimensions
  }
  
  // Contact Information
  if (lowerInput.includes('contact') || lowerInput.includes('email') || lowerInput.includes('phone') || 
      lowerInput.includes('whatsapp') || lowerInput.includes('reach')) {
    return knowledgeBase.contact
  }
  
  // Default response with comprehensive menu
  return "That's a great question! I can help you with information about:<br><br>• <strong>Sculptures</strong> - Our collection and signature pieces<br>• <strong>Materials</strong> - Aerial roots and natural sourcing<br>• <strong>Pricing & Payment</strong> - Costs and payment options<br>• <strong>Custom Orders</strong> - Commissions and bespoke work<br>• <strong>Shipping</strong> - International delivery and tracking<br>• <strong>Installation</strong> - Mounting and placement guidance<br>• <strong>Care</strong> - Maintenance and preservation<br>• <strong>Sustainability</strong> - Our eco-friendly practices<br>• <strong>Awards & Exhibitions</strong> - Recognition and gallery shows<br>• <strong>Corporate Orders</strong> - Business and commercial projects<br><br>You can also contact us directly at <strong>+91 9447 166 189</strong> or <strong>artilora@gmail.com</strong> for personalized assistance."
}

const getCurrentTime = () => {
  const now = new Date()
  return now.toLocaleTimeString('en-GB', { hour: '2-digit', minute: '2-digit', hour12: false })
}

const scrollToBottom = () => {
  nextTick(() => {
    if (messagesContainer.value) {
      messagesContainer.value.scrollTop = messagesContainer.value.scrollHeight
    }
  })
}
</script>

<style scoped>
.ai-consultant {
  position: fixed;
  bottom: 30px;
  right: 10px;
  z-index: 9999;
  font-family: Arial, sans-serif;
}

/* Chat Button */
.chat-button {
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background: linear-gradient(135deg, #FFD700, #FFA500);
  border: none;
  color: #001F3F;
  cursor: pointer;
  box-shadow: 0 8px 24px rgba(255, 215, 0, 0.4);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  transition: all 0.3s ease;
}

.chat-button:hover {
  transform: scale(1.1);
  box-shadow: 0 12px 32px rgba(255, 215, 0, 0.6);
}

.pulse-ring {
  position: absolute;
  width: 100%;
  height: 100%;
  border: 3px solid #FFD700;
  border-radius: 50%;
  animation: pulse 2s infinite;
}

@keyframes pulse {
  0% {
    transform: scale(1);
    opacity: 1;
  }
  100% {
    transform: scale(1.5);
    opacity: 0;
  }
}

/* Chat Window */
.chat-window {
  width: 360px;
  height: 460px;
  background: rgba(0, 31, 63, 0.25);
  backdrop-filter: blur(8px);
  border: 2px solid rgba(255, 215, 0, 0.3);
  border-radius: 20px;
  box-shadow: 0 12px 48px rgba(0, 0, 0, 0.3);
  display: flex;
  flex-direction: column;
  overflow: hidden;
  font-family: Arial, sans-serif;
}

/* Header */
.chat-header {
  background: linear-gradient(135deg, rgba(0,31,63,0.5), rgba(0,51,102,0.5));
  color: #FFFFFF;
  padding: 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.header-content {
  display: flex;
  align-items: center;
  gap: 12px;
}

.ai-avatar {
  width: 45px;
  height: 45px;
  background: #FFD700;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #001F3F;
}

.chat-header h3 {
  margin: 0;
  font-size: 15px;
  font-weight: bold;
  font-family: Arial, sans-serif;
}

.status {
  margin: 0;
  font-size: 11px;
  opacity: 0.8;
  font-family: Arial, sans-serif;
}

.close-btn {
  background: transparent;
  border: none;
  color: #FFFFFF;
  cursor: pointer;
  padding: 8px;
  border-radius: 50%;
  transition: background 0.3s;
}

.close-btn:hover {
  background: rgba(255, 255, 255, 0.1);
}

/* Messages */
.chat-messages {
  flex: 1;
  overflow-y: auto;
  padding: 20px;
  background: transparent;
}

.message {
  margin-bottom: 16px;
  display: flex;
}

.message.user {
  justify-content: flex-end;
}

.message.ai {
  justify-content: flex-start;
}

.message-content {
  max-width: 90%;
  padding: 12px 16px;
  border-radius: 16px;
  position: relative;
}

.message.user .message-content {
  background: linear-gradient(135deg, #FFD700, #FFA500);
  color: #001F3F;
  border-bottom-right-radius: 4px;
}

.message.ai .message-content {
  background: rgba(255, 215, 0, 0.15);
  color: #FFFFFF;
  border: 1px solid rgba(255, 215, 0, 0.3);
  border-bottom-left-radius: 4px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
}

.message-content p {
  margin: 0;
  font-size: 13px;
  line-height: 1.5;
  font-family: Arial, sans-serif;
}

.message-time {
  font-size: 10px;
  opacity: 0.6;
  margin-top: 4px;
  display: block;
}

/* Typing Indicator */
.typing-dots {
  display: flex;
  gap: 4px;
  padding: 8px 0;
}

.typing-dots span {
  width: 8px;
  height: 8px;
  background: #FFD700;
  border-radius: 50%;
  animation: typing 1.4s infinite;
}

.typing-dots span:nth-child(2) {
  animation-delay: 0.2s;
}

.typing-dots span:nth-child(3) {
  animation-delay: 0.4s;
}

@keyframes typing {
  0%, 60%, 100% {
    transform: translateY(0);
    opacity: 0.4;
  }
  30% {
    transform: translateY(-10px);
    opacity: 1;
  }
}

/* Quick Suggestions */
.quick-suggestions {
  padding: 12px 20px;
  background: rgba(0, 0, 0, 0.1);
  border-top: 1px solid rgba(255, 215, 0, 0.2);
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.suggestion-btn {
  padding: 8px 14px;
  background: rgba(255, 215, 0, 0.1);
  border: 1px solid rgba(255, 215, 0, 0.3);
  border-radius: 20px;
  font-size: 11px;
  cursor: pointer;
  transition: all 0.3s;
  color: #FFD700;
  font-family: Arial, sans-serif;
}

.suggestion-btn:hover {
  background: #FFD700;
  border-color: #FFD700;
  transform: translateY(-2px);
}

/* Input */
.chat-input {
  padding: 16px 20px;
  background: rgba(0, 0, 0, 0.15);
  border-top: 1px solid rgba(255, 215, 0, 0.2);
  display: flex;
  gap: 12px;
}

.chat-input input {
  flex: 1;
  padding: 12px 16px;
  border: 1px solid rgba(255, 215, 0, 0.3);
  background: rgba(0, 0, 0, 0.2);
  color: #FFFFFF;
  border-radius: 24px;
  font-size: 14px;
  outline: none;
  font-family: Arial, sans-serif;
}

.chat-input input::placeholder {
  color: rgba(255, 255, 255, 0.5);
}

.chat-input input:focus {
  border-color: #FFD700;
}

.chat-input button {
  width: 44px;
  height: 44px;
  background: linear-gradient(135deg, #FFD700, #FFA500);
  border: none;
  border-radius: 50%;
  color: #001F3F;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: all 0.3s;
}

.chat-input button:hover:not(:disabled) {
  transform: scale(1.1);
  box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);
}

.chat-input button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .chat-window {
    width: calc(100vw - 40px);
    height: calc(100vh - 100px);
    max-width: 400px;
  }
  
  .ai-consultant {
    bottom: 20px;
    right: 20px;
  }
  
  .chat-button {
    width: 60px;
    height: 60px;
  }
}
</style>
