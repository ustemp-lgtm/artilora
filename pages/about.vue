<template>
  <div class="about-page-wrapper">
    <!-- Breadcrumb Navigation -->
    <BreadcrumbNav />
    
    <div class="container mx-auto px-4 md:px-6 py-16 md:py-24 space-y-20 md:space-y-32">
    
    <!-- About Artilora Section - NEW -->
    <SectionReveal>
      <div class="text-center space-y-8 max-w-4xl mx-auto">
        <!-- Artilora White Logo Image -->
        <!-- Artilora Golden Box Opening Animation -->
        <div class="perspective-container relative h-[350px] w-full flex justify-center items-center py-10 mt-8 mb-0" style="perspective: 1500px;">
          
          <!-- The Container (Golden Box) -->
          <div class="relative w-full max-w-3xl h-full flex items-center justify-center transform-style-3d">
            
            <!-- The Logo (Inside Content) - Emerges when doors open -->
            <div 
              class="relative z-10 transition-all duration-[3000ms] ease-[cubic-bezier(0.25,0.1,0.25,1)] transform"
              :style="{ 
                transform: isDoorsOpen ? 'scale(1) translateZ(0px)' : 'scale(0.5) translateZ(-200px)',
                opacity: isDoorsOpen ? 1 : 0
              }"
            >
               <!-- Existing Beautiful Logo Structure -->
               <div class="relative bg-[#001F3F]/90 p-8 rounded-2xl backdrop-blur-md border border-[#FFD700]/40 shadow-[0_0_80px_rgba(255,215,0,0.3)] hover:scale-105 transition-transform duration-700 flex items-center justify-center">
                  <!-- Corner Decorations -->
                  <div class="absolute -top-3 -left-3 w-10 h-10 border-t-4 border-l-4 border-[#FFD700]"></div>
                  <div class="absolute -top-3 -right-3 w-10 h-10 border-t-4 border-r-4 border-[#FFD700]"></div>
                  <div class="absolute -bottom-3 -left-3 w-10 h-10 border-b-4 border-l-4 border-[#FFD700]"></div>
                  <div class="absolute -bottom-3 -right-3 w-10 h-10 border-b-4 border-r-4 border-[#FFD700]"></div>
                  
                  <!-- Elegant Corner Accents -->
                  <div class="absolute top-2 left-2 w-8 h-8 border-t-2 border-l-2 border-[#FFD700] opacity-40"></div>
                  <div class="absolute bottom-2 right-2 w-8 h-8 border-b-2 border-r-2 border-[#FFD700] opacity-40"></div>
                  
                  <img src="/artilora_name_white.png" alt="Artilora" class="max-h-48 md:max-h-64 w-auto max-w-full object-contain relative z-10 block" style="filter: drop-shadow(0 4px 20px rgba(0,0,0,1));" />
               </div>
            </div>

            <!-- Left Door -->
            <div 
              class="absolute top-0 left-0 w-1/2 h-full bg-gradient-to-r from-[#5c3a1e] via-[#B8860B] to-[#FFD700] origin-left transition-all duration-[3000ms] ease-in-out border-r-4 border-[#FFD700] z-20 shadow-2xl flex items-center justify-end"
              :style="{ transform: isDoorsOpen ? 'rotateY(-110deg)' : 'rotateY(0deg)', opacity: isDoorsOpen ? 0 : 1 }"
            >
              <!-- Door Texture/Detail -->
              <div class="w-full h-full border-y-[6px] border-l-[6px] border-[#3e2714] m-2 relative bg-[url('/path/to/texture')] opacity-80 flex flex-col justify-between p-4">
                 <div class="w-full h-1 bg-[#8B4513]/30"></div>
                 <div class="absolute top-1/2 right-4 w-4 h-32 bg-gradient-to-b from-[#FFD700] to-[#B8860B] rounded-l-full shadow-[0_4px_10px_rgba(0,0,0,0.5)] border border-[#5c3a1e]"></div>
                 <div class="w-full h-1 bg-[#8B4513]/30"></div>
              </div>
            </div>

            <!-- Right Door -->
            <div 
              class="absolute top-0 right-0 w-1/2 h-full bg-gradient-to-l from-[#5c3a1e] via-[#B8860B] to-[#FFD700] origin-right transition-all duration-[3000ms] ease-in-out border-l-4 border-[#FFD700] z-20 shadow-2xl flex items-center justify-start"
              :style="{ transform: isDoorsOpen ? 'rotateY(110deg)' : 'rotateY(0deg)', opacity: isDoorsOpen ? 0 : 1 }"
            >
               <!-- Door Texture/Detail -->
               <div class="w-full h-full border-y-[6px] border-r-[6px] border-[#3e2714] m-2 relative bg-[url('/path/to/texture')] opacity-80 flex flex-col justify-between p-4">
                  <div class="w-full h-1 bg-[#8B4513]/30"></div>
                  <div class="absolute top-1/2 left-4 w-4 h-32 bg-gradient-to-b from-[#FFD700] to-[#B8860B] rounded-r-full shadow-[0_4px_10px_rgba(0,0,0,0.5)] border border-[#5c3a1e]"></div>
                  <div class="w-full h-1 bg-[#8B4513]/30"></div>
               </div>
            </div>

          </div>
        </div>
        <p class="text-xl md:text-2xl font-bold relative z-20" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1); margin-top: 10px;">
          Est. 2026
        </p>
        
        <div class="prose prose-lg max-w-6xl mx-auto" style="font-family: 'Segoe Print', cursive; color: #FFFFFF; font-size: 1.125rem;">
          <p class="text-justify mb-0" style="font-size: 1.1rem; line-height: 1.0 !important; color: #FFFFFF; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">
            Artilora is an emerging creative institution as well as an amazing research center poised to take form in 2026— a vision shaped to redefine the language of contemporary sculpturism. Born from a quiet dream and built upon an intention, Artilora seeks to nurture artists, ignite innovation, and build a global sanctuary where sculptural excellence can flourish. Though its official unveiling is yet to come, the pulse of Artilora has already begun when the Primus was born in the country. Concepts are evolving, foundations are being laid, and creative research flows through the studio like an undercurrent of possibility. We are sculpting a space where organic forms converse with imagination, where nature’s silent structures inspire the hands that shape them, and where every creation becomes an homage to the earth that birthed it. Artilora is not just being founded, it is unfolding, growing, and awakening.
          </p>
          
          <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mt-10 text-center">
            <div class="p-6 rounded-lg" style="border: 2px solid #FFD700;">
              <p class="text-sm font-bold mb-2" style="color: #FFD700; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">Current Status</p>
              <p class="text-base" style="color: #FFFFFF; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">Pre-launch / Establishment in progress</p>
            </div>
            <div class="p-6 rounded-lg" style="border: 2px solid #FFD700;">
              <p class="text-sm font-bold mb-2" style="color: #FFD700; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">Official Launch</p>
              <p class="text-base" style="color: #FFFFFF; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">26th of November 2026<br>02.00 AM --06.00 AM</p>
            </div>
            <div class="p-6 rounded-lg" style="border: 2px solid #FFD700;">
              <p class="text-sm font-bold mb-2" style="color: #FFD700; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">Location</p>
              <p class="text-base" style="color: #FFFFFF; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1);">Door No. A/101,<br>Primus Villa<br>Thrissur- Kerala- India</p>
            </div>
          </div>
          
          <!-- Our Mission Section - Redesigned -->
          <div class="mt-10 mb-8">
            <!-- Main Title -->
            <div class="text-center mb-0">
              <h2 class="text-4xl font-bold mb-0" style="color: #FFD700; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 8px rgba(0, 0, 0, 1); font-family: 'Bradley Hand ITC', cursive; letter-spacing: 2px;">
                Mission at Artilora
              </h2>
              <div class="w-32 h-1 mx-auto" style="background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
            </div>
            
            <!-- Introduction -->
            <div class="max-w-4xl mx-auto mb-0 p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
              <p class="text-center text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                At Artilora, we provide a sanctuary for the sculptural spirit — a space where the boundary between creator and creation dissolves into a shared pursuit of excellence. Our mission is grounded in four pillars of sculptural art:
              </p>
            </div>
            
            <!-- Four Pillars Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6 max-w-6xl mx-auto mb-0">
              <!-- Pillar 1 -->
              <div class="p-6 rounded-2xl transition-all duration-300 hover:scale-105" style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.8) 0%, rgba(0, 15, 31, 0.9) 100%); border: 2px solid #FFD700; box-shadow: 0 8px 24px rgba(255, 215, 0, 0.2);">
                <div class="flex items-start mb-0">
                  <div class="flex-shrink-0 w-10 h-10 rounded-full flex items-center justify-center mr-3" style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);">
                    <span class="text-xl font-bold" style="color: #001F3F; text-shadow: none;">1</span>
                  </div>
                  <h3 class="text-xl font-bold pt-1" style="color: #FFD700; text-shadow: 0 0 10px rgba(255, 215, 0, 0.5); font-family: 'Bradley Hand ITC', cursive;">
                    Nurture of Potential
                  </h3>
                </div>
                <p class="text-justify pl-13" style="color: #FFFFFF; font-size: 1rem; line-height: 1.0 !important; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
                  We cultivate an ecosystem where technical mastery and spiritual growth are inseparable. For the emerging seeker and the established master alike, we believe the artist shapes the medium just as the practice of sculpture quietly refines the self.
                </p>
              </div>
              
              <!-- Pillar 2 -->
              <div class="p-6 rounded-2xl transition-all duration-300 hover:scale-105" style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.8) 0%, rgba(0, 15, 31, 0.9) 100%); border: 2px solid #FFD700; box-shadow: 0 8px 24px rgba(255, 215, 0, 0.2);">
                <div class="flex items-start mb-0">
                  <div class="flex-shrink-0 w-10 h-10 rounded-full flex items-center justify-center mr-3" style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);">
                    <span class="text-xl font-bold" style="color: #001F3F; text-shadow: none;">2</span>
                  </div>
                  <h3 class="text-xl font-bold pt-1" style="color: #FFD700; text-shadow: 0 0 10px rgba(255, 215, 0, 0.5); font-family: 'Bradley Hand ITC', cursive;">
                    The Alchemy of Organic Innovation
                  </h3>
                </div>
                <p class="text-justify pl-13" style="color: #FFFFFF; font-size: 1rem; line-height: 1.0 !important; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
                  We hold a living dialogue with the natural world, encouraging sculptors to move beyond imitation toward genuine discovery. By listening to the silent will of the material, we help artists allow form to emerge as a natural extension of the element itself.
                </p>
              </div>
              
              <!-- Pillar 3 -->
              <div class="p-6 rounded-2xl transition-all duration-300 hover:scale-105" style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.8) 0%, rgba(0, 15, 31, 0.9) 100%); border: 2px solid #FFD700; box-shadow: 0 8px 24px rgba(255, 215, 0, 0.2);">
                <div class="flex items-start mb-0">
                  <div class="flex-shrink-0 w-10 h-10 rounded-full flex items-center justify-center mr-3" style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);">
                    <span class="text-xl font-bold" style="color: #001F3F; text-shadow: none;">3</span>
                  </div>
                  <h3 class="text-xl font-bold pt-1" style="color: #FFD700; text-shadow: 0 0 10px rgba(255, 215, 0, 0.5); font-family: 'Bradley Hand ITC', cursive;">
                    Mining for Unique Identity
                  </h3>
                </div>
                <p class="text-justify pl-13" style="color: #FFFFFF; font-size: 1rem; line-height: 1.0 !important; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
                  In the vast and evolving landscape of modern sculpture, we guide each creator toward their authentic aesthetic voice. Our aim is to shepherd the journey from raw intention to a distinct and resonant style — one that speaks within the broader universe of global art.
                </p>
              </div>
              
              <!-- Pillar 4 -->
              <div class="p-6 rounded-2xl transition-all duration-300 hover:scale-105" style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.8) 0%, rgba(0, 15, 31, 0.9) 100%); border: 2px solid #FFD700; box-shadow: 0 8px 24px rgba(255, 215, 0, 0.2);">
                <div class="flex items-start mb-0">
                  <div class="flex-shrink-0 w-10 h-10 rounded-full flex items-center justify-center mr-3" style="background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%); box-shadow: 0 4px 12px rgba(255, 215, 0, 0.4);">
                    <span class="text-xl font-bold" style="color: #001F3F; text-shadow: none;">4</span>
                  </div>
                  <h3 class="text-xl font-bold pt-1" style="color: #FFD700; text-shadow: 0 0 10px rgba(255, 215, 0, 0.5); font-family: 'Bradley Hand ITC', cursive;">
                    A Celebration of Co-creation
                  </h3>
                </div>
                <p class="text-justify pl-13" style="color: #FFFFFF; font-size: 1rem; line-height: 1.0 !important; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
                  We stand at the intersection of art and nature, honoring the profound union that occurs when the sculptor's hand meets the pulse of the earth. We don't simply exhibit art — we celebrate the sacred pilgrimage of the creative journey and welcome each new visionary into its unfolding story.
                </p>
              </div>
            </div>
            
            <!-- Our Philosophy - Highlighted Section -->
            <div class="max-w-4xl mx-auto p-6 rounded-2xl" style="background: linear-gradient(135deg, rgba(255, 215, 0, 0.15) 0%, rgba(255, 165, 0, 0.1) 100%); border: 3px solid #FFD700; box-shadow: 0 0 40px rgba(255, 215, 0, 0.3), inset 0 0 20px rgba(255, 215, 0, 0.1);">
              <div class="text-center mb-4">
                <h3 class="text-2xl font-bold" style="color: #FFD700; text-shadow: 0 0 15px rgba(255, 215, 0, 0.6), 2px 2px 8px rgba(0, 0, 0, 1); font-family: 'Bradley Hand ITC', cursive; letter-spacing: 1px;">
                  Our Philosophy
                </h3>
                <div class="w-24 h-1 mx-auto mt-2" style="background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
              </div>
              <p class="text-center text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.9); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important; font-style: italic;">
                We see art not as an imposition of will, but as mutual transformation — a global exploration of how we occupy space, and how space, in turn, occupies us.
              </p>
            </div>
          </div>

          <!-- Vision Section -->
          <div class="mt-16 mb-8">
            <!-- Main Title -->
            <div class="text-center mb-0">
              <h2 class="text-4xl font-bold mb-0" style="color: #FFD700; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 8px rgba(0, 0, 0, 1); font-family: 'Bradley Hand ITC', cursive; letter-spacing: 2px;">
                Vision at Artilora
              </h2>
              <div class="w-32 h-1 mx-auto" style="background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
              <p class="text-xl mt-3" style="color: #FFD700; font-family: 'Bradley Hand ITC', cursive; font-style: italic;">
                Shaping the Future of Creative Expression
              </p>
            </div>
            
            <!-- Vision Content -->
            <div class="max-w-5xl mx-auto space-y-6">
              <div class="p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
                <p class="text-justify text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                  Artilora envisions itself as a transformative creative platform that seamlessly connects art, technology, sculptural innovation, and human imagination. Its vision is to empower artists, designers, storytellers, and innovators by providing them with meaningful visibility and boundless opportunities to express their ideas without limitation. Artilora aspires to cultivate a global creative ecosystem that values originality, collaboration, and cultural diversity—ensuring that creativity remains both accessible and sustainable.
                </p>
              </div>
              
              <div class="p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
                <p class="text-justify text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                  At its core, Artilora is committed to redefining how people experience and engage with art in the digital age. Its vision goes beyond simply showcasing works; it seeks to foster meaningful connections between creators and audiences through immersive, innovative, and purpose-driven experiences. By integrating emerging technologies with artistic expression, Artilora positions itself as a forward-thinking space where inspiration drives influence and creativity shapes the future.
                </p>
              </div>
            </div>
          </div>

          <!-- Passion Section -->
          <div class="mt-16 mb-8">
            <!-- Main Title -->
            <div class="text-center mb-0">
              <h2 class="text-4xl font-bold mb-0" style="color: #FFD700; text-shadow: 0 0 20px rgba(255, 215, 0, 0.5), 2px 2px 8px rgba(0, 0, 0, 1); font-family: 'Bradley Hand ITC', cursive; letter-spacing: 2px;">
                Passion at Artilora
              </h2>
              <div class="w-32 h-1 mx-auto" style="background: linear-gradient(90deg, transparent, #FFD700, transparent);"></div>
            </div>
            
            <!-- Passion Content -->
            <div class="max-w-5xl mx-auto space-y-6">
              <div class="p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
                <p class="text-justify text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                  My passion is the quiet ember that first burned within me—a small, unspoken dream I learned to breathe into life through roots, sculpture, and the inner storms that shaped my spirit. At Artilora, that ember rises, becoming a living flame that shapes sculptures from the whispered language of nature itself. It is the vibrant pulse behind every curve of a tree, every thickness of wood, every thread of wandering root, and every silhouette born of patience, presence, and deep, listening awareness.
                </p>
              </div>
              
              <div class="p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
                <p class="text-justify text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                  My passion is not merely the act of creating. It is the art of listening—to the hidden memories carried by a tree, to the silent stories where time has slept, to the quiet breath of life within the raw material, and to the ancient echo of the earth asking to be reborn through art. It is a devotion to transform stillness into movement and movement into meaning. It is the courage to give form to imagination and the humility to let nature finish the sentences I begin.
                </p>
              </div>
              
              <div class="p-6 rounded-2xl" style="background: rgba(0, 31, 63, 0.6); border: 2px solid rgba(255, 215, 0, 0.3); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);">
                <p class="text-justify text-lg" style="color: #FFFFFF; text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.8); font-family: 'Bradley Hand ITC', cursive; line-height: 1.0 !important;">
                  At Artilora, my passion becomes sacred ground—where craft becomes meditation, each sculpture becomes a chapter of my inner life, and creation becomes a dialogue between my soul and the world that sculpted me long before I sculpted anything. My passion is a vow to shape not just objects, but emotions—to carve pathways that stir wonder, invite reflection, and reveal the quiet, eternal beauty of being alive.
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </SectionReveal>
    
    <!-- Intro -->
    <SectionReveal>
      <div class="flex flex-col md:flex-row items-start gap-4 md:gap-6">
        <div class="md:w-1/2 w-full" style="background-color: #001F3F; padding: 1rem;">
          <div class="aspect-[4/5] relative overflow-hidden rounded-sm p-3" style="background-color: #001F3F;">
            <!-- Glittering corner decorations -->
            <div class="absolute top-0 left-0 w-16 h-16 z-10" style="background: radial-gradient(circle at top left, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out infinite;"></div>
            <div class="absolute top-0 right-0 w-16 h-16 z-10" style="background: radial-gradient(circle at top right, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 0.5s infinite;"></div>
            <div class="absolute bottom-0 left-0 w-16 h-16 z-10" style="background: radial-gradient(circle at bottom left, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 1s infinite;"></div>
            <div class="absolute bottom-0 right-0 w-16 h-16 z-10" style="background: radial-gradient(circle at bottom right, rgba(255, 215, 0, 0.8) 0%, rgba(255, 215, 0, 0.4) 30%, transparent 70%); animation: glitter 2s ease-in-out 1.5s infinite;"></div>
            
            <img :src="`/artilora_speech_1.png?v=${new Date().getTime()}`" alt="The Artist" loading="lazy" class="w-full h-full object-contain object-center" style="filter: drop-shadow(4px 4px 8px rgba(0,0,0,0.3));" />
          </div>
        </div>
        <div class="md:w-1/2 space-y-4 md:space-y-6">
          <div class="flex items-center gap-4">
            <h1 class="text-xl md:text-3xl font-sans inline-block" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; background-color: #0A4D68; border-left: 2px solid #088395; border-bottom: 2px solid #088395; padding: 12px 20px; white-space: nowrap;">The Art of Inner Listening</h1>
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
                <button @click="speakAbout" class="listen-button-small" :class="{ 'speaking': isSpeaking }" title="Listen to the artist">
                  <span v-if="!isSpeaking">🔊</span>
                  <span v-else>⏸️</span>
                </button>
              </div>
              <div v-if="isSpeaking" class="waveform-container-small">
                <div class="wave-bar-small" v-for="i in 7" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
              </div>
            </div>
          </div>
          
          <!-- New descriptive text -->
          <div class="p-4 rounded-lg" style="background: linear-gradient(135deg, rgba(139, 0, 0, 0.3) 0%, rgba(0, 31, 63, 0.4) 100%); border-left: 4px solid #FFD700; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);">
            <p class="text-base md:text-lg text-justify" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; line-height: 1.0 !important; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              The art of inner listening is the art of inner feeling. From feeling emerges the art of creation. And after creation, it becomes Artilora.
            </p>
          </div>
          
          <p class="text-lg md:text-xl font-bold" style="font-family: 'Bradley Hand ITC', cursive; color: #FFD700; text-shadow: 2px 2px 8px rgba(0, 0, 0, 1), 0 0 20px rgba(255, 215, 0, 0.4);">"No crafting — only meditation with nature."</p>
          <div class="prose prose-base md:prose-lg" style="font-family: 'Segoe Print', cursive; color: #FFFFFF; font-weight: 300 !important;">
            <p class="mb-6 text-justify" style="font-size: 1rem; line-height: 1.0 !important; color: #FFFFFF; font-weight: 300 !important; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">
              My journey began not in the act of making, but in listening. In the quiet of my earliest days, silence revealed itself as a teacher — patient, observant, and profound. I learned that nature is the original artist, shaping without urgency or intention. Wind carves the cliffs, water smooths the stones, and time inscribes memory into the bark of ancient trees.
            </p>
            <p class="mb-6 text-justify" style="font-size: 1rem; line-height: 1.0 !important; color: #FFFFFF; font-weight: 300 !important; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">
              In this practice, I do not impose form upon the material. I remain present with it. Wood carries its own rhythm, history, and direction; my role is to attend, to wait, and to respond. What emerges is not a product of force, but of alignment — between breath and grain, stillness and movement, thought and matter.
            </p>
            <p class="text-justify" style="font-size: 1rem; line-height: 1.0 !important; color: #FFFFFF; font-weight: 300 !important; text-shadow: 3px 3px 12px rgba(0, 0, 0, 1), 0 0 25px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">
              What I seek is not perfection, but presence. Each work becomes a moment of surrender, where intention softens and awareness deepens. In allowing the material to lead, I am reminded that creation is not an act of control, but of trust. When the mind grows quiet, form reveals itself gently — arriving not as something made, but as something remembered.
            </p>
            <p class="mt-8 text-left">
              <span style="font-family: 'Segoe Script', cursive; font-size: 1.2rem; color: #FFD700; font-style: italic;">Soman Jose</span>
            </p>
          </div>
        </div>
      </div>
    </SectionReveal>

    <!-- The Process -->
    <SectionReveal>
      <div class="text-center max-w-6xl mx-auto px-4">
        <h2 class="text-xl md:text-3xl font-sans inline-block" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; background-color: #0A4D68; border-left: 2px solid #088395; border-bottom: 2px solid #088395; padding: 12px 20px;">The Process of Revelation</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 md:gap-12 text-left mt-12 max-w-5xl mx-auto">
          <div style="padding: 16px; position: relative; background-color: #0A4D68;">
            <div style="position: absolute; left: 0; top: 80px; width: 2px; height: calc(100% - 82px); background-color: #088395;"></div>
            <div style="position: absolute; left: 0; bottom: 0; width: 100%; height: 2px; background-color: #088395;"></div>
            
            <!-- Audio Button - Top Right -->
            <div class="absolute top-2 right-2 flex flex-col items-center gap-1">
              <div class="relative">
                <svg class="circular-progress-small" width="50" height="50">
                  <circle cx="25" cy="25" r="21" class="progress-bg-small"></circle>
                  <circle 
                    cx="25" 
                    cy="25" 
                    r="21" 
                    class="progress-ring-small"
                    :style="{ strokeDashoffset: isSpeakingStillness ? 132 - (132 * audioProgressStillness / 100) : 132 }"
                  ></circle>
                </svg>
                <button @click="speakStillness" class="listen-button-tiny" :class="{ 'speaking': isSpeakingStillness }">
                  <span v-if="!isSpeakingStillness">🔊</span>
                  <span v-else>⏸️</span>
                </button>
              </div>
              <div v-if="isSpeakingStillness" class="waveform-container-tiny">
                <div class="wave-bar-tiny" v-for="i in 3" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
              </div>
            </div>
            
            <h3 class="text-lg md:text-xl font-bold mb-0 mt-20" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">Stillness<br><span style="color: #FFD700;">(Silence as Ground)</span></h3>
            <p class="text-base md:text-lg font-bold text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Revelation begins when movement ceases.</p>
            <p class="text-base md:text-lg text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; line-height: 1.0 !important; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Stillness is the condition in which listening becomes possible. In silence, the noise of intention dissolves and attention sharpens. This is where the artist steps back, allowing nature's rhythm to surface. Without stillness, form remains hidden; with it, form begins to speak.</p>
            <p class="text-base md:text-lg font-bold text-justify" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Stillness is not absence, it is readiness.</p>
          </div>
          <div style="padding: 16px; position: relative; background-color: #0A4D68;">
            <div style="position: absolute; left: 0; top: 80px; width: 2px; height: calc(100% - 82px); background-color: #088395;"></div>
            <div style="position: absolute; left: 0; bottom: 0; width: 100%; height: 2px; background-color: #088395;"></div>
            
            <!-- Audio Button - Top Right -->
            <div class="absolute top-2 right-2 flex flex-col items-center gap-1">
              <div class="relative">
                <svg class="circular-progress-small" width="50" height="50">
                  <circle cx="25" cy="25" r="21" class="progress-bg-small"></circle>
                  <circle 
                    cx="25" 
                    cy="25" 
                    r="21" 
                    class="progress-ring-small"
                    :style="{ strokeDashoffset: isSpeakingAttention ? 132 - (132 * audioProgressAttention / 100) : 132 }"
                  ></circle>
                </svg>
                <button @click="speakAttention" class="listen-button-tiny" :class="{ 'speaking': isSpeakingAttention }">
                  <span v-if="!isSpeakingAttention">🔊</span>
                  <span v-else>⏸️</span>
                </button>
              </div>
              <div v-if="isSpeakingAttention" class="waveform-container-tiny">
                <div class="wave-bar-tiny" v-for="i in 3" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
              </div>
            </div>
            
            <h3 class="text-lg md:text-xl font-bold mb-0 mt-20" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">Attention<br><span style="color: #FFD700;">(Deep Listening to Material)</span></h3>
            <p class="text-base md:text-lg font-bold text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Revelation unfolds through sustained presence.</p>
            <p class="text-base md:text-lg text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; line-height: 1.0 !important; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Wood carries memory — of wind, rain, growth, and time. Through careful observation and patience, its grain, resistance, and direction offer guidance. Attention replaces control. The artist does not decide; the material is disclosed.</p>
            <p class="text-base md:text-lg font-bold text-justify" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">What is listened to deeply no longer needs to be forced.</p>
          </div>
          <div style="padding: 16px; position: relative; background-color: #0A4D68;">
            <div style="position: absolute; left: 0; top: 80px; width: 2px; height: calc(100% - 82px); background-color: #088395;"></div>
            <div style="position: absolute; left: 0; bottom: 0; width: 100%; height: 2px; background-color: #088395;"></div>
            
            <!-- Audio Button - Top Right -->
            <div class="absolute top-2 right-2 flex flex-col items-center gap-1">
              <div class="relative">
                <svg class="circular-progress-small" width="50" height="50">
                  <circle cx="25" cy="25" r="21" class="progress-bg-small"></circle>
                  <circle 
                    cx="25" 
                    cy="25" 
                    r="21" 
                    class="progress-ring-small"
                    :style="{ strokeDashoffset: isSpeakingAlignment ? 132 - (132 * audioProgressAlignment / 100) : 132 }"
                  ></circle>
                </svg>
                <button @click="speakAlignment" class="listen-button-tiny" :class="{ 'speaking': isSpeakingAlignment }">
                  <span v-if="!isSpeakingAlignment">🔊</span>
                  <span v-else>⏸️</span>
                </button>
              </div>
              <div v-if="isSpeakingAlignment" class="waveform-container-tiny">
                <div class="wave-bar-tiny" v-for="i in 3" :key="i" :style="{ animationDelay: (i * 0.1) + 's' }"></div>
              </div>
            </div>
            
            <h3 class="text-lg md:text-xl font-bold mb-0 mt-20" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">Alignment<br><span style="color: #FFD700;">(Union of Breath, Time, and Matter)</span></h3>
            <p class="text-base md:text-lg font-bold text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Revelation completes itself through harmony.</p>
            <p class="text-base md:text-lg text-justify mb-1" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; line-height: 1.0 !important; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">When inner rhythm aligns with the material's nature, form emerges naturally. Action arises without struggle. This is the moment where effort becomes ease and making becomes meditation. Work appears not as invention, but as inevitability.</p>
            <p class="text-base md:text-lg font-bold text-justify" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; font-size: 1.125rem; text-shadow: 3px 3px 10px rgba(0, 0, 0, 1), 0 0 20px rgba(0, 0, 0, 0.95), 1px 1px 3px rgba(0, 0, 0, 1);">Alignment is the moment when the artist disappears and form arrives.</p>
          </div>
        </div>
      </div>
    </SectionReveal>

    </div>

    <!-- ARTIST BIOGRAPHY SECTION -->
    <section style="background: #1A1714; padding: 80px 32px;">
      <div style="max-width: 1200px; margin: 0 auto;">
        
        <!-- Main Title -->
        <div style="text-align: center; margin-bottom: 10px;">
          <div style="display: flex; flex-direction: column; align-items: center; gap: 0;">
            <img src="/Artilora_name.png" alt="ARTILORA" style="max-width: 600px; width: 100%; height: auto; display: block;" />
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 20px; font-weight: 300; color: #87CEFA; letter-spacing: 0.1em; margin: 0; padding: 0;">Sculpted by Nature</p>
          </div>
        </div>

        <!-- Introduction -->
        <div style="max-width: 900px; margin: 0 auto 10px; text-align: center;">
          <p style="font-family: Arial, Helvetica, sans-serif; font-size: 18px; line-height: 1.0 !important; color: #87CEFA; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
            Soman Jose is an Indian sculptor whose work transforms the silent architecture of nature into contemplative sculptures that reveal the emotional and spiritual depth of the human experience.
          </p>
        </div>

        <!-- Artist Biography Header -->
        <div style="text-align: center; margin-bottom: 10px;">
          <h3 style="font-family: Arial, Helvetica, sans-serif; font-size: 28px; font-weight: 400; text-transform: uppercase; letter-spacing: 0.12em; color: #87CEFA; margin-bottom: 8px;">Artist Biography</h3>
          <div style="width: 80px; height: 2px; background: linear-gradient(90deg, transparent, #87CEFA, transparent); margin: 0 auto;"></div>
        </div>

        <!-- Biography Content Card -->
        <div style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.15) 0%, rgba(139, 0, 0, 0.1) 100%); border: 1px solid rgba(135, 206, 250, 0.25); border-radius: 12px; padding: 70px 60px; box-shadow: 0 10px 40px rgba(0, 0, 0, 0.5); max-width: 1000px; margin: 0 auto 60px;">
          
          <!-- Name and Title -->
          <div style="text-align: center; margin-bottom: 35px; padding-bottom: 25px; border-bottom: 1px solid rgba(135, 206, 250, 0.25);">
            <h4 style="font-family: Arial, Helvetica, sans-serif; font-size: 44px; font-weight: 400; color: #87CEFA; letter-spacing: 0.08em; margin-bottom: 12px; text-shadow: 0 0 25px rgba(135, 206, 250, 0.35);">Soman Jose</h4>
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 15px; letter-spacing: 0.25em; color: #87CEFA; text-transform: uppercase; margin: 0; font-weight: 300; opacity: 0.9;">Founder & Sculptor – ARTILORA</p>
          </div>
          
          <!-- Biography Paragraphs -->
          <div style="max-width: 900px; margin: 0 auto;">
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Soman Jose is an Indian sculptor and the founder of Artilora, a sculpture practice that emerges from a profound dialogue between nature and human consciousness. Through his pioneering work with aerial roots, he transforms naturally formed structures into contemplative sculptures that embody memory, resilience, and inner reflection.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Born and raised in Kerala, India, Soman developed an early sensitivity to the rhythms of nature and the silent spaces within human experience. Rather than imposing form upon material, he approaches sculpture through attentive observation and deep listening, allowing each root, curve, and organic structure to reveal its own inherent story. This intuitive process allows his sculptures to retain the living spirit of the material while evolving into refined artistic expressions.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Before dedicating himself fully to sculpture, Soman worked for many years across diverse cultural landscapes including the United Arab Emirates, Oman, Qatar, Saudi Arabia, Brunei, China, Kenya, Malta, and India. These experiences broadened his understanding of cultures and human emotions, enriching the philosophical depth of his artistic language.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Working from his studio in Kerala, Soman patiently shapes each sculpture with serenity and contemplation, preserving the organic integrity of aerial roots while guiding them into forms of quiet strength and balance. His signature work Primus marks the birth of the Artilora collection and symbolizes the beginning of a sculptural philosophy rooted in humility, silence, and inner awareness.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 0; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Through Artilora, Soman Jose invites viewers to pause—to step away from the noise of the world, reconnect with nature, and rediscover the subtle language of the human spirit.
            </p>
          </div>
        </div>

        <!-- Summary Card -->
        <div style="background: linear-gradient(135deg, rgba(139, 0, 0, 0.12) 0%, rgba(0, 31, 63, 0.18) 100%); border: 1px solid rgba(135, 206, 250, 0.3); border-radius: 12px; padding: 50px 55px; box-shadow: 0 8px 30px rgba(0, 0, 0, 0.45); max-width: 900px; margin: 0 auto 60px;">
          <p style="font-family: Arial, Helvetica, sans-serif; font-size: 16px; line-height: 1.0 !important5; color: #87CEFA; text-align: center; margin: 0; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
            Soman Jose is an Indian sculptor and founder of Artilora, known for creating contemplative sculptures from<br>
            aerial roots. His work transforms natural organic structures into expressive forms that explore memory,<br>
            resilience, and human emotion. Drawing inspiration from nature and global cultural experiences,<br>
            his sculptures invite viewers into moments of quiet reflection and inner awareness.
          </p>
        </div>

        <!-- Artist Statement -->
        <div style="background: linear-gradient(135deg, rgba(0, 31, 63, 0.2) 0%, rgba(139, 0, 0, 0.15) 100%); border: 2px solid rgba(135, 206, 250, 0.35); border-radius: 12px; padding: 60px 65px; box-shadow: 0 12px 45px rgba(0, 0, 0, 0.55); max-width: 950px; margin: 0 auto;">
          <div style="text-align: center; margin-bottom: 10px;">
            <div style="width: 60px; height: 60px; margin: 0 auto 20px; border: 2px solid #87CEFA; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 0 20px rgba(135, 206, 250, 0.4);">
              <span style="font-size: 28px; color: #87CEFA;">✦</span>
            </div>
          </div>
          
          <div style="max-width: 850px; margin: 0 auto;">
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              At Artilora, sculpture is not an act of imposing form, but an act of listening.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Each aerial root carries its own history—shaped by wind, soil, rain, and time. My role as a sculptor is simply to recognize the hidden language within these natural forms and allow their silent narratives to emerge.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Through patience and contemplation, I guide these roots into sculptural expressions that reflect the emotional journeys of human life—strength, vulnerability, endurance, and hope.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 16px; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Artilora is therefore not only about sculpture; it is about rediscovering the quiet relationship between nature and the human spirit.
            </p>
            
            <p style="font-family: Arial, Helvetica, sans-serif; font-size: 17px; line-height: 1.0 !important; color: #87CEFA; text-align: justify; margin-bottom: 0; font-weight: 300; text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.8);">
              Every sculpture invites the viewer to pause, to breathe, and to reconnect with the silent wisdom that nature has always offered us.
            </p>
          </div>
        </div>

      </div>
    </section>

    <!-- Meet the Artist CV Section (Immediately visible, no gap) -->
    <MeetTheArtist />

  </div>
</template>

<script setup>
const isSpeaking = ref(false)
const isSpeakingStillness = ref(false)
const isSpeakingAttention = ref(false)
const isSpeakingAlignment = ref(false)

const audioProgress = ref(0)
const audioProgressStillness = ref(0)
const audioProgressAttention = ref(0)
const audioProgressAlignment = ref(0)
const isDoorsOpen = ref(false)
let speechSynthesis = null
let currentUtterance = null
let progressInterval = null

onMounted(() => {
  setTimeout(() => {
    isDoorsOpen.value = true
  }, 500)
})

// Text-to-Speech function for About section
const speakAbout = () => {
  if (process.client && window.speechSynthesis) {
    speechSynthesis = window.speechSynthesis
    
    if (isSpeaking.value) {
      // Stop speaking
      speechSynthesis.cancel()
      isSpeaking.value = false
      audioProgress.value = 0
      if (progressInterval) {
        clearInterval(progressInterval)
      }
      return
    }
    
    const aboutText = `
      The art of inner listening is the art of inner feeling. From feeling emerges the art of creation. And after creation, it becomes Artilora.
      
      No crafting — only meditation with nature.
      
      My journey began not in the act of making, but in listening. In the quiet of my earliest days, silence revealed 
      itself as a teacher — patient, observant, and profound. I learned that nature is the original artist, shaping 
      without urgency or intention. Wind carves the cliffs, water smooths the stones, and time inscribes memory into 
      the bark of ancient trees.
      
      In this practice, I do not impose form upon the material. I remain present with it. Wood carries its own rhythm, 
      history, and direction; my role is to attend, to wait, and to respond. What emerges is not a product of force, 
      but of alignment — between breath and grain, stillness and movement, thought and matter.
      
      What I seek is not perfection, but presence. Each work becomes a moment of surrender, where intention softens 
      and awareness deepens. In allowing the material to lead, I am reminded that creation is not an act of control, 
      but of trust. When the mind grows quiet, form reveals itself gently — arriving not as something made, but as 
      something remembered.
    `
    
    currentUtterance = new SpeechSynthesisUtterance(aboutText)
    
    // Try to select a male voice with lower pitch
    const voices = speechSynthesis.getVoices()
    const maleVoice = voices.find(voice => 
      voice.name.includes('Male') || 
      voice.name.includes('David') || 
      voice.name.includes('James') ||
      voice.name.includes('Google UK English Male')
    )
    if (maleVoice) {
      currentUtterance.voice = maleVoice
    }
    
    currentUtterance.rate = 0.75  // Slower for more powerful feel
    currentUtterance.pitch = 0.6  // Much lower pitch for deeper, harder voice
    currentUtterance.volume = 1.0
    
    // Estimate duration and update progress
    const estimatedDuration = (aboutText.length / 15) * 1000 / currentUtterance.rate // rough estimate
    
    currentUtterance.onstart = () => {
      isSpeaking.value = true
      audioProgress.value = 0
      
      // Update progress bar
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
      if (progressInterval) {
        clearInterval(progressInterval)
      }
      setTimeout(() => {
        audioProgress.value = 0
      }, 500)
    }
    
    currentUtterance.onerror = () => {
      isSpeaking.value = false
      audioProgress.value = 0
      if (progressInterval) {
        clearInterval(progressInterval)
      }
    }
    
    speechSynthesis.speak(currentUtterance)
  }
}

// Generic speak function for sections
const createSectionSpeakFunction = (speakingRef, progressRef, text) => {
  return () => {
    if (process.client && window.speechSynthesis) {
      speechSynthesis = window.speechSynthesis
      
      if (speakingRef.value) {
        speechSynthesis.cancel()
        speakingRef.value = false
        progressRef.value = 0
        if (progressInterval) clearInterval(progressInterval)
        return
      }
      
      currentUtterance = new SpeechSynthesisUtterance(text)
      
      const voices = speechSynthesis.getVoices()
      const maleVoice = voices.find(voice => 
        voice.name.includes('Male') || voice.name.includes('David') || voice.name.includes('James')
      )
      if (maleVoice) currentUtterance.voice = maleVoice
      
      currentUtterance.rate = 0.75
      currentUtterance.pitch = 0.6
      currentUtterance.volume = 1.0
      
      const estimatedDuration = (text.length / 15) * 1000 / currentUtterance.rate
      
      currentUtterance.onstart = () => {
        speakingRef.value = true
        progressRef.value = 0
        const startTime = Date.now()
        progressInterval = setInterval(() => {
          const elapsed = Date.now() - startTime
          const progress = Math.min((elapsed / estimatedDuration) * 100, 99)
          progressRef.value = progress
        }, 100)
      }
      
      currentUtterance.onend = () => {
        speakingRef.value = false
        progressRef.value = 100
        if (progressInterval) clearInterval(progressInterval)
        setTimeout(() => { progressRef.value = 0 }, 500)
      }
      
      currentUtterance.onerror = () => {
        speakingRef.value = false
        progressRef.value = 0
        if (progressInterval) clearInterval(progressInterval)
      }
      
      speechSynthesis.speak(currentUtterance)
    }
  }
}

// Speak functions for each section
const speakStillness = createSectionSpeakFunction(
  isSpeakingStillness,
  audioProgressStillness,
  `Stillness. Silence as Ground. Revelation begins when movement ceases. Stillness is the condition in which listening becomes possible. In silence, the noise of intention dissolves and attention sharpens. This is where the artist steps back, allowing nature's rhythm to surface. Without stillness, form remains hidden; with it, form begins to speak. Stillness is not absence, it is readiness.`
)

const speakAttention = createSectionSpeakFunction(
  isSpeakingAttention,
  audioProgressAttention,
  `Attention. Deep Listening to Material. Revelation unfolds through sustained presence. Wood carries memory — of wind, rain, growth, and time. Through careful observation and patience, its grain, resistance, and direction offer guidance. Attention replaces control. The artist does not decide; the material is disclosed. What is listened to deeply no longer needs to be forced.`
)

const speakAlignment = createSectionSpeakFunction(
  isSpeakingAlignment,
  audioProgressAlignment,
  `Alignment. Union of Breath, Time, and Matter. Revelation completes itself through harmony. When inner rhythm aligns with the material's nature, form emerges naturally. Action arises without struggle. This is the moment where effort becomes ease and making becomes meditation. Work appears not as invention, but as inevitability. Alignment is the moment when the artist disappears and form arrives.`
)

useHead({
  title: 'About - Artilora',
  meta: [
    { name: 'description', content: 'Meet Soman Jose, the artist behind Artilora. Learn about the art of inner listening and the process of revelation through stillness, attention, and alignment with nature.' },
    { name: 'keywords', content: 'Soman Jose, artist biography, art philosophy, meditation art, organic sculptor, Kerala artist' },
    { property: 'og:title', content: 'About - Artilora' },
    { property: 'og:description', content: 'The art of inner listening - where meditation meets nature and form reveals itself.' },
    { property: 'og:type', content: 'profile' },
    { property: 'og:url', content: 'http://192.168.10.66:3009/about' },
    { property: 'og:image', content: 'http://192.168.10.66:3009/sj_photofinished.png' }
  ]
})
</script>

<style scoped>
.about-page-wrapper {
  min-height: 100vh;
  background-color: #001F3F;
}

/* ========== GLITTER ANIMATION FOR CORNERS ========== */
@keyframes glitter {
  0%, 100% {
    opacity: 0.6;
  }
  50% {
    opacity: 1;
  }
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

/* ========== SMALLER AUDIO BUTTONS FOR SECTIONS ========== */

/* Circular Progress Ring - Small */
.circular-progress-small {
  transform: rotate(-90deg);
}

.progress-bg-small {
  fill: none;
  stroke: rgba(255, 215, 0, 0.2);
  stroke-width: 2.5;
}

.progress-ring-small {
  fill: none;
  stroke: #FFD700;
  stroke-width: 2.5;
  stroke-linecap: round;
  stroke-dasharray: 132;
  stroke-dashoffset: 132;
  transition: stroke-dashoffset 0.1s linear;
  filter: drop-shadow(0 0 6px rgba(255, 215, 0, 0.8));
}

/* Listen Button Inside Ring - Tiny */
.listen-button-tiny {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.8), rgba(255, 215, 0, 0.3));
  border: 2px solid #FFD700;
  border-radius: 50%;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 3px 10px rgba(255, 215, 0, 0.3);
  flex-shrink: 0;
}

.listen-button-tiny:hover {
  transform: translate(-50%, -50%) scale(1.1);
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.5);
}

.listen-button-tiny.speaking {
  animation: pulseTiny 1s ease-in-out infinite;
}

/* Waveform Below Ring - Tiny */
.waveform-container-tiny {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 2px;
  height: 16px;
}

.wave-bar-tiny {
  width: 2px;
  background: linear-gradient(180deg, #FFD700, #FFA500);
  border-radius: 1px;
  animation: waveAnimationTiny 0.8s ease-in-out infinite;
  box-shadow: 0 0 4px rgba(255, 215, 0, 0.6);
}

@keyframes waveAnimationTiny {
  0%, 100% { height: 4px; }
  50% { height: 14px; }
}

@keyframes pulseTiny {
  0%, 100% {
    transform: translate(-50%, -50%) scale(1);
  }
  50% {
    transform: translate(-50%, -50%) scale(1.05);
  }
}

/* ========== MEMBERSHIP CARDS ========== */
.membership-card {
  background: #8B0000;
  border: 3px solid #8B4513;
  border-radius: 12px;
  padding: 24px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(139, 69, 19, 0.2);
  position: relative;
  overflow: hidden;
}

.membership-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #FFD700, #FFA500, #FFD700);
}

.membership-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px rgba(139, 69, 19, 0.3);
  border-color: #FFD700;
}

.membership-icon {
  font-size: 48px;
  margin-bottom: 16px;
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
}

.membership-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  font-weight: bold;
  color: #FFFFFF;
  margin-bottom: 8px;
  min-height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.membership-type {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFFFFF;
  font-weight: 600;
  margin-bottom: 4px;
}

.membership-year {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 12px;
  color: #FFD700;
  font-style: italic;
}

/* ========== EXHIBITION CARDS ========== */
.exhibition-card {
  background: #8B0000;
  border: 3px solid #8B4513;
  border-radius: 12px;
  padding: 24px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(139, 69, 19, 0.2);
  position: relative;
  overflow: hidden;
  text-align: center;
}

.exhibition-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 4px;
  background: linear-gradient(90deg, #FFD700, #FFA500, #FFD700);
}

.exhibition-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px rgba(139, 69, 19, 0.3);
  border-color: #FFD700;
}

.exhibition-icon {
  font-size: 48px;
  margin-bottom: 16px;
  filter: drop-shadow(0 2px 4px rgba(0, 0, 0, 0.2));
}

.exhibition-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  font-weight: bold;
  color: #FFFFFF;
  margin-bottom: 12px;
  min-height: 48px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.exhibition-location {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFFFFF;
  font-weight: 600;
  margin-bottom: 6px;
}

.exhibition-date {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 13px;
  color: #FFD700;
  margin-bottom: 8px;
  font-weight: 500;
}

.exhibition-type {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 12px;
  color: #FFFFFF;
  font-style: italic;
  background: rgba(255, 215, 0, 0.2);
  padding: 4px 12px;
  border-radius: 12px;
  display: inline-block;
}
</style>
