<template>
  <div class="min-h-screen" style="background-color: #001F3F;">
    <!-- Breadcrumb Navigation -->
    <BreadcrumbNav />
    
    <!-- Hero Section -->
    <div class="relative overflow-hidden">
      <div class="absolute inset-0 opacity-10">
        <div class="absolute top-20 left-10 w-72 h-72 bg-[#8B4513] rounded-full blur-3xl"></div>
        <div class="absolute bottom-20 right-10 w-96 h-96 bg-[#D9A87C] rounded-full blur-3xl"></div>
      </div>
      
      <div class="container mx-auto px-4 md:px-6 py-16 md:py-24 relative z-10">
        <!-- Header -->
        <div class="text-center mb-16 relative">
          <div class="contact-headline-wrapper mb-8">
            <div class="headline-ornament-left-contact"></div>
            <div class="headline-content-contact">
              <h1 class="text-2xl md:text-3xl font-bold tracking-wide headline-text-contact" style="font-family: 'Bradley Hand ITC', cursive;">
                Let us meet where nature creates.
              </h1>
            </div>
            <div class="headline-ornament-right-contact"></div>
          </div>
          <div class="contact-headline-wrapper-secondary mb-6">
            <div class="headline-ornament-left-contact-secondary"></div>
            <div class="headline-content-contact-secondary">
              <p class="text-xl md:text-2xl font-bold tracking-wide headline-text-contact-secondary" style="font-family: 'Bradley Hand ITC', cursive;">
                Born of Nature shaped by art
              </p>
            </div>
            <div class="headline-ornament-right-contact-secondary"></div>
          </div>
          <div class="text-lg max-w-2xl mx-auto leading-relaxed" style="font-family: 'Segoe Print', cursive; color: rgba(255, 255, 255, 0.9); text-shadow: 0 0 6px rgba(255, 215, 0, 0.2);">
            <p>Every masterpiece begins in a quiet conversation.</p>
            <p>If you seek a singular form or wish to wander through organic</p>
            <p>sculpturism, your thoughts and longings are received with care.</p>
          </div>
        </div>

        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 max-w-5xl mx-auto items-stretch">
          
          <!-- Contact Form -->
          <div class="backdrop-blur-sm rounded-2xl p-6 border border-[#FFD700]/60" style="background-color: #001F3F; box-shadow: 8px 8px 20px rgba(0,0,0,0.4), 0 -8px 15px rgba(0,0,0,0.3);">
            <h2 class="text-2xl font-bold mb-6" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5);">
              Share A Thought
            </h2>
            
            <!-- Contact Form - Using Formspree -->
            <!-- To activate: Sign up at formspree.io and replace YOUR_FORM_ID below with your actual form ID -->
            <form 
              action="https://formspree.io/f/YOUR_FORM_ID" 
              method="POST"
              class="space-y-4"
              @submit.prevent="handleSubmit"
            >
              <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                  <label class="block text-white text-base mb-2 font-bold" style="font-family: 'Bradley Hand ITC', cursive; font-size: 16px;">Your Name</label>
                  <input 
                    type="text" 
                    name="name"
                    required
                    class="w-full px-4 py-3 bg-white border-2 border-[#FFD700]/60 rounded-lg focus:outline-none focus:border-[#FFD700] focus:ring-2 focus:ring-[#FFD700]/40 transition-all duration-300"
                    placeholder="Enter your name"
                    style="font-family: 'Bradley Hand ITC', cursive; color: #000000; font-size: 16px; font-weight: bold;"
                  />
                </div>
                <div>
                  <label class="block text-white text-base mb-2 font-bold" style="font-family: 'Bradley Hand ITC', cursive; font-size: 16px;">Email Address</label>
                  <input 
                    type="email" 
                    name="email"
                    required
                    class="w-full px-4 py-3 bg-white border-2 border-[#FFD700]/60 rounded-lg focus:outline-none focus:border-[#FFD700] focus:ring-2 focus:ring-[#FFD700]/40 transition-all duration-300"
                    placeholder="your@email.com"
                    style="font-family: 'Bradley Hand ITC', cursive; color: #000000; font-size: 16px; font-weight: bold;"
                  />
                </div>
              </div>
              
              <div>
                <label class="block text-white text-base mb-2 font-bold" style="font-family: 'Bradley Hand ITC', cursive; font-size: 16px;">Subject</label>
                <select 
                  name="subject"
                  class="w-full px-4 py-3 bg-white border-2 border-[#FFD700]/60 rounded-lg focus:outline-none focus:border-[#FFD700] focus:ring-2 focus:ring-[#FFD700]/40 transition-all duration-300"
                  style="font-family: 'Bradley Hand ITC', cursive; color: #000000; font-size: 16px; font-weight: bold;"
                >
                  <option value="general">General Enquiry</option>
                  <option value="commission">Commission a Piece</option>
                  <option value="exhibition">Exhibition Inquiry</option>
                  <option value="studio-visit">Studio Visit Request</option>
                  <option value="collaboration">Collaboration</option>
                </select>
              </div>
              
              <div>
                <label class="block text-white text-base mb-2 font-bold" style="font-family: 'Bradley Hand ITC', cursive; font-size: 16px;">Your Message</label>
                <textarea 
                  name="message"
                  required
                  rows="4"
                  class="w-full px-4 py-3 bg-white border-2 border-[#FFD700]/60 rounded-lg focus:outline-none focus:border-[#FFD700] focus:ring-2 focus:ring-[#FFD700]/40 transition-all duration-300 resize-none"
                  placeholder="Share your thoughts, ideas, or inquiries..."
                  style="font-family: 'Bradley Hand ITC', cursive; color: #000000; font-size: 16px; font-weight: bold;"
                ></textarea>
              </div>
              
              <button 
                type="submit"
                class="w-full py-3 bg-gradient-to-r from-[#FFD700] to-[#FFA500] text-[#001F3F] rounded-lg font-bold tracking-wide hover:shadow-lg hover:shadow-[#FFD700]/50 transform hover:-translate-y-0.5 transition-all duration-300"
                style="font-family: 'Bradley Hand ITC', cursive; font-size: 18px;"
              >
                Send Kindly
              </button>
            </form>
          </div>

          <!-- Contact Info Cards -->
          <div class="flex flex-col justify-between h-full space-y-4">

            <!-- Email Card -->
            <div class="backdrop-blur-sm rounded-2xl p-5 border border-[#FFD700]/60 hover:shadow-2xl transition-all duration-300 flex-1" style="background-color: #001F3F; box-shadow: 8px 8px 20px rgba(0,0,0,0.4), 0 -8px 15px rgba(0,0,0,0.3);">
              <div class="flex items-start gap-4">
                <div class="w-14 h-14 bg-gradient-to-br from-[#FFD700] via-[#FFA500] to-[#FF8C00] rounded-xl flex items-center justify-center flex-shrink-0 shadow-lg" style="box-shadow: 0 4px 15px rgba(255, 215, 0, 0.5);">
                  <svg class="w-8 h-8 text-white" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M15.5 1h-8C6.12 1 5 2.12 5 3.5v17C5 21.88 6.12 23 7.5 23h8c1.38 0 2.5-1.12 2.5-2.5v-17C18 2.12 16.88 1 15.5 1zm-4 21c-.83 0-1.5-.67-1.5-1.5s.67-1.5 1.5-1.5 1.5.67 1.5 1.5-.67 1.5-1.5 1.5zm4.5-4H7V4h9v14z"/>
                  </svg>
                </div>
                <div>
                  <h3 class="text-xl font-bold text-[#FFD700] mb-2" style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 15px rgba(255, 215, 0, 0.5);">Email Correspondence</h3>
                  <p class="text-white font-bold text-lg mb-2" style="font-family: 'Bradley Hand ITC', cursive;">Official Desk</p>
                  <p class="text-[#FFD700] text-lg mb-2 font-bold" style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 10px rgba(255, 215, 0, 0.6);">info@artilora.art</p>
                  <p class="text-white/90 text-base mt-3" style="font-family: 'Bradley Hand ITC', cursive;">
                    For general enquiries, gallery information, orders, and exhibitions
                  </p>
                </div>
              </div>
            </div>

            <!-- Studio Card -->
            <div class="backdrop-blur-sm rounded-2xl p-4 border border-[#FFD700]/60 hover:shadow-2xl transition-all duration-300 flex-1" style="background-color: #001F3F; box-shadow: 8px 8px 20px rgba(0,0,0,0.4), 0 -8px 15px rgba(0,0,0,0.3);">
              <div class="flex items-start gap-3">
                <div class="w-10 h-10 bg-gradient-to-br from-[#FFD700] to-[#FFA500] rounded-xl flex items-center justify-center flex-shrink-0">
                  <svg class="w-5 h-5 text-[#001F3F]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"/>
                  </svg>
                </div>
                <div>
                  <h3 class="text-base font-bold text-[#FFD700] mb-1" style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);">The Studio</h3>
                  <p class="text-white font-bold text-sm mb-1" style="font-family: 'Bradley Hand ITC', cursive;">The Artilora Studio</p>
                  <p class="text-white/90 text-xs mb-1" style="font-family: 'Bradley Hand ITC', cursive;">Softly known as "Arty"</p>
                  <p class="text-white text-sm font-bold" style="font-family: 'Bradley Hand ITC', cursive;">Kerala, India</p>
                  <p class="text-white/90 text-sm mt-2 leading-relaxed" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.6;">
                    All visits are by appointment only, with a minimum of two weeks' notice required. This ensures our team can fully prepare to welcome you in the manner you deserve.
                  </p>
                </div>
              </div>
            </div>

            <!-- Share a Lasting Connection Card -->
            <div class="backdrop-blur-sm rounded-2xl p-4 border border-[#FFD700]/60 hover:shadow-2xl transition-all duration-300 flex-1" style="background-color: #001F3F; box-shadow: 8px 8px 20px rgba(0,0,0,0.4), 0 -8px 15px rgba(0,0,0,0.3);">
              <div class="flex items-start gap-3">
                <div class="w-10 h-10 bg-gradient-to-br from-[#FFD700] to-[#FFA500] rounded-xl flex items-center justify-center flex-shrink-0">
                  <svg class="w-5 h-5 text-[#001F3F]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"/>
                  </svg>
                </div>
                <div>
                  <h3 class="text-base font-bold text-[#FFD700] mb-1" style="font-family: 'Bradley Hand ITC', cursive; text-shadow: 0 0 10px rgba(255, 215, 0, 0.3);">Share a Lasting Connection</h3>
                  <p class="text-white/90 text-sm leading-relaxed" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.6;">
                    Follow the journey of organic sculpturism and stay connected with Artilora's evolving world of art.
                  </p>
                </div>
              </div>
            </div>

          </div>
        </div>

        <!-- Bottom Quote -->
        <div class="text-center mt-16 pt-12 border-t border-[#D9A87C]/30">
          <!-- Human figure centered above paragraph -->
          <div class="flex justify-center mb-4">
            <img src="/arty_human_transparent.png" alt="" class="w-28 md:w-36 lg:w-44 opacity-80" style="filter: drop-shadow(0 0 12px rgba(139, 0, 0, 0.6)) brightness(1.1) contrast(1.2);" />
          </div>
          <p class="text-lg max-w-2xl mx-auto" style="font-family: 'Segoe Print', cursive; color: rgba(255, 255, 255, 0.9); text-shadow: 0 0 6px rgba(255, 215, 0, 0.2);">
            "Every conversation is a seed. Some bloom as collaborations, some as friendships, and all lead us toward understanding. Life offers many subjects to study. Attend to its daily lessons with sincerity, and walk forward prepared for its quiet examinations."
          </p>
        </div>

      </div>
    </div>
  </div>
</template>

<script setup>
const { trackContactForm } = useAnalytics()

useHead({
  title: 'Contact - Artilora',
  meta: [
    { name: 'description', content: 'Connect with Artilora. Commission a piece, inquire about exhibitions, or share your thoughts. Every conversation is a seed that leads to understanding.' },
    { name: 'keywords', content: 'contact Artilora, commission sculpture, art inquiry, Kerala studio, Soman Jose contact' },
    { property: 'og:title', content: 'Contact - Artilora' },
    { property: 'og:description', content: 'Let us meet where nature creates. Born of Nature shaped by art.' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: 'http://192.168.10.66:3009/contact' },
    { property: 'og:image', content: 'http://192.168.10.66:3009/logo_updated.png' }
  ]
})

// Temporary solution: Open email client if Formspree is not configured
const handleSubmit = (event) => {
  const form = event.target
  const formData = new FormData(form)
  
  // Check if Formspree is configured
  if (form.action.includes('YOUR_FORM_ID')) {
    // Formspree not configured - use mailto as fallback
    const name = formData.get('name')
    const email = formData.get('email')
    const subject = formData.get('subject')
    const message = formData.get('message')
    
    const mailtoLink = `mailto:info@artilora.art?subject=${encodeURIComponent(subject + ' - From ' + name)}&body=${encodeURIComponent('From: ' + name + '\nEmail: ' + email + '\n\nMessage:\n' + message)}`
    
    window.location.href = mailtoLink
    
    // Track contact form submission
    trackContactForm(subject)
    
    // Show alert
    alert('Your email client will open. Please send the message from there.\n\nAlternatively, you can email us directly at: info@artilora.art')
  } else {
    // Formspree is configured - submit normally
    trackContactForm(formData.get('subject'))
    form.submit()
  }
}
</script>

<style scoped>
/* ========== CONTACT PAGE HEADLINE DECORATIONS ========== */
.contact-headline-wrapper {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
  animation: headlineFloat 4s ease-in-out infinite;
}

.headline-ornament-left-contact,
.headline-ornament-right-contact {
  width: 60px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #FFD700, transparent);
  animation: ornamentPulse 3s ease-in-out infinite;
}

.headline-content-contact {
  display: flex;
  align-items: center;
  gap: 15px;
}

.headline-text-contact {
  color: #FFFFFF;
  text-shadow: 0 0 25px rgba(255, 215, 0, 0.5), 0 0 15px rgba(255, 255, 255, 0.3);
  animation: textGlow 3s ease-in-out infinite;
}

.headline-star-contact {
  color: #FFD700;
  font-size: 24px;
  animation: starTwinkle 2s ease-in-out infinite;
  text-shadow: 0 0 15px rgba(255, 215, 0, 0.8);
}

/* Secondary headline */
.contact-headline-wrapper-secondary {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 15px;
  animation: headlineFloat 4.5s ease-in-out infinite;
}

.headline-ornament-left-contact-secondary,
.headline-ornament-right-contact-secondary {
  width: 50px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #FFD700, transparent);
  animation: ornamentPulse 3.5s ease-in-out infinite;
}

.headline-content-contact-secondary {
  display: flex;
  align-items: center;
  gap: 12px;
}

.headline-text-contact-secondary {
  color: #FFFFFF;
  text-shadow: 0 0 20px rgba(255, 215, 0, 0.4), 0 0 10px rgba(255, 255, 255, 0.2);
}

.headline-star-contact-secondary {
  color: #FFD700;
  font-size: 20px;
  animation: starTwinkle 2.5s ease-in-out infinite;
  text-shadow: 0 0 12px rgba(255, 215, 0, 0.7);
}

@keyframes headlineFloat {
  0%, 100% { transform: translateY(0px); }
  50% { transform: translateY(-5px); }
}

@keyframes ornamentPulse {
  0%, 100% { opacity: 0.6; }
  50% { opacity: 1; }
}

@keyframes textGlow {
  0%, 100% { text-shadow: 0 0 25px rgba(255, 215, 0, 0.5), 0 0 15px rgba(255, 255, 255, 0.3); }
  50% { text-shadow: 0 0 35px rgba(255, 215, 0, 0.7), 0 0 20px rgba(255, 255, 255, 0.5); }
}

@keyframes starTwinkle {
  0%, 100% { opacity: 0.7; transform: scale(1); }
  50% { opacity: 1; transform: scale(1.2); }
}
</style>
