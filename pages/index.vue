<template>
  <div class="pb-0 text-white transition-opacity duration-1000" :class="{ 'opacity-0': isLoading, 'opacity-100': !isLoading }" style="margin-top: 0; padding-top: 0; background-color: #001F3F;">

    <!-- Hero Section -->
    <section class="relative h-screen flex items-center overflow-hidden" style="margin-top: 0; padding-top: 0;">
      <!-- Video Background -->
      <VideoBackground 
        video-src="/videos/hero-background.mp4"
        fallback-image="/arty_111_background.png"
        :overlay-opacity="0.75"
      />
      
      <div class="absolute inset-0 w-full h-full flex items-center">
        <!-- Logo and Text - Left side -->
        <div class="relative z-20 w-full md:w-[20%] h-full border-r border-[#FFD700]/20" style="background: transparent; backdrop-filter: blur(4px);">
          <!-- AMBIENT SPOTLIGHT BEHIND LOGO -->
          <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[120%] h-[60%] bg-[radial-gradient(circle,rgba(255,215,0,0.08)_0%,transparent_70%)] blur-3xl rounded-full pointer-events-none z-0"></div>

          <!-- CONTENT CONTAINER - Centered vertically, pushed down -->
          <ScrollAnimated animation="fade-up" :duration="1000">
            <div class="relative z-10 flex flex-col items-center justify-center gap-6 px-4 h-full" style="padding-top: 10vh;">
              <!-- Logo centered -->
              <img src="/logo_updated.png" alt="Artilora Logo" loading="eager" class="h-28 md:h-36 lg:h-40 w-auto object-contain transition-transform duration-700 hover:scale-105" style="filter: drop-shadow(0 10px 20px rgba(0, 0, 0, 0.9));" />
              
              <!-- Artilora name and text grouped together -->
              <div class="flex flex-col items-center relative z-10" style="gap: 0; margin-top: 20px;">
                <!-- Artilora name below logo - BIGGER -->
                <img src="/Artilora_name.png" alt="ARTILORA" loading="eager" class="w-auto object-contain h-[200px] md:h-[240px] lg:h-[280px] max-w-full p-0 m-0" style="filter: drop-shadow(0 8px 16px rgba(0, 0, 0, 0.9)); display: block;" />
                  
                <!-- Sculpted By Nature text - EXTREMELY CLOSE AND VISIBLE -->
                <p style="font-family: 'Bradley Hand ITC', cursive; font-size: 10px; font-weight: bold; color: #FFD700; text-transform: uppercase; letter-spacing: 0.3em; text-shadow: 0 0 20px rgba(255, 215, 0, 1), 0 0 30px rgba(255, 215, 0, 0.8), 0 2px 4px rgba(0, 0, 0, 0.9); margin: -180px 0 0 0; padding: 0; line-height: 1; display: block; position: relative; z-index: 10;">
                  Sculpted By Nature
                </p>
              </div>
            </div>
          </ScrollAnimated>
          
          <!-- Trophies removed as per user request -->

        </div>
        

        
        <!-- Right side - Sculpture Slideshow (80% width) -->
        <div class="hidden md:block w-[80%] h-full">
          <SculptureSlideshow />
        </div>
      </div>

      
    </section>

    <!-- Two narrow horizontal lines with light white shade -->
    <div style="height: 2px; background-color: #F5F5F5; margin: 0; padding: 0;"></div>
    <div style="height: 2px; background-color: #F5F5F5; margin-top: 4px; padding: 0;"></div>

    <!-- PRIMUS - THE BEGINNING SECTION -->
    <section class="pt-8 md:pt-12 pb-16 md:pb-24 text-white relative" style="background-color: #001F3F;">
      
      <div class="container mx-auto px-4 md:px-6 max-w-6xl relative z-10">
        <SectionReveal>
          <ScrollAnimated animation="fade-up" :delay="200">
            <!-- Section Title - Small, quiet, elegant - Made bigger -->
            <div class="text-center mb-1">
              <p class="text-base md:text-lg tracking-widest uppercase" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; letter-spacing: 2px; font-weight: bold;">
                THE BEGINNING
              </p>
            </div>

            <!-- Main Headline - Bradley Hand ITC -->
            <div class="text-center mb-2">
              <h1 class="text-2xl md:text-4xl font-serif" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; letter-spacing: 4px; font-weight: bold;">
                PRIMUS
              </h1>
            </div>

            <!-- Image Placement - Primus -->
            <div class="mb-1 flex justify-center">
              <div class="primus-image-container">
                <img src="/primus_final.png?v=20260216_new" alt="Primus - The Beginning" class="max-w-lg w-full h-auto" style="filter: drop-shadow(0 4px 12px rgba(0,0,0,0.4));" />
              </div>
            </div>
          </ScrollAnimated>

          <!-- Decorative Headline - Where Primus Begins to Speak -->
          <div class="mb-2 flex justify-center items-center gap-4">
            <div class="primus-speaks-headline">
              <div class="headline-ornament-left" style="background: linear-gradient(90deg, transparent, #FFD700, #FFD700);"></div>
              <div class="headline-content" style="background: rgba(0, 31, 63, 0.9); border: 2px solid #FFD700;">
                <span class="headline-text" style="color: #FFFFFF; font-weight: bold; text-shadow: none;">Where Primus Begins to Speak</span>
                </div>
              <div class="headline-ornament-right" style="background: linear-gradient(90deg, #FFD700, #FFD700, transparent);"></div>
            </div>
            <!-- Audio Listen Button - PREMIUM (Ring + Waveform) -->
            <div class="relative flex flex-col items-center gap-2">
              <div class="relative">
                <svg class="circular-progress" width="80" height="80">
                  <circle cx="40" cy="40" r="35" class="progress-bg"></circle>
                  <circle 
                    cx="40" 
                    cy="40" 
                    r="35" 
                    class="progress-ring"
                    :style="{ strokeDashoffset: isSpeaking ? 220 - (220 * audioProgress / 100) : 220 }"
                  ></circle>
                </svg>
                <button @click="speakPrimus" class="listen-button-small" :class="{ 'speaking': isSpeaking }" title="Listen to Primus">
                  
                  <svg v-if="!isSpeaking" viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M3 9v6h4l5 5V4L7 9H3zm13.5 3c0-1.77-1.02-3.29-2.5-4.03v8.05c1.48-.73 2.5-2.25 2.5-4.02zM14 3.23v2.06c2.89.86 5 3.54 5 6.71s-2.11 5.85-5 6.71v2.06c4.01-.91 7-4.49 7-8.77s-2.99-7.86-7-8.77z"/></svg>
                  <svg v-else viewBox="0 0 24 24" width="24" height="24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>
                
                </button>
              </div>
              <div v-if="isSpeaking" class="waveform-container-small">
                <div class="wave-bar-small" v-for="i in 7" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
              </div>
            </div>
          </div>

          <!-- Paragraph Text - Museum-grade with better visibility - Made bigger - Expanded width -->
          <div class="max-w-4xl mx-auto mb-12 md:mb-16 px-2 md:px-4" style="display: flex; flex-direction: column; gap: 1.5rem;">
            <p class="text-lg md:text-xl text-justify" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.7 !important; color: #FFFFFF; font-weight: 300; margin: 0; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 5px rgba(0, 0, 0, 1), -1px -1px 3px rgba(0, 0, 0, 0.8);">
              Primus is more than a sculpture. It is the first inward pause from which ARTILORA emerged. Formed from Aerial Root Sculpture in Ficus benghalensis and shaped through listening rather than force, Primus embodies humility as strength and silence as origin. Neither man nor myth, it kneels in remembrance - returning to the earth that holds all beginnings. This form is not for sale. It remains in the ARTILORA studio as a witness, a compass, and a promise: that every creation begins by bowing to truth.
            </p>
            
            <p class="text-lg md:text-xl text-justify" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.7 !important; color: #FFFFFF; font-weight: 300; margin: 0; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 5px rgba(0, 0, 0, 1), -1px -1px 3px rgba(0, 0, 0, 0.8);">
              It is a moment of stillness made visible - the breath taken before becoming. Shaped from Aerial Root Sculpture in Ficus benghalensis that have known time, weight, and patience, it rises not through force but through listening. In its silence lives endurance; in its posture, reverence. Primus is not offered for ownership. It remains in the ARTILORA studio as a living witness - reminding us that all true creation begins when the soul bows, listens, and allows truth to take form.
            </p>
            
            <p class="text-lg md:text-xl text-justify" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.7 !important; color: #FFFFFF; font-weight: 300; margin: 0; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 5px rgba(0, 0, 0, 1), -1px -1px 3px rgba(0, 0, 0, 0.8);">
              A moment of stillness where form learned to listen before it learned to rise. Shaped through patience rather than force, Primus carries the weight of time and returns gently to the earth that holds all beginnings. In its quiet posture lives endurance, reverence, and the courage to begin without certainty. It stands as a living compass - that every creation begins by honoring the unseen before the visible takes shape.
            </p>
          </div>

          <!-- Decorative Divider before new section -->
          <div class="flex justify-center my-16">
            <div style="width: 200px; height: 3px; background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
          </div>

          <!-- NEW SECTION: Winged Watchers' Scripture -->
          <ScrollAnimated animation="fade-up" :delay="400">
            <!-- Subtitle -->
            <div class="text-center mb-8">
              <p class="text-lg md:text-xl" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; font-weight: bold; text-shadow: 0 0 15px rgba(255, 215, 0, 0.5);">
                Winged Watchers' Scripture
              </p>
            </div>

            <!-- Video Section -->
            <div class="mb-10 flex justify-center">
              <div class="primus-video-container max-w-lg w-full" style="border: 2px solid #FFD700; border-radius: 12px; overflow: hidden; box-shadow: 0 0 20px rgba(255, 215, 0, 0.3); max-height: 220px; display: flex; align-items: center; justify-content: center; background-color: transparent;">
                <video 
                  controls 
                  class="w-full object-contain"
                  style="max-height: 220px; display: block;"
                  poster="/winged_watchers.jpg"
                >
                  <source src="/primus_video.mp4" type="video/mp4">
                  Your browser does not support the video tag.
                </video>
              </div>
            </div>
          </ScrollAnimated>

          <!-- Decorative Headline -->
          <div class="mb-6 flex justify-center items-center gap-4">
            <div class="primus-speaks-headline">
              <div class="headline-ornament-left" style="background: linear-gradient(90deg, transparent, #FFD700, #FFD700);"></div>
              <div class="headline-content" style="background: rgba(0, 31, 63, 0.9); border: 2px solid #FFD700;">
                <span class="headline-text" style="color: #FFFFFF; font-weight: bold; text-shadow: none;">The Sacred Scripture</span>
              </div>
              <div class="headline-ornament-right" style="background: linear-gradient(90deg, #FFD700, #FFD700, transparent);"></div>
            </div>
          </div>

          <!-- Story Text - Beautifully formatted -->
          <div class="max-w-4xl mx-auto mb-12 md:mb-16 px-4 md:px-6">
            <div class="story-content" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); border-radius: 15px; padding: 24px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);">
              
              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                In the primordial silence, before stone recalled its weight or the wind whispered its name, there arose the luminous ancestors of <span style="color: #FFD700; font-weight: bold;">PRIMUS</span>—beings with ears attuned to eternity and wings that kissed the stars.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Not born of flesh, they emerged from the universe's hidden lungs, woven from stardust and the glow of forgotten galaxies. Their wings unfurled like vast, living horizons, veined with celestial fire and iridescent hues, bearing the maps of unborn constellations.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Their long, radiant ears—flowing like silken veils—served as sacred receivers, not mere organs of sound. They gathered the subtle symphony of existence: the hymn of nascent suns, the turning of embryonic worlds, the primal pulse threading through all creation. In their profound listening lay wisdom; in their stillness, divine art.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Eternal guardians of formless realms, they watched over mountains where streams of light dreamed of becoming rivers.
              </p>

              <div class="my-3 flex justify-center">
                <div style="width: 80px; height: 2px; background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
              </div>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFD700; font-weight: bold; font-size: 1.2em;">
                Then dawned the hour of ascension.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                As the first shadow crept upon creation's edge, the winged sentinels converged in the heavenly cradle. Lumara, the primordial ear, led them—raising her majestic wings, her sacred senses attuned to the cosmos's great breath.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                The breath replied.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Light swelled. Silence quivered. A radiant aura enveloped them.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                They ascended as one—not in frenzy, but in sovereign grace, not mere flight, but sacred prayer.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Their wings pulsed in unison, forging a covenant of motion. Their ears trailed like scrolls of illuminated scripture, etching memories into the ether. <span style="color: #FFD700; font-weight: bold;">ARTILORA.</span>
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                In their spiraling rise, the veil between silence and form shattered.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFD700; font-weight: bold; font-size: 1.2em;">
                From this exalted rupture, PRIMUS was born.
              </p>

              <div class="my-3 flex justify-center">
                <div style="width: 80px; height: 2px; background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
              </div>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Not merely form, but eternal legacy.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Its core embodies their unyielding resilience.<br>
                Wisdom dwells within, preserved in the echo of their hearing.<br>
                Freedom encircles it, resonant with their boundless wings.
              </p>

              <p class="text-base md:text-lg text-justify mb-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; color: #FFFFFF; font-weight: 500;">
                Today, <span style="color: #FFD700; font-weight: bold;">PRIMUS</span> stands as sacred testament and threshold—a contemporary sculpture forged from myth, alive in the now. It whispers that every creation begins not with clamor, but with profound hearing; all origins inscribed in the invisible currents of air.
              </p>

              <div class="mt-4 text-center">
                <p class="text-xl md:text-2xl" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; font-weight: bold; text-shadow: 0 0 15px rgba(255, 215, 0, 0.4);">
                  Witness the Ascension.
                </p>
                <p class="text-lg md:text-xl mt-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-weight: 500;">
                  Enter another beginning. Be prepared.
                </p>
              </div>

            </div>
          </div>

          <!-- Subtle Divider Line -->
          <div class="flex justify-center mb-8 md:mb-12">
            <div style="width: 60px; height: 1px; background-color: #FFD700;"></div>
          </div>

          <!-- Quiet closing line -->
          <div class="text-center">
            <p class="text-base md:text-lg" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; letter-spacing: 1px; font-weight: bold;">
              Here, ARTILORA returns to breath.
            </p>
          </div>
        </SectionReveal>
      </div>
    </section>

    <!-- Two narrow horizontal lines with light white shade -->
    <div style="height: 2px; background-color: #F5F5F5; margin: 0; padding: 0;"></div>
    <div style="height: 2px; background-color: #F5F5F5; margin-top: 4px; padding: 0;"></div>

    <!-- Brand Essence -->
    <section class="py-16 md:py-32 relative overflow-hidden" style="background-color: #001F3F;">
      
      <div class="absolute top-0 right-0 w-1/3 h-full bg-artilora-green/5 -skew-x-12 transform translate-x-20 hidden md:block z-0"></div>
      
      <div class="container mx-auto px-4 md:px-6 relative z-10">
        <div class="flex flex-col items-center">
          <div class="w-full max-w-4xl space-y-2 md:space-y-3">
            <ScrollAnimated animation="fade-left" :delay="300">
              <ScrollReveal animation-type="fade-left" :delay="200">
                <div class="flex items-center justify-center gap-4 mb-2">
                  <h2 class="text-3xl md:text-5xl font-sans uppercase text-center" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; font-weight: 300;">THE ESSENCE</h2>
                </div>
                <p class="text-lg md:text-xl leading-relaxed font-light text-justify" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-weight: 300; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 5px rgba(0, 0, 0, 1), -1px -1px 3px rgba(0, 0, 0, 0.8); line-height: 1.8;">
                  At Artilora, we believe nature is the ultimate artist. We work with body, mind, and soul in harmony with the elements, listening to the stories found in the shadows of each sculpture, the patterns of the wood grain, and the curves of weathered roots. By bringing these visions to life, we ensure every piece carries the ancient whisper of the earth and the enduring touch of human passion.
                </p>
              </ScrollReveal>
            </ScrollAnimated>
          </div>
        </div>
      </div>
    </section>

    <!-- Countdown Timer Section -->
    <section class="py-8 md:py-12 relative" style="background-color: #001F3F;">
      
      <div class="container mx-auto px-4 md:px-6 relative z-10">
        <CountdownTimer target-date="2026-11-26T02:00:00" />
      </div>
    </section>

    <!-- Featured Preview -->
    <section class="container mx-auto px-4 md:px-6 relative" style="background-color: #001F3F; max-width: 100%; padding-top: 4rem; padding-bottom: 4rem;">
      
      <SectionReveal>
        <div class="text-center mb-8 md:mb-12">
          <div style="line-height: 1;">
            <!-- Twin humans figure centered at top -->
            <div class="flex justify-center mb-2">
              <img src="/arty_twins.png?v=20260211" alt="" class="w-20 md:w-28 lg:w-32 opacity-80" style="filter: drop-shadow(0 0 12px rgba(139, 0, 0, 0.6)) brightness(1.1) contrast(1.2);" />
            </div>
            <!-- First line: Glimpses Through Arty's Eyes And -->
            <div class="text-2xl md:text-3xl font-bold" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700;">
              Glimpses Through Arty's Eyes And
            </div>
            <!-- Second line: Arty's thoughts, once quietly held, become art -->
            <div class="text-2xl md:text-3xl font-bold" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; margin-top: -4px;">
              Arty's thoughts, once quietly held, become art
            </div>
          </div>
        </div>
      </SectionReveal>
      
      <div class="text-center mt-12 md:mt-16">
        <NuxtLink to="/gallery" class="inline-block hover:opacity-70 active:opacity-70 transition-opacity touch-manipulation" style="font-family: 'Bradley Hand ITC', cursive; font-weight: bold; color: #FFD700;">VIEW FULL GALLERY</NuxtLink>
      </div>
    </section>

    <!-- Philosophy Quote -->
    <section class="text-white pt-16 md:pt-32 pb-0 text-center px-4 md:px-6 relative overflow-hidden" style="background-color: #001F3F;">
      
      <ScrollAnimated animation="zoom-in" :delay="400" :duration="1000">
        <ScrollReveal animation-type="fade-up" :delay="100">
          <div class="max-w-4xl mx-auto space-y-6 md:space-y-8 relative z-10">
            <!-- Main human figure - prominent -->
            <img src="/arty_human_transparent.png" alt="Human connection to nature" class="w-32 md:w-40 mx-auto opacity-70" style="filter: drop-shadow(0 0 20px rgba(217, 168, 124, 0.5));" />
            <p class="text-lg sm:text-xl md:text-3xl leading-relaxed md:leading-normal px-4" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; font-weight: bold;">
              "Where Art Grows Quietly"
            </p>
            <p class="text-base sm:text-lg md:text-xl leading-relaxed px-4 mt-4 text-justify max-w-4xl mx-auto" style="font-family: 'Bradley Hand ITC', cursive; word-spacing: -0.5px; letter-spacing: -0.2px; color: #FFFFFF; font-weight: bold; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 5px rgba(0, 0, 0, 1), -1px -1px 3px rgba(0, 0, 0, 0.8); line-height: 1.8;">
              To Arty, the heart of Artilora, art is a living presence. Rooted in nature and refined by emotion, each creation is born of mindful thought and calm intention. The result is a harmonious completion of quiet strength and timeless soul - works designed to be felt as much as they are seen.
            </p>
            <p class="text-xs md:text-sm tracking-widest uppercase flex items-center justify-center gap-3" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; font-weight: bold;">
              An Artilorian Philosophy
            </p>
          </div>
        </ScrollReveal>
      </ScrollAnimated>
    </section>

    <!-- Newsletter Signup Section -->
    <NewsletterSignup />
  </div>
</template>

<script setup>
definePageMeta({
  layout: 'home'
})

const isLoading = useState('isLoading')
const isSpeaking = ref(false)
const audioProgress = ref(0)
const parallaxBg = ref(null)
const videoElement = ref(null)
const videoLoaded = ref(false)
const videoEnabled = ref(false) // Set to true to enable video, false to use only image
const videoSource = ref('/hero-video.mp4') // Path to your video file in /public folder

let speechSynthesis = null
let currentUtterance = null
let progressInterval = null

// Video loaded handler
const onVideoLoaded = () => {
  videoLoaded.value = true
  console.log('Video background loaded successfully')
}

// Parallax Scrolling Effect (for image fallback)
const handleParallaxScroll = () => {
  if (process.client && parallaxBg.value && !videoLoaded.value) {
    const scrolled = window.pageYOffset
    const parallaxSpeed = 0.5 // Adjust this value for more/less parallax effect
    parallaxBg.value.style.transform = `translateY(${scrolled * parallaxSpeed}px)`
  }
}

// Setup parallax and video on mount
onMounted(() => {
  if (process.client) {
    window.addEventListener('scroll', handleParallaxScroll)
    
    // Try to play video if enabled
    if (videoEnabled.value && videoElement.value) {
      videoElement.value.play().catch(err => {
        console.log('Video autoplay failed, using image fallback:', err)
        videoLoaded.value = false
      })
    }
  }
})

// Cleanup on unmount
onUnmounted(() => {
  if (process.client) {
    window.removeEventListener('scroll', handleParallaxScroll)
  }
})

// Text-to-Speech function for Primus
const speakPrimus = () => {
  if (process.client) {
    speechSynthesis = window.speechSynthesis
    
    if (isSpeaking.value) {
      speechSynthesis.cancel()
      isSpeaking.value = false
      audioProgress.value = 0
      if (progressInterval) clearInterval(progressInterval)
      return
    }
    
    const primusText = `
      Primus is more than a sculpture. It is the first inward pause from which ARTILORA emerged. 
      Formed from Aerial Root Sculpture in Ficus benghalensis and shaped through listening rather than force, 
      Primus embodies humility as strength and silence as origin. Neither man nor myth, it kneels in remembrance -
      returning to the earth that holds all beginnings. This form is not for sale. It remains in the ARTILORA studio 
      as a witness, a compass, and a promise: that every creation begins by bowing to truth.
      
      It is a moment of stillness made visible - the breath taken before becoming. Shaped from Aerial Root Sculpture 
      in Ficus benghalensis that have known time, weight, and patience, it rises not through force but through listening. 
      In its silence lives endurance; in its posture, reverence. Primus is not offered for ownership. It remains in the 
      ARTILORA studio as a living witness - reminding us that all true creation begins when the soul bows, listens, and 
      allows truth to take form.
      
      A moment of stillness where form learned to listen before it learned to rise. Shaped through patience rather than force, 
      Primus carries the weight of time and returns gently to the earth that holds all beginnings. In its quiet posture lives 
      endurance, reverence, and the courage to begin without certainty. It stands as a living compass - that every true creation 
      begins by honoring the unseen before the visible takes shape.
    `
    
    currentUtterance = new SpeechSynthesisUtterance(primusText)
    
    // Wait for voices to load
    const setVoice = () => {
      const voices = speechSynthesis.getVoices()
      console.log('Available voices:', voices.map(v => v.name))
      
      // Try multiple strategies to get a female voice
      let selectedVoice = voices.find(v => v.name.includes('Zira')) ||
                         voices.find(v => v.name.toLowerCase().includes('female')) ||
                         voices.find(v => !v.name.toLowerCase().includes('male') && v.lang.startsWith('en'))
      
      if (selectedVoice) {
        console.log('Selected voice:', selectedVoice.name)
        currentUtterance.voice = selectedVoice
      }
      
      currentUtterance.rate = 0.75
      currentUtterance.pitch = 0.6
      currentUtterance.volume = 1.0
      
      const estimatedDuration = (primusText.length / 15) * 1000 / currentUtterance.rate
      
      currentUtterance.onstart = () => {
        isSpeaking.value = true
        audioProgress.value = 0
        const startTime = Date.now()
        progressInterval = setInterval(() => {
          const elapsed = Date.now() - startTime
          const progress = Math.min((elapsed / estimatedDuration) * 100, 99)
          audioProgress.value = progress
        }, 100)
      }
      
      currentUtterance.onend = () => {
        isSpeaking.value = false
        audioProgress.value = 100
        if (progressInterval) clearInterval(progressInterval)
        setTimeout(() => { audioProgress.value = 0 }, 500)
      }
      
      currentUtterance.onerror = () => {
        isSpeaking.value = false
        audioProgress.value = 0
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

// Animated Counter - Using onMounted for better timing
onMounted(() => {
  setTimeout(() => {
    const counters = document.querySelectorAll('.animated-counter')
    counters.forEach(counter => {
      const target = parseInt(counter.getAttribute('data-target'))
      const duration = 2000
      const increment = target / (duration / 16)
      let current = 0
      
      const updateCounter = () => {
        current += increment
        if (current < target) {
          counter.textContent = Math.floor(current)
          requestAnimationFrame(updateCounter)
        } else {
          counter.textContent = target + '+'
        }
      }
      
      updateCounter()
    })
  }, 500)
})

useHead({
  title: 'Artilora - Born of Nature, Shaped by Art',
  meta: [
    { name: 'description', content: 'Artilora - Where art grows quietly. Discover organic sculptures born of nature and shaped by art. Each piece is a meditation with nature, revealing beauty through stillness and presence.' },
    { name: 'keywords', content: 'Artilora, organic sculpture, wood art, nature art, Kerala artist, Soman Jose, natural sculptures, wood carving, art gallery' },
    // Open Graph tags for social media
    { property: 'og:title', content: 'Artilora - Born of Nature, Shaped by Art' },
    { property: 'og:description', content: 'Where art grows quietly. Discover organic sculptures born of nature and shaped by art.' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: 'http://192.168.10.66:3009' },
    { property: 'og:image', content: 'http://192.168.10.66:3009/logo_updated.png' },
    // Twitter Card tags
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Artilora - Born of Nature, Shaped by Art' },
    { name: 'twitter:description', content: 'Where art grows quietly. Discover organic sculptures born of nature and shaped by art.' },
    { name: 'twitter:image', content: 'http://192.168.10.66:3009/logo_updated.png' }
  ],
  link: [
    { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap' }
  ]
})

const featuredImages = [
  'https://images.unsplash.com/photo-1535585209827-a15fcdbc4c2d?q=80&w=800&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1618331835717-801e976710b2?q=80&w=800&auto=format&fit=crop',
  'https://images.unsplash.com/photo-1513519245088-0e12902e5a38?q=80&w=800&auto=format&fit=crop'
]
</script>

<style scoped>
/* ========== VIDEO BACKGROUND ========== */
.video-background-container {
  position: absolute;
  inset: 0;
  overflow: hidden;
}

.video-bg {
  opacity: 0;
  transition: opacity 1s ease-in;
  filter: brightness(0.7) contrast(1.1);
  object-fit: cover;
}

.video-bg.video-loaded {
  opacity: 1;
}

.image-fallback {
  transition: opacity 0.5s ease-out;
  opacity: 1;
}

.image-fallback.hide-fallback {
  opacity: 0;
  pointer-events: none;
}

/* ========== KEN BURNS EFFECT (Slow Zoom & Pan) ========== */
.ken-burns-effect {
  animation: kenBurns 30s ease-in-out infinite alternate;
}

@keyframes kenBurns {
  0% {
    transform: scale(1) translate(0, 0);
  }
  50% {
    transform: scale(1.1) translate(-2%, -1%);
  }
  100% {
    transform: scale(1.05) translate(1%, 1%);
  }
}

/* ========== FLOATING PARTICLES OVERLAY ========== */
.particles-overlay {
  position: absolute;
  inset: 0;
  pointer-events: none;
  overflow: hidden;
  opacity: 0.4;
}

.particle {
  position: absolute;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.8), transparent);
  border-radius: 50%;
  bottom: -10%;
  animation: floatUp linear infinite;
  filter: blur(1px);
}

@keyframes floatUp {
  0% {
    bottom: -10%;
    opacity: 0;
    transform: translateX(0) rotate(0deg);
  }
  10% {
    opacity: 0.6;
  }
  90% {
    opacity: 0.6;
  }
  100% {
    bottom: 110%;
    opacity: 0;
    transform: translateX(50px) rotate(360deg);
  }
}

/* ========== PARALLAX SCROLLING ========== */
.parallax-bg {
  transition: transform 0.1s ease-out;
}

.artilora-title {
  color: #FFFFFF !important;
  font-weight: 400 !important;
}
.artilora-subtitle {
  color: #FFFFFF !important;
}
.artilora-link {
  color: #FFFFFF !important;
  border: 1px solid #FFFFFF;
  border-bottom: none;
  padding: 8px 15px;
  display: inline-block;
}

.animate-pulse-slow {
  animation: pulse 8s cubic-bezier(0.4, 0, 0.6, 1) infinite;
}
@keyframes pulse {
  0%, 100% { opacity: 0.4; }
  50% { opacity: 0.5; }
}


.animate-float-slow {
  animation: float 6s ease-in-out infinite;
}

@keyframes float {
  0%, 100% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-10px);
  }
}

.animate-spin-slow {
  animation: spin 8s linear infinite;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.text-shine-gold {
  background: linear-gradient(
    to right,
    #B8860B 20%,
    #FFD700 30%,
    #FFFFE0 40%,
    #FFD700 50%,
    #B8860B 80%
  );
  -webkit-background-clip: text;
  background-clip: text;
  color: transparent;
  background-size: 200% auto;
  animation: shine 5s linear infinite;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.5), 0 0 20px rgba(184, 134, 11, 0.3);
}

@keyframes shine {
  to {
    background-position: 200% center;
  }
}

a.text-shine-gold:hover {
  background: none;
  -webkit-background-clip: border-box;
  background-clip: border-box;
  color: #0a0a0a;
}

.primus-golden-text {
  color: #FFD700;
  font-weight: 500;
  text-shadow: 
    0 0 10px rgba(255, 215, 0, 0.8),
    0 0 20px rgba(255, 215, 0, 0.6),
    0 0 30px rgba(255, 215, 0, 0.4),
    2px 2px 4px rgba(0, 0, 0, 0.3);
  animation: primusGlow 3s ease-in-out infinite alternate;
}

@keyframes primusGlow {
  0% {
    text-shadow: 
      0 0 10px rgba(255, 215, 0, 0.8),
      0 0 20px rgba(255, 215, 0, 0.6),
      0 0 30px rgba(255, 215, 0, 0.4),
      2px 2px 4px rgba(0, 0, 0, 0.3);
  }
  100% {
    text-shadow: 
      0 0 15px rgba(255, 215, 0, 1),
      0 0 25px rgba(255, 215, 0, 0.8),
      0 0 35px rgba(255, 215, 0, 0.6),
      2px 2px 4px rgba(0, 0, 0, 0.4);
  }
}

/* ========== PRIMUS SPEAKS HEADLINE ========== */
.primus-speaks-headline {
  display: flex;
  align-items: center;
  gap: 20px;
  animation: headlineGlow 3s ease-in-out infinite;
}

.headline-ornament-left,
.headline-ornament-right {
  width: 80px;
  height: 2px;
  background: linear-gradient(90deg, transparent, #001F3F, #001F3F);
  animation: ornamentPulse 2s ease-in-out infinite alternate;
}

.headline-ornament-right {
  background: linear-gradient(90deg, #001F3F, #001F3F, transparent);
}

.headline-content {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 24px;
  background: rgba(255, 255, 255, 0.9);
  border: 3px solid #001F3F;
  border-radius: 50px;
  box-shadow: 
    0 4px 12px rgba(0, 0, 0, 0.3),
    inset 0 0 15px rgba(255, 255, 255, 0.5);
  backdrop-filter: blur(5px);
}

.headline-star {
  font-size: 20px;
  animation: starRotate 4s linear infinite;
  filter: drop-shadow(0 0 3px rgba(255, 215, 0, 0.6));
}

.headline-text {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 20px;
  font-weight: 900;
  color: #8B0000;
  text-shadow: none;
  letter-spacing: 1px;
  white-space: nowrap;
}

@keyframes headlineGlow {
  0%, 100% {
    filter: brightness(1);
  }
  50% {
    filter: brightness(1.05);
  }
}

@keyframes ornamentPulse {
  0% {
    opacity: 0.6;
    transform: scaleX(1);
  }
  100% {
    opacity: 1;
    transform: scaleX(1.1);
  }
}

@keyframes starRotate {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(360deg);
  }
}

/* ========== LISTEN BUTTON ========== */
.listen-button {
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.8), rgba(255, 215, 0, 0.3));
  border: 2px solid #FFD700;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 32px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
  flex-shrink: 0;
}

.listen-button:hover {
  transform: scale(1.1);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.5);
}

.listen-button.speaking {
  animation: pulse 1s ease-in-out infinite;
}

/* ========== PREMIUM AUDIO VISUALIZATION (CIRCULAR RING + WAVEFORM) ========== */

/* Circular Progress Ring */
.circular-progress {
  transform: rotate(-90deg);
}

.progress-bg {
  fill: none;
  stroke: rgba(255, 215, 0, 0.2);
  stroke-width: 4;
}

.progress-ring {
  fill: none;
  stroke: #FFD700;
  stroke-width: 4;
  stroke-linecap: round;
  stroke-dasharray: 220;
  stroke-dashoffset: 220;
  transition: stroke-dashoffset 0.1s linear;
  filter: drop-shadow(0 0 8px rgba(255, 215, 0, 0.8));
}

/* Listen Button Inside Ring */
.listen-button-small {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.8), rgba(255, 215, 0, 0.3));
  border: 2px solid #FFD700;
  border-radius: 50%;
  width: 50px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 24px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.3);
  flex-shrink: 0;
}

.listen-button-small:hover {
  transform: translate(-50%, -50%) scale(1.1);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.5);
}

.listen-button-small.speaking {
  animation: pulse 1s ease-in-out infinite;
}

/* Waveform Below Ring */
.waveform-container-small {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  height: 35px;
}

.wave-bar-small {
  width: 4px;
  background: linear-gradient(180deg, #FFD700, #FFA500);
  border-radius: 3px;
  animation: waveAnimation 0.8s ease-in-out infinite;
  box-shadow: 0 0 8px rgba(255, 215, 0, 0.8);
}

@keyframes waveAnimation {
  0%, 100% { height: 10px; }
  50% { height: 32px; }
}

@keyframes pulse {
  0%, 100% {
    transform: translate(-50%, -50%) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) scale(1.05);
  }
}

@media (max-width: 768px) {
  .headline-ornament-left,
  .headline-ornament-right {
    width: 40px;
  }
  
  .headline-text {
    font-size: 16px;
  }
  
  .headline-star {
    font-size: 16px;
  }
}
</style>


<style scoped>
/* ========== BADGE ANIMATIONS - OPTION 7: SCALE PULSE ========== */
.badge-swap-left {
  animation: scalePulse 3s ease-in-out infinite;
  z-index: 30;
}

.badge-swap-right {
  animation: scalePulse 3s ease-in-out infinite 1.5s;
  z-index: 30;
}

@keyframes scalePulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.15);
  }
}

/* ========== FIRST IN THE WORLD BADGE ========== */
.first-world-badge-orbit {
  position: absolute;
  animation: orbitAroundTree 20s linear infinite;
  transform-origin: center;
}

.first-world-badge-orbit .badge-container {
  animation: keepBadgeUpright 20s linear infinite reverse;
}

.badge-container {
  position: relative;
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.95), rgba(0, 0, 0, 0.9));
  border-radius: 50%;
  width: 150px;
  height: 150px;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 
    0 10px 40px rgba(0, 0, 0, 0.5),
    0 0 30px rgba(255, 215, 0, 0.3);
  border: 4px solid #FFD700;
  animation: boxGlow 2s ease-in-out infinite alternate;
  backdrop-filter: blur(10px);
}

.badge-glow {
  position: absolute;
  inset: -10px;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(255, 215, 0, 0.4), transparent 70%);
  animation: badgeGlow 2s ease-in-out infinite alternate;
}

.badge-content {
  position: relative;
  z-index: 1;
  text-align: center;
  padding: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
}

.badge-icon {
  font-size: 32px;
  margin-bottom: 2px;
  animation: badgePulse 2s ease-in-out infinite;
}

.badge-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 15px;
  font-weight: 900;
  color: #001F3F;
  line-height: 0.9 !important;
  text-transform: uppercase;
  text-shadow: none;
  letter-spacing: 0.5px;
}

.badge-subtitle {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 11px;
  color: #FFF;
  margin-top: 3px;
  font-weight: 700;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.8);
  line-height: 0.9 !important;
}

@keyframes orbitAroundTree {
  0% {
    transform: rotate(0deg) translateX(200px);
  }
  100% {
    transform: rotate(360deg) translateX(200px);
  }
}

@keyframes orbitAroundTreeOpposite {
  0% {
    transform: rotate(180deg) translateX(200px);
  }
  100% {
    transform: rotate(540deg) translateX(200px);
  }
}

@keyframes keepBadgeUpright {
  0% {
    transform: rotate(0deg);
  }
  100% {
    transform: rotate(-360deg);
  }
}

@keyframes badgeGlow {
  0% {
    opacity: 0.6;
    transform: scale(1);
  }
  100% {
    opacity: 1;
    transform: scale(1.1);
  }
}

@keyframes badgePulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
}

/* ========== CRAFTSMANSHIP COUNTER ========== */
.craftsmanship-counter {
  animation: counterSlideIn 1s ease-out;
}

.counter-box {
  background: linear-gradient(135deg, rgba(0, 0, 0, 0.8), rgba(139, 0, 0, 0.6));
  border: 2px solid #FFD700;
  border-radius: 12px;
  padding: 20px 30px;
  backdrop-filter: blur(10px);
  box-shadow: 
    0 10px 40px rgba(0, 0, 0, 0.5),
    0 0 30px rgba(255, 215, 0, 0.3);
}

.counter-number {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 48px;
  font-weight: 900;
  color: #FFD700;
  text-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
  line-height: 1;
  animation: counterCount 2s ease-out;
}

.counter-label {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFF;
  font-weight: 700;
  margin-top: 5px;
}

.counter-sublabel {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 12px;
  color: #FFF;
  font-style: italic;
}

.counter-text {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  font-weight: 700;
  color: #FFF;
  line-height: 1.4;
  text-align: center;
}

.counter-box-menu {
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.95), rgba(0, 0, 0, 0.9));
  border: 4px solid #FFD700;
  border-radius: 50%;
  width: 150px;
  height: 150px;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  backdrop-filter: blur(10px);
  box-shadow: 
    0 10px 40px rgba(0, 0, 0, 0.5),
    0 0 30px rgba(255, 215, 0, 0.3);
  text-align: center;
  animation: boxGlow 2s ease-in-out infinite alternate;
}

@keyframes boxGlow {
  0% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 30px rgba(255, 215, 0, 0.3);
  }
  100% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 50px rgba(255, 215, 0, 0.6),
      0 0 70px rgba(255, 215, 0, 0.4);
  }
}

.counter-text-large {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 32px;
  font-weight: 900;
  color: #FFD700;
  text-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
  line-height: 1;
  animation: counterCount 2s ease-out;
  margin-bottom: 2px;
}

.counter-text-small {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  font-weight: 900;
  color: #001F3F;
  line-height: 0.9 !important;
  text-transform: uppercase;
  text-shadow: none;
  letter-spacing: 0.5px;
}

.craftsmanship-counter-orbit {
  position: absolute;
  animation: orbitAroundTreeOpposite 20s linear infinite;
  transform-origin: center;
}

.craftsmanship-counter-orbit .counter-box-menu {
  animation: keepBadgeUpright 20s linear infinite reverse;
}

/* Trophy Float Animation - More Noticeable */
@keyframes trophyFloat {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-20px);
  }
}

@keyframes trophyGlow {
  0%, 100% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 30px rgba(255, 215, 0, 0.3);
  }
  50% {
    box-shadow: 
      0 10px 40px rgba(0, 0, 0, 0.5),
      0 0 50px rgba(255, 215, 0, 0.8),
      0 0 70px rgba(255, 215, 0, 0.6);
  }
}

@keyframes boxFloat {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-10px);
  }
}

/* Trophy Float Animation */
@keyframes float {
  0%, 100% {
    transform: translateY(0px);
  }
  50% {
    transform: translateY(-15px);
  }
}

@keyframes counterSlideIn {
  from {
    opacity: 0;
    transform: translateX(-50px);
  }
  to {
    opacity: 1;
    transform: translateX(0);
  }
}

@keyframes counterCount {
  from {
    opacity: 0;
    transform: scale(0.5);
  }
  to {
    opacity: 1;
    transform: scale(1);
  }
}

/* ========== RESPONSIVE ========== */
@media (max-width: 768px) {
  .badge-container {
    width: 100px;
    height: 100px;
  }
  
  .badge-icon {
    font-size: 24px;
  }
  
  .badge-title {
    font-size: 11px;
  }
  
  .badge-subtitle {
    font-size: 9px;
  }
  
  .counter-number {
    font-size: 36px;
  }
  
  .counter-label {
    font-size: 14px;
  }
}

/* ========== PRIMUS IMAGE CONTAINER ========== */
.primus-image-container {
  position: relative;
  display: inline-block;
}


</style>





