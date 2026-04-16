<script setup>
const handleNewsletter = () => {
  // Newsletter subscription logic would go here
  alert('Thank you for subscribing to our newsletter!')
}

const openTestimonials = () => {
  // Emit event to open testimonials panel
  if (process.client) {
    window.dispatchEvent(new CustomEvent('open-testimonials'))
  }
}
</script>

<template>
  <footer class="py-12 md:py-16 relative overflow-hidden" style="background-color: #001F3F; color: #FFFFFF;">
    <!-- Top horizontal strips -->
    <div class="absolute top-0 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    <div class="absolute top-2 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    <div class="absolute top-4 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    <div class="absolute top-6 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    <div class="absolute top-8 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    <div class="absolute top-10 left-0 right-0" style="height: 2px; background-color: rgba(255,255,255,0.3);"></div>
    
    <!-- Grid pattern removed - now using global grid from app.vue -->
    
    <div class="container mx-auto px-4 md:px-6 relative z-10">
      <!-- Glittering Headline at Top Center -->
      <div class="text-center mb-12 md:mb-16">
        <div class="scarlet-foundation-headline">
          <div class="headline-ornament-left-scarlet"></div>
          <div class="headline-content-scarlet">
            <span class="headline-star-scarlet">✦</span>
            <h2 class="headline-text-scarlet">The Sapphire Structural Foundation</h2>
            <span class="headline-star-scarlet">✦</span>
          </div>
          <div class="headline-ornament-right-scarlet"></div>
        </div>
      </div>
      
      <div class="grid grid-cols-1 md:grid-cols-2 gap-10 md:gap-12">
        <!-- Links -->
        <div class="space-y-3 md:space-y-4 text-center">
          <div class="explore-collection-box">
            <h4 class="text-lg md:text-xl" style="font-family: 'Bradley Hand ITC', cursive; font-weight: bold; color: #FFFFFF;">Explore The Collection</h4>
          </div>
          <div class="text-lg md:text-xl space-y-0" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">
            <p><NuxtLink to="/gallery" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Walk Through The Gallery</NuxtLink></p>
            <p><NuxtLink to="/awards" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Awards & Recognitions</NuxtLink></p>
            <p><button @click="openTestimonials" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF; background: none; border: none; cursor: pointer; font-family: 'Bradley Hand ITC', cursive; font-size: inherit;">Share Your Thoughts</button></p>
            <p><NuxtLink to="/studio" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Virtual Studio Tour</NuxtLink></p>
            <p><NuxtLink to="/about" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Meet The Artist</NuxtLink></p>
            <p><NuxtLink to="/contact" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Get In Touch</NuxtLink></p>
            <p><NuxtLink to="/" class="hover:opacity-80 transition-colors touch-manipulation inline-block" style="color: #FFFFFF;">Portico</NuxtLink></p>
          </div>
        </div>

        <!-- Newsletter -->
        <div class="space-y-3 md:space-y-4 text-center">
          <div class="explore-collection-box mx-auto">
            <h4 class="text-lg md:text-xl" style="font-family: 'Bradley Hand ITC', cursive; font-weight: bold; color: #FFFFFF;">Stay In Touch</h4>
          </div>
          <div class="text-base md:text-lg px-4 md:px-0 space-y-0" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">
            <p>Become a part of the pulse where</p>
            <p>sculptures are reborn through</p>
            <p class="reincarnations-text">REINCARNATIONS.</p>
            <p>Sculptures differ from humans,</p>
            <p>for they carry their own timeless pulses—</p>
            <p>each pulse shaping a sculpturism that belongs to</p>
            <p>no one but itself. And like the eternal Phoenix that surrenders</p>
            <p>to the flame only to rise radiant from its own ashes, every sculpture</p>
            <p style="white-space: nowrap;">surrenders&nbsp;moves&nbsp;through&nbsp;a&nbsp;sacred&nbsp;cycle&nbsp;of&nbsp;dissolution&nbsp;and&nbsp;rebirth,&nbsp;awakening</p>
            <p>into a form touched by mystery, power & immortality and grace eternal.</p>
          </div>
          <form class="flex flex-col sm:flex-row gap-2 justify-center px-4 md:px-0" @submit.prevent="handleNewsletter">
            <label for="newsletter-email" class="sr-only">Email address</label>
            <input id="newsletter-email" type="email" placeholder="Your email Address" required class="border px-4 py-2 rounded text-base md:text-lg focus:outline-none w-full sm:max-w-xs touch-manipulation placeholder-white" style="font-family: 'Bradley Hand ITC', cursive; background-color: rgba(255,255,255,0.1); border-color: rgba(255,255,255,0.3); color: #FFFFFF; --tw-placeholder-opacity: 1;" />
            <button type="submit" class="px-4 py-2 rounded text-base md:text-lg font-bold hover:opacity-80 transition-colors touch-manipulation whitespace-nowrap" style="font-family: 'Bradley Hand ITC', cursive; background-color: #FFFFFF; color: #8B0000;">
              Join the Journey
            </button>
          </form>
        </div>
      </div>

      <div class="mt-10 md:mt-12 pt-6 md:pt-8 text-center space-y-4" style="color: #FFFFFF; font-family: 'Bradley Hand ITC', cursive;">
        <!-- Social Media Icons -->
        <div class="flex justify-center gap-4 mb-4">
          <a href="https://www.facebook.com/artilora" target="_blank" rel="noopener noreferrer" class="footer-social-icon facebook" title="Facebook">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
          </a>
          <a href="https://www.instagram.com/artilora" target="_blank" rel="noopener noreferrer" class="footer-social-icon instagram" title="Instagram">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
          </a>
          <a href="https://twitter.com/artilora" target="_blank" rel="noopener noreferrer" class="footer-social-icon twitter" title="Twitter">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/></svg>
          </a>
          <a href="https://www.linkedin.com/company/artilora" target="_blank" rel="noopener noreferrer" class="footer-social-icon linkedin" title="LinkedIn">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/></svg>
          </a>
          <a href="https://www.youtube.com/@artilora" target="_blank" rel="noopener noreferrer" class="footer-social-icon youtube" title="YouTube">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
          </a>
          <a href="https://wa.me/1234567890" target="_blank" rel="noopener noreferrer" class="footer-social-icon whatsapp" title="WhatsApp">
            <svg viewBox="0 0 24 24" fill="currentColor"><path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893a11.821 11.821 0 00-3.48-8.413Z"/></svg>
          </a>
        </div>
        
        <p class="text-sm font-bold" style="color: #FFD700;">Artilora – Est. 2026</p>
        <p class="text-xs">&copy; {{ new Date().getFullYear() }} Artilora. All rights reserved.</p>
      </div>
    </div>
  </footer>
</template>

<style scoped>
input::placeholder {
  color: #FFFFFF !important;
  opacity: 1 !important;
}

/* ========== SCARLET FOUNDATION HEADLINE ========== */
.scarlet-foundation-headline {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
  animation: headlineFloat 4s ease-in-out infinite;
}

.headline-ornament-left-scarlet,
.headline-ornament-right-scarlet {
  width: 100px;
  height: 3px;
  background: linear-gradient(90deg, transparent, #FFD700, #FFF);
  animation: ornamentShimmer 3s ease-in-out infinite alternate;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.6);
}

.headline-ornament-right-scarlet {
  background: linear-gradient(90deg, #FFF, #FFD700, transparent);
}

.headline-content-scarlet {
  display: flex;
  align-items: center;
  gap: 16px;
  padding: 16px 32px;
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.2), rgba(255, 255, 255, 0.1));
  border: 3px solid #FFD700;
  border-radius: 60px;
  box-shadow: 
    0 0 30px rgba(255, 215, 0, 0.5),
    inset 0 0 20px rgba(255, 215, 0, 0.2),
    0 8px 20px rgba(0, 0, 0, 0.4);
  backdrop-filter: blur(8px);
  position: relative;
  overflow: hidden;
}

.headline-content-scarlet::before {
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
  animation: shimmerSweep 3s linear infinite;
}

.headline-star-scarlet {
  font-size: 28px;
  color: #FFD700;
  animation: starTwinkle 2s ease-in-out infinite;
  filter: drop-shadow(0 0 8px rgba(255, 215, 0, 0.8));
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
}

.headline-text-scarlet {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 28px;
  font-weight: 900;
  color: #FFFFFF;
  text-shadow: 
    2px 2px 4px rgba(0, 0, 0, 0.3);
  letter-spacing: 2px;
  white-space: nowrap;
  position: relative;
  z-index: 1;
}

@keyframes headlineFloat {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-5px);
  }
}

@keyframes ornamentShimmer {
  0% {
    opacity: 0.6;
    transform: scaleX(1);
  }
  100% {
    opacity: 1;
    transform: scaleX(1.2);
  }
}

@keyframes shimmerSweep {
  0% {
    transform: translateX(-100%) translateY(-100%) rotate(45deg);
  }
  100% {
    transform: translateX(100%) translateY(100%) rotate(45deg);
  }
}

@keyframes starTwinkle {
  0%, 100% {
    opacity: 1;
    transform: scale(1) rotate(0deg);
  }
  50% {
    opacity: 0.7;
    transform: scale(1.2) rotate(180deg);
  }
}

@keyframes textGlitter {
  0%, 100% {
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
  }
  50% {
    text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.4);
  }
}

@media (max-width: 768px) {
  .headline-ornament-left-scarlet,
  .headline-ornament-right-scarlet {
    width: 50px;
  }
  
  .headline-text-scarlet {
    font-size: 20px;
  }
  
  .headline-star-scarlet {
    font-size: 20px;
  }
  
  .headline-content-scarlet {
    padding: 12px 20px;
    gap: 10px;
  }
}

.explore-collection-box {
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.3), rgba(139, 0, 0, 0.4));
  border: 3px solid #FFD700;
  border-radius: 12px;
  padding: 12px 24px;
  box-shadow: 
    0 0 20px rgba(255, 215, 0, 0.4),
    0 8px 16px rgba(0, 0, 0, 0.3),
    inset 0 0 15px rgba(255, 215, 0, 0.1);
  backdrop-filter: blur(5px);
  animation: floatBox 3s ease-in-out infinite;
  position: relative;
  display: inline-block;
  min-width: 250px;
  text-align: center;
}

.explore-collection-box::before {
  content: '';
  position: absolute;
  inset: -5px;
  border-radius: 14px;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.3), transparent 70%);
  animation: glowPulse 2s ease-in-out infinite alternate;
  z-index: -1;
}

@keyframes floatBox {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-8px);
  }
}

@keyframes glowPulse {
  0% {
    opacity: 0.5;
  }
  100% {
    opacity: 1;
  }
}

.reincarnations-text {
  font-size: 1.15em !important;
  font-weight: 900 !important;
  color: #FFD700 !important;
  text-shadow: 
    0 0 10px rgba(255, 215, 0, 0.8),
    0 0 20px rgba(255, 215, 0, 0.6),
    0 0 30px rgba(255, 215, 0, 0.4),
    2px 2px 4px rgba(0, 0, 0, 0.8);
  letter-spacing: 1.5px;
  animation: textGlitter 2s ease-in-out infinite;
  margin: 8px 0 !important;
}

.reincarnations-text:last-of-type {
  letter-spacing: 3.5px;
}

@media (max-width: 768px) {
  .reincarnations-text {
    font-size: 1.05em !important;
    letter-spacing: 1px;
  }
  
  .reincarnations-text:last-of-type {
    letter-spacing: 2.5px;
  }
}

/* ========== FOOTER SOCIAL ICONS ========== */
.footer-social-icon {
  width: 44px;
  height: 44px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
}

.footer-social-icon svg {
  width: 22px;
  height: 22px;
  position: relative;
  z-index: 2;
  transition: transform 0.3s ease;
}

.footer-social-icon::before {
  content: '';
  position: absolute;
  inset: 0;
  border-radius: 50%;
  opacity: 0;
  transition: opacity 0.3s ease;
  z-index: 1;
}

.footer-social-icon:hover {
  transform: translateY(-5px) scale(1.1);
}

.footer-social-icon:hover svg {
  transform: scale(1.15);
}

.footer-social-icon:hover::before {
  opacity: 1;
}

.footer-social-icon.facebook {
  background: rgba(24, 119, 242, 0.2);
  color: #1877F2;
  border: 2px solid rgba(24, 119, 242, 0.3);
}

.footer-social-icon.facebook::before {
  background: #1877F2;
}

.footer-social-icon.facebook:hover {
  border-color: #1877F2;
  box-shadow: 0 6px 20px rgba(24, 119, 242, 0.5);
}

.footer-social-icon.instagram {
  background: rgba(225, 48, 108, 0.2);
  color: #E1306C;
  border: 2px solid rgba(225, 48, 108, 0.3);
}

.footer-social-icon.instagram::before {
  background: linear-gradient(45deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
}

.footer-social-icon.instagram:hover {
  border-color: #E1306C;
  box-shadow: 0 6px 20px rgba(225, 48, 108, 0.5);
}

.footer-social-icon.twitter {
  background: rgba(29, 161, 242, 0.2);
  color: #1DA1F2;
  border: 2px solid rgba(29, 161, 242, 0.3);
}

.footer-social-icon.twitter::before {
  background: #1DA1F2;
}

.footer-social-icon.twitter:hover {
  border-color: #1DA1F2;
  box-shadow: 0 6px 20px rgba(29, 161, 242, 0.5);
}

.footer-social-icon.linkedin {
  background: rgba(10, 102, 194, 0.2);
  color: #0A66C2;
  border: 2px solid rgba(10, 102, 194, 0.3);
}

.footer-social-icon.linkedin::before {
  background: #0A66C2;
}

.footer-social-icon.linkedin:hover {
  border-color: #0A66C2;
  box-shadow: 0 6px 20px rgba(10, 102, 194, 0.5);
}

.footer-social-icon.youtube {
  background: rgba(255, 0, 0, 0.2);
  color: #FF0000;
  border: 2px solid rgba(255, 0, 0, 0.3);
}

.footer-social-icon.youtube::before {
  background: #FF0000;
}

.footer-social-icon.youtube:hover {
  border-color: #FF0000;
  box-shadow: 0 6px 20px rgba(255, 0, 0, 0.5);
}

.footer-social-icon.whatsapp {
  background: rgba(37, 211, 102, 0.2);
  color: #25D366;
  border: 2px solid rgba(37, 211, 102, 0.3);
}

.footer-social-icon.whatsapp::before {
  background: #25D366;
}

.footer-social-icon.whatsapp:hover {
  border-color: #25D366;
  box-shadow: 0 6px 20px rgba(37, 211, 102, 0.5);
}
</style>
