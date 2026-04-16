# Virtual Studio Tour - Tasks

## Task List

- [ ] 1. Content Preparation and Setup
  - [ ] 1.1 Capture studio photographs (12-18 high-quality images)
  - [ ] 1.2 Optimize images for web (WebP + JPEG fallback)
  - [ ] 1.3 Create zone configuration JSON file
  - [ ] 1.4 Define hotspot positions and content
  - [ ] 1.5 Write zone descriptions and atmosphere text

- [ ] 2. Create Core Components
  - [ ] 2.1 Create VirtualStudioTour.vue (main component)
  - [ ] 2.2 Create StudioZoneViewer.vue (zone display)
  - [ ] 2.3 Create StudioImage.vue (image with hotspots)
  - [ ] 2.4 Create StudioHotspot.vue (interactive markers)
  - [ ] 2.5 Create StudioZoneInfo.vue (zone description panel)

- [ ] 3. Create Navigation Components
  - [ ] 3.1 Create StudioNavigation.vue (main navigation wrapper)
  - [ ] 3.2 Create StudioZoneSelector.vue (thumbnail navigation)
  - [ ] 3.3 Create StudioArrows.vue (prev/next buttons)
  - [ ] 3.4 Implement keyboard navigation (arrow keys, Enter, Escape)

- [ ] 4. Create Information Display Components
  - [ ] 4.1 Create StudioInfoPanel.vue (hotspot modal)
  - [ ] 4.2 Create StudioProgress.vue (progress indicator)
  - [ ] 4.3 Create StudioHero.vue (entry banner)
  - [ ] 4.4 Create StudioCTA.vue (call-to-action section)

- [ ] 5. Create Studio Tour Page
  - [ ] 5.1 Create pages/studio.vue
  - [ ] 5.2 Integrate all components
  - [ ] 5.3 Implement zone navigation logic
  - [ ] 5.4 Implement hotspot interaction logic
  - [ ] 5.5 Implement progress tracking

- [ ] 6. Styling and Animations
  - [ ] 6.1 Style all components with golden theme
  - [ ] 6.2 Implement zone transition animations
  - [ ] 6.3 Implement hotspot pulse animation
  - [ ] 6.4 Implement modal fade-in/out transitions
  - [ ] 6.5 Add hover effects and interactions

- [ ] 7. Responsive Design
  - [ ] 7.1 Implement mobile layout for tour
  - [ ] 7.2 Implement touch/swipe gestures
  - [ ] 7.3 Adjust hotspot sizes for mobile (44x44px minimum)
  - [ ] 7.4 Test on various screen sizes
  - [ ] 7.5 Optimize for tablet devices

- [ ] 8. Integration and Navigation
  - [ ] 8.1 Add "Studio Tour" link to main navigation
  - [ ] 8.2 Add "Visit Studio" link in footer
  - [ ] 8.3 Add tour preview on home page (optional)
  - [ ] 8.4 Implement proper routing

- [ ] 9. Performance Optimization
  - [ ] 9.1 Implement lazy loading for zone images
  - [ ] 9.2 Preload next zone image for smooth transitions
  - [ ] 9.3 Optimize image sizes and formats
  - [ ] 9.4 Test loading performance
  - [ ] 9.5 Implement blur-up progressive loading

- [ ] 10. Accessibility
  - [ ] 10.1 Add ARIA labels to all interactive elements
  - [ ] 10.2 Implement keyboard navigation
  - [ ] 10.3 Add alt text to all images
  - [ ] 10.4 Test with screen readers
  - [ ] 10.5 Ensure focus indicators are visible

- [ ] 11. Testing and Deployment
  - [ ] 11.1 Test zone navigation
  - [ ] 11.2 Test hotspot interactions
  - [ ] 11.3 Test modal functionality
  - [ ] 11.4 Test on mobile devices
  - [ ] 11.5 Deploy to VM and verify

---

## Task Details

### Task 1: Content Preparation and Setup
**Status:** Not Started  
**Priority:** High (Required before development)

**Description:**
Prepare all content needed for the virtual studio tour including photographs, zone descriptions, and hotspot information.

**Steps:**
1. **Capture Studio Photographs:**
   - Take 2-3 photos of each zone (12-18 total)
   - Use good lighting (natural or warm artificial)
   - Capture wide shots showing entire zone
   - Take detail shots for hotspots
   - Minimum resolution: 1920x1080px

2. **Optimize Images:**
   - Convert to WebP format for modern browsers
   - Keep JPEG versions as fallback
   - Compress without losing quality
   - Create thumbnails (120x80px) for zone selector
   - Name files: `zone-name-main.jpg`, `zone-name-thumb.jpg`

3. **Create Zone Configuration:**
   - Create `/public/data/studio-zones.json`
   - Define 6 zones with descriptions
   - Write atmosphere text for each zone
   - List key features

4. **Define Hotspots:**
   - Identify 8-12 interesting points across all zones
   - Determine x,y coordinates (percentage-based)
   - Write title and description for each
   - Categorize: tool, material, process, inspiration, artwork
   - Take close-up photos if needed

5. **Write Content:**
   - Zone descriptions (1-2 paragraphs each)
   - Atmosphere descriptions (1-2 sentences)
   - Hotspot descriptions (2-3 sentences)
   - Call-to-action text

**Files to Create:**
- `/public/studio/*.jpg` (12-18 images)
- `/public/data/studio-zones.json`

**Acceptance Criteria:**
- ✓ All 6 zones have main images and thumbnails
- ✓ Images are optimized (WebP + JPEG)
- ✓ Zone configuration JSON is valid
- ✓ All hotspots have positions and descriptions
- ✓ Content is written in Bradley Hand ITC style

---

### Task 2: Create Core Components
**Status:** Not Started  
**Priority:** High

**Description:**
Create the main Vue components that form the core of the virtual studio tour experience.

**Implementation:**

**2.1 VirtualStudioTour.vue:**
```vue
<template>
  <div class="virtual-studio-tour">
    <!-- Zone Viewer -->
    <StudioZoneViewer
      v-if="currentZone"
      :zone="currentZone"
      @hotspot-click="openHotspot"
    />
    
    <!-- Navigation -->
    <StudioNavigation
      :zones="zones"
      :current-index="currentZoneIndex"
      @navigate="navigateToZone"
    />
    
    <!-- Progress Indicator -->
    <StudioProgress
      :progress="tourProgress"
      :visited-count="visitedZones.size"
      :total-count="zones.length"
    />
    
    <!-- Info Panel Modal -->
    <StudioInfoPanel
      :hotspot="selectedHotspot"
      :is-open="isInfoPanelOpen"
      @close="closeInfoPanel"
    />
  </div>
</template>

<script setup>
const zones = ref([])
const currentZoneIndex = ref(0)
const selectedHotspot = ref(null)
const isInfoPanelOpen = ref(false)
const visitedZones = ref(new Set([0]))
const tourProgress = computed(() => 
  (visitedZones.value.size / zones.value.length) * 100
)
const currentZone = computed(() => zones.value[currentZoneIndex.value])

const loadZones = async () => {
  const response = await fetch('/data/studio-zones.json')
  const data = await response.json()
  zones.value = data.zones
}

const navigateToZone = (index) => {
  if (index >= 0 && index < zones.value.length) {
    currentZoneIndex.value = index
    visitedZones.value.add(index)
  }
}

const openHotspot = (hotspot) => {
  selectedHotspot.value = hotspot
  isInfoPanelOpen.value = true
}

const closeInfoPanel = () => {
  isInfoPanelOpen.value = false
  selectedHotspot.value = null
}

const handleKeyPress = (e) => {
  if (isInfoPanelOpen.value) {
    if (e.key === 'Escape') closeInfoPanel()
    return
  }
  
  if (e.key === 'ArrowLeft') navigateToZone(currentZoneIndex.value - 1)
  if (e.key === 'ArrowRight') navigateToZone(currentZoneIndex.value + 1)
}

onMounted(() => {
  if (process.client) {
    loadZones()
    document.addEventListener('keydown', handleKeyPress)
  }
})

onUnmounted(() => {
  if (process.client) {
    document.removeEventListener('keydown', handleKeyPress)
  }
})
</script>
```

**2.2-2.5:** Create remaining core components following design document specifications.

**Files to Create:**
- `components/VirtualStudioTour.vue`
- `components/StudioZoneViewer.vue`
- `components/StudioImage.vue`
- `components/StudioHotspot.vue`
- `components/StudioZoneInfo.vue`

**Acceptance Criteria:**
- ✓ All core components created
- ✓ Components follow Vue 3 Composition API
- ✓ Props and events properly defined
- ✓ State management implemented
- ✓ Lifecycle hooks properly used

---

### Task 3: Create Navigation Components
**Status:** Not Started  
**Priority:** High

**Description:**
Create components for navigating between studio zones including arrows, thumbnails, and keyboard controls.

**Implementation:**
Follow design document specifications for:
- StudioNavigation.vue (wrapper)
- StudioZoneSelector.vue (thumbnails)
- StudioArrows.vue (prev/next buttons)
- Keyboard event handlers

**Files to Create:**
- `components/StudioNavigation.vue`
- `components/StudioZoneSelector.vue`
- `components/StudioArrows.vue`

**Acceptance Criteria:**
- ✓ Arrow buttons navigate between zones
- ✓ Arrows disabled at boundaries
- ✓ Thumbnail selector shows all zones
- ✓ Current zone highlighted in selector
- ✓ Keyboard navigation works (arrow keys)

---

### Task 4: Create Information Display Components
**Status:** Not Started  
**Priority:** Medium

**Description:**
Create components for displaying hotspot information, progress, hero banner, and call-to-action.

**Files to Create:**
- `components/StudioInfoPanel.vue`
- `components/StudioProgress.vue`
- `components/StudioHero.vue`
- `components/StudioCTA.vue`

**Acceptance Criteria:**
- ✓ Info panel displays hotspot details
- ✓ Modal opens/closes smoothly
- ✓ Progress indicator updates correctly
- ✓ Hero banner matches site design
- ✓ CTA section encourages engagement

---

### Task 5: Create Studio Tour Page
**Status:** Not Started  
**Priority:** High

**Description:**
Create the main studio tour page and integrate all components.

**Implementation:**
```vue
<!-- pages/studio.vue -->
<template>
  <div class="studio-page">
    <StudioHero />
    <VirtualStudioTour />
    <StudioCTA />
  </div>
</template>

<script setup>
useHead({
  title: 'Virtual Studio Tour - Artilora',
  meta: [
    { name: 'description', content: 'Explore the Artilora studio where aerial root sculptures are created' }
  ]
})
</script>

<style scoped>
.studio-page {
  background-color: #000000;
  min-height: 100vh;
}
</style>
```

**Files to Create:**
- `pages/studio.vue`

**Acceptance Criteria:**
- ✓ Page loads without errors
- ✓ All components integrated
- ✓ Zone navigation works
- ✓ Hotspots are interactive
- ✓ Progress tracking works

---

### Task 6: Styling and Animations
**Status:** Not Started  
**Priority:** Medium

**Description:**
Apply golden theme styling and implement smooth animations throughout the tour.

**Styling Requirements:**
- Golden color (#FFD700) for accents
- Black background (#000000)
- Dark red gradients (rgba(139, 0, 0, 0.95))
- Bradley Hand ITC font throughout
- Golden borders and glows

**Animations:**
- Zone transitions: Fade and slide (0.5s)
- Hotspot pulse: Continuous glow (2s infinite)
- Modal: Fade-in with slide-up (0.3s)
- Hover effects: Scale and glow

**Acceptance Criteria:**
- ✓ All components styled consistently
- ✓ Golden theme applied throughout
- ✓ Animations smooth (60fps)
- ✓ Hover effects work correctly
- ✓ Transitions feel natural

---

### Task 7: Responsive Design
**Status:** Not Started  
**Priority:** High

**Description:**
Ensure the tour works perfectly on mobile devices with touch gestures and appropriate sizing.

**Mobile Optimizations:**
- Hotspots: 44x44px minimum
- Touch/swipe gestures for navigation
- Vertical scrolling for zone info
- Simplified navigation on small screens
- Optimized image sizes

**Breakpoints:**
- Mobile: 480px
- Tablet: 768px
- Desktop: 1024px+

**Acceptance Criteria:**
- ✓ Tour works on mobile devices
- ✓ Swipe gestures navigate zones
- ✓ Hotspots are touch-friendly
- ✓ Layout adapts to screen size
- ✓ Performance good on mobile

---

### Task 8: Integration and Navigation
**Status:** Not Started  
**Priority:** Medium

**Description:**
Integrate the studio tour into the main site navigation and add links from other pages.

**Changes Needed:**
1. Add link to `components/TheHeader.vue`
2. Add link to `components/TheFooter.vue`
3. Optional: Add preview on home page
4. Ensure routing works correctly

**Acceptance Criteria:**
- ✓ "Studio Tour" link in main navigation
- ✓ Link in footer
- ✓ Routing works correctly
- ✓ Page accessible from all pages

---

### Task 9: Performance Optimization
**Status:** Not Started  
**Priority:** Medium

**Description:**
Optimize image loading and animations for best performance.

**Optimizations:**
- Lazy load zone images
- Preload next zone image
- Use WebP with JPEG fallback
- Implement blur-up loading
- Optimize animation performance

**Acceptance Criteria:**
- ✓ Initial load under 3 seconds
- ✓ Zone transitions smooth
- ✓ Images load progressively
- ✓ No performance issues on mobile
- ✓ Memory usage reasonable

---

### Task 10: Accessibility
**Status:** Not Started  
**Priority:** High

**Description:**
Ensure the tour is accessible to all users including keyboard navigation and screen reader support.

**Accessibility Features:**
- ARIA labels on all interactive elements
- Keyboard navigation (arrows, Enter, Escape, Tab)
- Alt text on all images
- Focus indicators visible
- High contrast text

**Acceptance Criteria:**
- ✓ Keyboard navigation works
- ✓ Screen reader compatible
- ✓ All images have alt text
- ✓ Focus indicators visible
- ✓ WCAG AA compliant

---

### Task 11: Testing and Deployment
**Status:** Not Started  
**Priority:** High

**Description:**
Test all functionality and deploy to production VM.

**Testing Checklist:**
- Zone navigation (arrows, thumbnails, keyboard)
- Hotspot interactions (click, hover, modal)
- Progress tracking
- Mobile gestures
- Browser compatibility
- Performance

**Deployment Steps:**
1. Upload studio images to VM
2. Upload zone configuration JSON
3. Upload all component files via base64
4. Test on VM (http://192.168.10.66:3009/studio)
5. Clear browser cache and verify
6. Test on mobile devices

**Acceptance Criteria:**
- ✓ All tests pass
- ✓ Tour works on VM
- ✓ No console errors
- ✓ Mobile version works
- ✓ Performance acceptable

---

## Deployment Notes

### VM Configuration
- **VM IP:** 192.168.10.66
- **VM User:** frank
- **VM Password:** VMware1!
- **Container Name:** website-nuxt-1
- **Site URL:** http://192.168.10.66:3009/studio
- **Working Directory:** /home/frank/website (VM), /usr/src/app/ (container)

### File Upload Method
- Base64 encoding via SSH (Posh-SSH module)
- Files uploaded in 4KB chunks
- Pattern: Clear file → Upload base64 chunks → Decode to actual file

### Browser Cache Management
- Users must clear cache (Ctrl+Shift+Delete)
- Or use Incognito mode (Ctrl+Shift+N)
- Container hot reload working correctly

---

## Success Criteria

### Functional Requirements
- ✓ All 6 zones accessible and navigable
- ✓ All hotspots interactive and informative
- ✓ Navigation smooth and intuitive
- ✓ Progress tracking accurate
- ✓ Modal displays hotspot information correctly

### Performance Requirements
- ✓ Initial load under 3 seconds
- ✓ Zone transitions smooth (60fps)
- ✓ No lag on mobile devices
- ✓ Images load progressively

### Design Requirements
- ✓ Golden theme consistent throughout
- ✓ Bradley Hand ITC font used
- ✓ Animations smooth and polished
- ✓ Responsive on all devices

### Accessibility Requirements
- ✓ Keyboard navigation works
- ✓ Screen reader compatible
- ✓ WCAG AA compliant
- ✓ Touch-friendly on mobile

---

## Content Checklist

Before implementation, ensure you have:

- [ ] 12-18 studio photographs (high quality)
- [ ] Zone descriptions written
- [ ] Hotspot positions determined
- [ ] Hotspot descriptions written
- [ ] Hero banner text
- [ ] Call-to-action text
- [ ] Images optimized (WebP + JPEG)
- [ ] Thumbnails created

---

**Status:** Ready for Implementation  
**Estimated Time:** 2-3 days (with content ready)  
**Created:** 2026-02-10  
**Last Updated:** 2026-02-10
