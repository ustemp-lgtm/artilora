<template>
  <div class="awards-page-wrapper">
    <!-- Breadcrumb Navigation -->
    <BreadcrumbNav />
    
    <div class="container mx-auto px-8 md:px-12 py-8 md:py-12 space-y-8 md:space-y-12">
      
      <!-- Page Header -->
      <SectionReveal>
        <div class="text-left mb-8 ml-10 md:ml-16">
          <h1 class="glittering-heading text-2xl md:text-3xl font-sans mb-4" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4;">
            Awards,<br>Honors, and<br>Appreciations
          </h1>
          <p class="text-lg md:text-xl max-w-4xl mt-2" style="font-family: 'Bradley Hand ITC', cursive; line-height: 1.4; text-align: justify; color: #FFFFFF;">
            My sculptures have been honored with various awards and recognitions, reflecting the impact of my work in the art community. Below is a selection of notable achievements, organized in reverse chronological order to showcase the most recent accomplishments first.
          </p>
        </div>
      </SectionReveal>

      <!-- Awards Table -->
      <SectionReveal>
        <div class="mb-8 ml-10 md:ml-16">
          <h2 class="text-lg md:text-xl font-sans inline-block mb-6" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; background-color: #001F3F; border-left: 2px solid #FFD700; border-bottom: 2px solid #FFD700; padding: 12px 20px;">
            Awards & Recognitions
          </h2>
          
          <!-- Responsive Table Wrapper -->
          <div class="awards-table-wrapper">
            <table class="awards-table">
              <thead>
                <tr>
                  <th>Year</th>
                  <th>Award</th>
                  <th>Organization/Event</th>
                  <th>Description</th>
                </tr>
              </thead>
              <tbody>
                <!-- Award Row 1 -->
                <tr>
                  <td class="year-cell">2030</td>
                  <td class="award-cell">[Award Name]</td>
                  <td class="org-cell">[Organization/Event Name]</td>
                  <td class="desc-cell">Awarded for '[Sculpture Name - Arty-XXX]' – [brief description of achievement]</td>
                </tr>
                
                <!-- Award Row 2 -->
                <tr>
                  <td class="year-cell">2029</td>
                  <td class="award-cell">[Award Name]</td>
                  <td class="org-cell">[Organization/Event Name]</td>
                  <td class="desc-cell">Awarded for '[Sculpture Name - Arty-XXX]' – [brief description of achievement]</td>
                </tr>
                
                <!-- Award Row 3 -->
                <tr>
                  <td class="year-cell">2028</td>
                  <td class="award-cell">[Award Name]</td>
                  <td class="org-cell">[Organization/Event Name]</td>
                  <td class="desc-cell">Awarded for '[Sculpture Name - Arty-XXX]' – [brief description of achievement]</td>
                </tr>
                
                <!-- Award Row 4 -->
                <tr>
                  <td class="year-cell">2027</td>
                  <td class="award-cell">[Award Name]</td>
                  <td class="org-cell">[Organization/Event Name]</td>
                  <td class="desc-cell">Awarded for '[Sculpture Name - Arty-XXX]' – [brief description of achievement]</td>
                </tr>
                
                <!-- Add more rows as needed -->
              </tbody>
            </table>
          </div>
        </div>
      </SectionReveal>

      <!-- Appreciations & Press Features -->
      <SectionReveal>
        <div class="mb-8 ml-10 md:ml-16">
          <h2 class="text-lg md:text-xl font-sans inline-block mb-6" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF; background-color: #001F3F; border-left: 2px solid #FFD700; border-bottom: 2px solid #FFD700; padding: 12px 20px;">
            Appreciations & Press Features
          </h2>
          
          <div class="appreciation-list">
            <div class="appreciation-item">
              <div class="appreciation-icon">📰</div>
              <div class="appreciation-content">
                <h3 class="appreciation-title">[Press Feature Title]</h3>
                <p class="appreciation-source">Featured in: [Publication Name]</p>
                <p class="appreciation-desc">[Brief description of the feature or appreciation]</p>
                <p class="appreciation-date">[Month Year]</p>
              </div>
            </div>

            <div class="appreciation-item">
              <div class="appreciation-icon">🌟</div>
              <div class="appreciation-content">
                <h3 class="appreciation-title">[Recognition Title]</h3>
                <p class="appreciation-source">From: [Organization/Person]</p>
                <p class="appreciation-desc">[Brief description of the appreciation]</p>
                <p class="appreciation-date">[Month Year]</p>
              </div>
            </div>

            <div class="appreciation-item">
              <div class="appreciation-icon">💬</div>
              <div class="appreciation-content">
                <h3 class="appreciation-title">[Testimonial/Review]</h3>
                <p class="appreciation-source">From: [Reviewer Name/Organization]</p>
                <p class="appreciation-desc">[Brief quote or description]</p>
                <p class="appreciation-date">[Month Year]</p>
              </div>
            </div>
          </div>
        </div>
      </SectionReveal>

      <!-- Footer Links -->
      <div class="text-center mt-8 mb-4">
        <p class="text-lg mb-4" style="font-family: 'Bradley Hand ITC', cursive; color: #FFFFFF;">
          For more details about my work and artistic journey:
        </p>
        <div class="flex flex-wrap justify-center gap-4">
          <NuxtLink to="/about" class="footer-link">View Full CV & Artist Statement</NuxtLink>
          <NuxtLink to="/gallery" class="footer-link">Explore Gallery</NuxtLink>
          <NuxtLink to="/contact" class="footer-link">Contact Me</NuxtLink>
        </div>
      </div>

      <!-- Note -->
      <div class="text-center mt-6">
        <p class="text-sm italic" style="font-family: 'Bradley Hand ITC', cursive; color: rgba(255, 255, 255, 0.6);">
          * Awards and recognition details are being updated as new honors are received. Please check back for the latest achievements.
        </p>
      </div>

    </div>
  </div>
</template>

<script setup>
useHead({
  title: 'Awards & Recognition - Artilora',
  meta: [
    { name: 'description', content: 'Awards, honors, and recognition received by Artilora for excellence in Aerial Root Sculpture and artistic contribution.' },
    { name: 'keywords', content: 'art awards, sculpture awards, recognition, honors, Artilora achievements, international awards' },
    { property: 'og:title', content: 'Awards & Recognition - Artilora' },
    { property: 'og:description', content: 'Recognition and honors for sculptural excellence in Aerial Root Sculpture.' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: 'http://192.168.10.66:3009/awards' }
  ]
})
</script>

<style scoped>
.awards-page-wrapper {
  min-height: 100vh;
  background-color: #001F3F;
}

/* ========== AWARDS TABLE ========== */
.awards-table-wrapper {
  overflow-x: auto;
  background: #001F3F;
  border-radius: 12px;
  box-shadow: 0 4px 20px rgba(0, 31, 63, 0.4);
  border: 2px solid #FFD700;
}

.awards-table {
  width: 100%;
  border-collapse: collapse;
  font-family: 'Bradley Hand ITC', cursive;
}

.awards-table thead {
  background: linear-gradient(135deg, #001F3F, #003366);
}

.awards-table th {
  color: #FFFFFF;
  font-weight: bold;
  font-size: 16px;
  padding: 16px 12px;
  text-align: left;
  border-bottom: 3px solid #FFD700;
}

.awards-table tbody tr {
  border-bottom: 1px solid #D9A87C;
  transition: background-color 0.3s ease;
}

.awards-table tbody tr:hover {
  background-color: #003366;
}

.awards-table tbody tr:last-child {
  border-bottom: none;
}

.awards-table td {
  padding: 16px 12px;
  vertical-align: top;
}

.year-cell {
  font-weight: bold;
  color: #FFD700;
  font-size: 18px;
  width: 80px;
  text-align: center;
}

.award-cell {
  font-weight: bold;
  color: #FFFFFF;
  font-size: 16px;
  min-width: 180px;
}

.org-cell {
  color: #FFD700;
  font-size: 14px;
  min-width: 200px;
}

.desc-cell {
  color: #FFFFFF;
  font-size: 14px;
  line-height: 1.6;
  text-align: justify;
  min-width: 300px;
}

.image-cell {
  text-align: center;
  width: 150px;
}

.award-image {
  max-width: 120px;
  height: auto;
  border-radius: 8px;
  border: 2px solid #D9A87C;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  transition: transform 0.3s ease;
}

.award-image:hover {
  transform: scale(1.1);
  cursor: pointer;
}

/* Mobile Responsive */
@media (max-width: 768px) {
  .awards-table th,
  .awards-table td {
    padding: 12px 8px;
    font-size: 13px;
  }
  
  .year-cell {
    font-size: 16px;
  }
  
  .award-cell {
    font-size: 14px;
  }
  
  .image-cell {
    width: 100px;
  }
  
  .award-image {
    max-width: 80px;
  }
}

/* ========== APPRECIATION LIST ========== */
.appreciation-list {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.appreciation-item {
  display: flex;
  gap: 20px;
  background: #001F3F;
  border-radius: 8px;
  padding: 20px;
  transition: all 0.3s ease;
  border: 1px solid #FFD700;
}

.appreciation-item:nth-child(1) {
  border: 2px solid #FFD700;
  border-left: 5px solid #FFD700;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.15);
}

.appreciation-item:nth-child(1):hover {
  transform: translateX(5px);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.25);
}

.appreciation-item:nth-child(1) .appreciation-title {
  color: #FFFFFF;
}

.appreciation-item:nth-child(1) .appreciation-source {
  color: #FFD700;
}

.appreciation-item:nth-child(1) .appreciation-date {
  color: #FFD700;
}

.appreciation-item:nth-child(2) {
  border: 2px solid #FFD700;
  border-left: 5px solid #FFD700;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.15);
}

.appreciation-item:nth-child(2):hover {
  transform: translateX(5px);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.25);
}

.appreciation-item:nth-child(2) .appreciation-title {
  color: #FFFFFF;
}

.appreciation-item:nth-child(2) .appreciation-source {
  color: #FFD700;
}

.appreciation-item:nth-child(2) .appreciation-date {
  color: #FFD700;
}

.appreciation-item:nth-child(3) {
  border: 2px solid #FFD700;
  border-left: 5px solid #FFD700;
  box-shadow: 0 4px 15px rgba(255, 215, 0, 0.15);
}

.appreciation-item:nth-child(3):hover {
  transform: translateX(5px);
  box-shadow: 0 6px 20px rgba(255, 215, 0, 0.25);
}

.appreciation-item:nth-child(3) .appreciation-title {
  color: #FFFFFF;
}

.appreciation-item:nth-child(3) .appreciation-source {
  color: #FFD700;
}

.appreciation-item:nth-child(3) .appreciation-date {
  color: #FFD700;
}

.appreciation-icon {
  font-size: 40px;
  flex-shrink: 0;
}

.appreciation-content {
  flex: 1;
}

.appreciation-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 8px;
}

.appreciation-source {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  font-weight: 600;
  margin-bottom: 8px;
}

.appreciation-desc {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFFFFF;
  line-height: 1.6;
  margin-bottom: 6px;
}

.appreciation-date {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 13px;
  font-style: italic;
}

/* ========== FOOTER LINKS ========== */
.footer-link {
  display: inline-block;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  font-weight: bold;
  color: #FFFFFF;
  background-color: #001F3F;
  padding: 12px 24px;
  border-radius: 8px;
  border: 2px solid #FFD700;
  transition: all 0.3s ease;
  text-decoration: none;
}

.footer-link:hover {
  background-color: #003366;
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 31, 63, 0.5);
}

/* ========== GLITTERING HEADING ========== */
.glittering-heading {
  color: #FFD700;
  text-shadow: 
    0 0 10px rgba(255, 215, 0, 0.8),
    0 0 20px rgba(255, 215, 0, 0.6),
    0 0 30px rgba(255, 215, 0, 0.4),
    0 0 40px rgba(255, 215, 0, 0.2);
  animation: glitter 2s ease-in-out infinite;
}

@keyframes glitter {
  0%, 100% {
    text-shadow: 
      0 0 10px rgba(255, 215, 0, 0.8),
      0 0 20px rgba(255, 215, 0, 0.6),
      0 0 30px rgba(255, 215, 0, 0.4),
      0 0 40px rgba(255, 215, 0, 0.2);
  }
  50% {
    text-shadow: 
      0 0 20px rgba(255, 215, 0, 1),
      0 0 30px rgba(255, 215, 0, 0.8),
      0 0 40px rgba(255, 215, 0, 0.6),
      0 0 50px rgba(255, 215, 0, 0.4),
      0 0 60px rgba(255, 215, 0, 0.2);
  }
}
</style>
