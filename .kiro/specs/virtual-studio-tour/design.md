# Virtual Studio Tour - Design Document

## Architecture Overview

The Virtual Studio Tour is a photo gallery-based interactive experience built with Vue 3 components. It provides an immersive way for visitors to explore the Artilora studio through high-quality images, interactive hotspots, and smooth navigation.

### Component Hierarchy
```
pages/studio.vue (main tour page)
├── StudioHero.vue (entry banner)
├── VirtualStudioTour.vue (main tour component)
│   ├── StudioZoneViewer.vue (displays current zone)
│   │   ├── StudioImage.vue (zone image with hotspots)
│   │   │   └── StudioHotspot.vue (interactive markers)
│   │   └── StudioZoneInfo.vue (zone description panel)
│   ├── StudioNavigation.vue (zone selector and arrows)
│   │   ├── StudioZoneSelector.vue (thumbnail navigation)
│   │   └── StudioArrows.vue (prev/next buttons)
│   ├── StudioInfoPanel.vue (hotspot information modal)
│   └── StudioProgress.vue (progress indicator)
└── StudioCTA.vue (call-to-action section)
```

## Data Structure

### Studio Zones Configuration
```javascript
// public/data/studio-zones.json
{
  "zones": [
    {
      "id": "workshop",
      "name": "The Workshop",
      "description": "Where aerial root sculptures come to life...",
      "atmosphere": "Creative energy fills this space...",
      "image": "/studio/workshop-main.jpg",
      "thumbnail": "/studio/workshop-thumb.jpg",
      "hotspots": [
        {
          "id": "ws-1",
          "x": 25,  // percentage from left
          "y": 40,  // percentage from top
          "title": "Sculpting Tools",
          "description": "Hand-selected tools for shaping aerial roots...",
          "image": "/studio/tools-closeup.jpg",
          "category": "tool"
        }
      ]
    }
  ]
}
```

### Zone Data Model
```typescript
interface StudioZone {
  id: string
  name: string
  description: string
  atmosphere: string
  image: string
  thumbnail: string
  hotspots: Hotspot[]
}

interface Hotspot {
  id: string
  x: number  // 0-100 percentage
  y: number  // 0-100 percentage
  title: string
  description: string
  image?: string
  category: 'tool' | 'material' | 'process' | 'inspiration' | 'artwork'
}
```

## Component Designs

### 1. VirtualStudioTour.vue (Main Component)

**State Management:**
```javascript
const currentZoneIndex = ref(0)
const zones = ref([])
const selectedHotspot = ref(null)
const isInfoPanelOpen = ref(false)
const tourProgress = ref(0)
const visitedZones = ref(new Set())
```

**Core Logic:**
```javascript
const loadZones = async () => {
  const response = await fetch('/data/studio-zones.json')
  zones.value = await response.json().zones
}

const navigateToZone = (index) => {
  if (index >= 0 && index < zones.value.length) {
    currentZoneIndex.value = index
    visitedZones.value.add(index)
    updateProgress()
  }
}

const updateProgress = () => {
  tourProgress.value = (visitedZones.value.size / zones.value.length) * 100
}

const openHotspot = (hotspot) => {
  selectedHotspot.value = hotspot
  isInfoPanelOpen.value = true
}

const closeInfoPanel = () => {
  isInfoPanelOpen.value = false
  selectedHotspot.value = null
}
```

**Lifecycle:**
```javascript
onMounted(() => {
  if (process.client) {
    loadZones()
    // Keyboard navigation
    document.addEventListener('keydown', handleKeyPress)
  }
})

onUnmounted(() => {
  if (process.client) {
    document.removeEventListener('keydown', handleKeyPress)
  }
})
```

**Correctness Properties:**
- P1.1: Tour MUST load zone data from JSON file
- P1.2: Current zone index MUST be within valid range (0 to zones.length-1)
- P1.3: Progress MUST update when zones are visited
- P1.4: Visited zones MUST be tracked without duplicates
- P1.5: Keyboard navigation MUST work (arrow keys)

---

### 2. StudioZoneViewer.vue

**Props:**
```javascript
const props = defineProps({
  zone: {
    type: Object,
    required: true
  }
})
```

**Template Structure:**
```vue
<template>
  <div class="zone-viewer">
    <!-- Zone Image with Hotspots -->
    <StudioImage 
      :src="zone.image" 
      :alt="zone.name"
      :hotspots="zone.hotspots"
      @hotspot-click="$emit('hotspot-click', $event)"
    />
    
    <!-- Zone Information -->
    <StudioZoneInfo 
      :name="zone.name"
      :description="zone.description"
      :atmosphere="zone.atmosphere"
    />
  </div>
</template>
```

**Styling:**
- Full-width container with black background
- Image centered with max-height constraint
- Zone info overlay at bottom with golden border
- Fade-in animation on zone change

**Correctness Properties:**
- P2.1: Zone image MUST be displayed with proper aspect ratio
- P2.2: Hotspots MUST be positioned correctly relative to image
- P2.3: Zone info MUST be readable over image
- P2.4: Component MUST emit hotspot-click events

---

### 3. StudioImage.vue (Image with Hotspots)

**Props:**
```javascript
const props = defineProps({
  src: String,
  alt: String,
  hotspots: Array
})
```

**Hotspot Positioning:**
```javascript
const getHotspotStyle = (hotspot) => {
  return {
    left: `${hotspot.x}%`,
    top: `${hotspot.y}%`,
    transform: 'translate(-50%, -50%)'
  }
}
```

**Template:**
```vue
<template>
  <div class="studio-image-container">
    <img 
      :src="src" 
      :alt="alt"
      class="studio-image"
      @load="onImageLoad"
    />
    
    <!-- Hotspots -->
    <StudioHotspot
      v-for="hotspot in hotspots"
      :key="hotspot.id"
      :hotspot="hotspot"
      :style="getHotspotStyle(hotspot)"
      @click="$emit('hotspot-click', hotspot)"
    />
  </div>
</template>
```

**Correctness Properties:**
- P3.1: Image MUST load before hotspots are displayed
- P3.2: Hotspots MUST be positioned using percentage coordinates
- P3.3: Hotspots MUST be clickable and emit events
- P3.4: Image MUST be responsive and maintain aspect ratio

---

### 4. StudioHotspot.vue (Interactive Marker)

**Props:**
```javascript
const props = defineProps({
  hotspot: {
    type: Object,
    required: true
  }
})
```

**State:**
```javascript
const isHovered = ref(false)
const isPulsing = ref(true)
```

**Template:**
```vue
<template>
  <div 
    class="studio-hotspot"
    :class="{ 
      'hotspot-hover': isHovered,
      'hotspot-pulse': isPulsing
    }"
    @mouseenter="isHovered = true"
    @mouseleave="isHovered = false"
    @click="$emit('click')"
  >
    <!-- Golden circle marker -->
    <div class="hotspot-marker"></div>
    
    <!-- Tooltip on hover -->
    <div v-if="isHovered" class="hotspot-tooltip">
      {{ hotspot.title }}
    </div>
  </div>
</template>
```

**Styling:**
```css
.studio-hotspot {
  position: absolute;
  width: 24px;
  height: 24px;
  cursor: pointer;
  z-index: 10;
}

.hotspot-marker {
  width: 100%;
  height: 100%;
  background: radial-gradient(circle, #FFD700 0%, rgba(255, 215, 0, 0.5) 100%);
  border: 2px solid #FFD700;
  border-radius: 50%;
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.8);
}

.hotspot-pulse {
  animation: hotspotPulse 2s ease-in-out infinite;
}

@keyframes hotspotPulse {
  0%, 100% {
    transform: scale(1);
    opacity: 1;
  }
  50% {
    transform: scale(1.3);
    opacity: 0.7;
  }
}

.hotspot-hover .hotspot-marker {
  transform: scale(1.5);
  box-shadow: 0 0 30px rgba(255, 215, 0, 1);
}

.hotspot-tooltip {
  position: absolute;
  bottom: 100%;
  left: 50%;
  transform: translateX(-50%);
  background: rgba(0, 0, 0, 0.9);
  color: #FFD700;
  padding: 8px 12px;
  border-radius: 8px;
  border: 1px solid #FFD700;
  white-space: nowrap;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  margin-bottom: 8px;
  pointer-events: none;
}

/* Mobile: Larger hotspots */
@media (max-width: 768px) {
  .studio-hotspot {
    width: 44px;
    height: 44px;
  }
}
```

**Correctness Properties:**
- P4.1: Hotspot MUST be visible with golden styling
- P4.2: Hotspot MUST pulse continuously
- P4.3: Hotspot MUST show tooltip on hover (desktop)
- P4.4: Hotspot MUST be at least 44x44px on mobile
- P4.5: Click event MUST be emitted when hotspot clicked

---

### 5. StudioNavigation.vue

**Props:**
```javascript
const props = defineProps({
  zones: Array,
  currentIndex: Number
})
```

**Template:**
```vue
<template>
  <div class="studio-navigation">
    <!-- Previous Arrow -->
    <button 
      class="nav-arrow nav-prev"
      :disabled="currentIndex === 0"
      @click="$emit('navigate', currentIndex - 1)"
    >
      <svg><!-- Left arrow icon --></svg>
    </button>
    
    <!-- Zone Selector -->
    <StudioZoneSelector
      :zones="zones"
      :current-index="currentIndex"
      @select="$emit('navigate', $event)"
    />
    
    <!-- Next Arrow -->
    <button 
      class="nav-arrow nav-next"
      :disabled="currentIndex === zones.length - 1"
      @click="$emit('navigate', currentIndex + 1)"
    >
      <svg><!-- Right arrow icon --></svg>
    </button>
  </div>
</template>
```

**Styling:**
- Fixed at bottom of viewport
- Golden arrows with hover effects
- Zone selector shows thumbnails
- Disabled state for arrows at boundaries

**Correctness Properties:**
- P5.1: Previous arrow MUST be disabled at first zone
- P5.2: Next arrow MUST be disabled at last zone
- P5.3: Navigation MUST emit correct zone index
- P5.4: Zone selector MUST highlight current zone

---

### 6. StudioZoneSelector.vue

**Template:**
```vue
<template>
  <div class="zone-selector">
    <div 
      v-for="(zone, index) in zones"
      :key="zone.id"
      class="zone-thumb"
      :class="{ 'zone-active': index === currentIndex }"
      @click="$emit('select', index)"
    >
      <img :src="zone.thumbnail" :alt="zone.name" />
      <span class="zone-name">{{ zone.name }}</span>
    </div>
  </div>
</template>
```

**Styling:**
```css
.zone-selector {
  display: flex;
  gap: 16px;
  overflow-x: auto;
  padding: 16px;
  scrollbar-width: thin;
  scrollbar-color: #FFD700 #000;
}

.zone-thumb {
  flex-shrink: 0;
  width: 120px;
  cursor: pointer;
  transition: all 0.3s ease;
  opacity: 0.6;
}

.zone-thumb:hover {
  opacity: 1;
  transform: translateY(-4px);
}

.zone-active {
  opacity: 1;
  border: 3px solid #FFD700;
  box-shadow: 0 0 20px rgba(255, 215, 0, 0.6);
}

.zone-thumb img {
  width: 100%;
  height: 80px;
  object-fit: cover;
  border-radius: 8px;
}

.zone-name {
  display: block;
  text-align: center;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 12px;
  color: #FFD700;
  margin-top: 4px;
}
```

**Correctness Properties:**
- P6.1: All zones MUST be displayed as thumbnails
- P6.2: Current zone MUST be highlighted
- P6.3: Clicking thumbnail MUST navigate to that zone
- P6.4: Selector MUST be horizontally scrollable

---

### 7. StudioInfoPanel.vue (Hotspot Modal)

**Props:**
```javascript
const props = defineProps({
  hotspot: Object,
  isOpen: Boolean
})
```

**Template:**
```vue
<template>
  <Transition name="modal-fade">
    <div 
      v-if="isOpen" 
      class="info-panel-overlay"
      @click="$emit('close')"
    >
      <div class="info-panel" @click.stop>
        <!-- Close Button -->
        <button class="close-btn" @click="$emit('close')">
          <svg><!-- X icon --></svg>
        </button>
        
        <!-- Hotspot Image (if available) -->
        <img 
          v-if="hotspot.image"
          :src="hotspot.image"
          :alt="hotspot.title"
          class="hotspot-image"
        />
        
        <!-- Hotspot Info -->
        <div class="hotspot-info">
          <h3 class="hotspot-title">{{ hotspot.title }}</h3>
          <p class="hotspot-category">{{ hotspot.category }}</p>
          <p class="hotspot-description">{{ hotspot.description }}</p>
        </div>
      </div>
    </div>
  </Transition>
</template>
```

**Styling:**
```css
.info-panel-overlay {
  position: fixed;
  inset: 0;
  background: rgba(0, 0, 0, 0.9);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: 20px;
}

.info-panel {
  background: linear-gradient(135deg, rgba(139, 0, 0, 0.95), rgba(0, 0, 0, 0.95));
  border: 3px solid #FFD700;
  border-radius: 16px;
  max-width: 600px;
  width: 100%;
  max-height: 80vh;
  overflow-y: auto;
  padding: 32px;
  box-shadow: 0 0 40px rgba(255, 215, 0, 0.5);
  position: relative;
}

.close-btn {
  position: absolute;
  top: 16px;
  right: 16px;
  background: none;
  border: none;
  color: #FFD700;
  cursor: pointer;
  font-size: 24px;
  transition: transform 0.3s ease;
}

.close-btn:hover {
  transform: scale(1.2);
}

.hotspot-image {
  width: 100%;
  height: auto;
  border-radius: 12px;
  margin-bottom: 24px;
}

.hotspot-title {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 28px;
  color: #FFD700;
  margin-bottom: 8px;
  text-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
}

.hotspot-category {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FF7F50;
  text-transform: uppercase;
  letter-spacing: 1px;
  margin-bottom: 16px;
}

.hotspot-description {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  color: #FFFFFF;
  line-height: 1.6;
}

/* Modal transitions */
.modal-fade-enter-active,
.modal-fade-leave-active {
  transition: opacity 0.3s ease;
}

.modal-fade-enter-from,
.modal-fade-leave-to {
  opacity: 0;
}

.modal-fade-enter-active .info-panel {
  animation: modalSlideUp 0.3s ease-out;
}

@keyframes modalSlideUp {
  from {
    transform: translateY(50px);
    opacity: 0;
  }
  to {
    transform: translateY(0);
    opacity: 1;
  }
}
```

**Correctness Properties:**
- P7.1: Modal MUST overlay entire viewport
- P7.2: Clicking overlay MUST close modal
- P7.3: Clicking inside panel MUST NOT close modal
- P7.4: Close button MUST close modal
- P7.5: Modal MUST be scrollable if content overflows
- P7.6: Modal MUST have smooth fade-in/out transition

---

### 8. StudioProgress.vue

**Props:**
```javascript
const props = defineProps({
  progress: Number,  // 0-100
  visitedCount: Number,
  totalCount: Number
})
```

**Template:**
```vue
<template>
  <div class="studio-progress">
    <div class="progress-label">
      Tour Progress: {{ visitedCount }} / {{ totalCount }} zones explored
    </div>
    <div class="progress-bar-container">
      <div 
        class="progress-bar-fill"
        :style="{ width: progress + '%' }"
      ></div>
    </div>
  </div>
</template>
```

**Styling:**
```css
.studio-progress {
  position: fixed;
  top: 80px;
  right: 20px;
  background: rgba(0, 0, 0, 0.9);
  border: 2px solid #FFD700;
  border-radius: 12px;
  padding: 16px;
  min-width: 200px;
  z-index: 100;
}

.progress-label {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFD700;
  margin-bottom: 8px;
  text-align: center;
}

.progress-bar-container {
  width: 100%;
  height: 8px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 4px;
  overflow: hidden;
}

.progress-bar-fill {
  height: 100%;
  background: linear-gradient(90deg, #FFD700, #FFA500);
  border-radius: 4px;
  transition: width 0.5s ease;
  box-shadow: 0 0 10px rgba(255, 215, 0, 0.8);
}
```

**Correctness Properties:**
- P8.1: Progress MUST be displayed as percentage (0-100)
- P8.2: Visited count MUST match actual visited zones
- P8.3: Progress bar MUST animate smoothly
- P8.4: Component MUST be visible but not intrusive

---

## Integration Points

### pages/studio.vue
```vue
<template>
  <div class="studio-page">
    <!-- Hero Section -->
    <StudioHero />
    
    <!-- Virtual Tour -->
    <VirtualStudioTour />
    
    <!-- Call to Action -->
    <StudioCTA />
  </div>
</template>
```

### Navigation Menu
Add "Studio Tour" link to main navigation in `components/TheHeader.vue`:
```vue
<NuxtLink to="/studio">Studio Tour</NuxtLink>
```

## Performance Optimizations

### Image Loading
- Use WebP format with JPEG fallback
- Implement lazy loading for zone images
- Preload next zone image for smooth transitions
- Use blur-up technique for progressive loading

### Data Loading
- Load zone data once on mount
- Cache zone data in component state
- Preload hotspot images on zone change

### Animations
- Use CSS transforms for smooth animations
- Leverage GPU acceleration
- Debounce resize events

## Accessibility

### Keyboard Navigation
- Arrow keys: Navigate between zones
- Enter: Open selected hotspot
- Escape: Close info panel
- Tab: Navigate through hotspots

### Screen Readers
- All images have descriptive alt text
- Hotspots have ARIA labels
- Modal has proper ARIA attributes
- Focus management on modal open/close

### Visual
- High contrast text on backgrounds
- Golden color (#FFD700) meets WCAG AA standards
- Focus indicators visible
- Touch targets minimum 44x44px

## Browser Compatibility

### Supported Browsers
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

### Fallbacks
- CSS Grid with Flexbox fallback
- Modern image formats with JPEG fallback
- Smooth scrolling with instant fallback

## Testing Strategy

### Unit Tests
- Zone navigation logic
- Progress calculation
- Hotspot positioning
- Modal open/close behavior

### Integration Tests
- Zone data loading
- Hotspot click handling
- Keyboard navigation
- Touch gestures on mobile

### Visual Regression Tests
- Zone transitions
- Hotspot appearance
- Modal styling
- Progress indicator

### Performance Tests
- Image loading time
- Animation frame rate
- Memory usage
- Mobile performance

## Deployment Process

### Content Preparation
1. Capture studio photos (12-18 images)
2. Optimize images (WebP + JPEG)
3. Create zone configuration JSON
4. Define hotspot positions
5. Write zone descriptions

### File Structure
```
public/
├── studio/
│   ├── workshop-main.jpg
│   ├── workshop-thumb.jpg
│   ├── inspiration-main.jpg
│   ├── inspiration-thumb.jpg
│   └── ...
└── data/
    └── studio-zones.json
```

### Deployment Steps
1. Upload studio images to `/public/studio/`
2. Upload zone configuration to `/public/data/`
3. Create `pages/studio.vue`
4. Create all components
5. Add navigation link
6. Test on VM
7. Deploy via base64 upload method

---

## Future Enhancements

### Phase 2
- Audio narration for each zone
- Background ambient studio sounds
- Video clips in hotspots
- Time-lapse of sculpture creation

### Phase 3
- 360° panoramic views
- Virtual reality support
- Live studio webcam
- Interactive workshops

---

**Status:** Design Complete  
**Ready for Implementation:** Yes  
**Created:** 2026-02-10  
**Last Updated:** 2026-02-10
