# Virtual Studio Tour - Requirements

## Feature Overview
An immersive virtual tour experience that allows visitors to explore the Artilora studio where aerial root sculptures are conceived and created. This feature provides insight into the artist's creative environment, tools, processes, and the sacred space where sculptures are born.

## User Stories

### US-1: Studio Exploration
**As a** visitor interested in the creative process  
**I want** to explore the artist's studio virtually  
**So that** I can understand the environment and atmosphere where sculptures are created

**Acceptance Criteria:**
- Virtual tour accessible from main navigation menu
- Tour provides visual exploration of studio spaces
- Multiple viewing angles or perspectives available
- Smooth transitions between different areas
- High-quality images showcasing studio details
- Responsive design for all devices

### US-2: Studio Zones Discovery
**As a** visitor exploring the studio  
**I want** to navigate between different studio zones  
**So that** I can discover various areas like the workshop, inspiration corner, and display area

**Acceptance Criteria:**
- At least 4-6 distinct studio zones/areas
- Clear navigation between zones
- Each zone has descriptive information
- Visual indicators showing current location
- Smooth transitions between zones
- Zone names displayed prominently

**Suggested Zones:**
1. **The Workshop** - Where sculptures are physically created
2. **The Inspiration Corner** - Sketches, mood boards, reference materials
3. **The Material Storage** - Aerial roots, tools, supplies
4. **The Display Gallery** - Finished and in-progress works
5. **The Artist's Desk** - Design space, planning area
6. **The Sacred Space** - Meditation/reflection area for creative energy

### US-3: Interactive Hotspots
**As a** visitor viewing the studio  
**I want** to click on interesting objects or areas  
**So that** I can learn more about specific tools, materials, or processes

**Acceptance Criteria:**
- Clickable hotspots on key objects/areas
- Hotspots visually indicated (pulsing golden markers)
- Information panels appear on hotspot click
- Panels include images, descriptions, and context
- Easy to close information panels
- At least 8-12 hotspots throughout the tour

**Hotspot Examples:**
- Aerial root specimens
- Sculpting tools
- Work-in-progress sculptures
- Inspiration photographs
- Artist's sketchbooks
- Material preparation area
- Finishing station
- Display pedestals

### US-4: Atmospheric Experience
**As a** visitor taking the tour  
**I want** an immersive atmospheric experience  
**So that** I feel connected to the creative energy of the studio

**Acceptance Criteria:**
- Ambient background music or studio sounds (optional, user-controlled)
- Smooth animations and transitions
- Golden particle effects matching site theme
- Warm lighting in images
- Descriptive text using Bradley Hand ITC font
- Dark theme consistent with site design
- Loading states for images

### US-5: Tour Navigation Controls
**As a** visitor navigating the tour  
**I want** intuitive controls to move through the studio  
**So that** I can explore at my own pace

**Acceptance Criteria:**
- Clear navigation arrows or buttons
- Zone selector/map for quick navigation
- Progress indicator showing tour completion
- "Return to Gallery" or "Exit Tour" button
- Keyboard navigation support (arrow keys)
- Touch/swipe support on mobile devices
- Auto-play option with manual override

## Technical Requirements

### TR-1: Performance
- Images optimized for web (WebP format with JPEG fallback)
- Lazy loading for images not currently visible
- Smooth transitions without lag (60fps target)
- Total page load under 3 seconds
- Progressive image loading (blur-up technique)

### TR-2: Responsive Design
- Mobile-first approach
- Breakpoints: 480px (mobile), 768px (tablet), 1024px (desktop)
- Touch-friendly hotspots (minimum 44x44px)
- Swipe gestures on mobile
- Vertical scrolling fallback for mobile

### TR-3: Accessibility
- All images have descriptive alt text
- Keyboard navigation fully supported
- ARIA labels for interactive elements
- High contrast text on backgrounds
- Screen reader friendly descriptions
- Focus indicators visible

### TR-4: Browser Compatibility
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- Mobile browsers (iOS Safari, Chrome Mobile)

### TR-5: Content Management
- Images stored in `/public/studio/` directory
- Hotspot data in JSON configuration file
- Easy to add/update zones and hotspots
- Image naming convention: `zone-name-view-number.jpg`

## Design Specifications

### Visual Style
- **Background:** Pure black (#000000) with golden grid pattern
- **Accent Color:** Golden (#FFD700)
- **Text Color:** White (#FFFFFF) with golden highlights
- **Font:** Bradley Hand ITC throughout
- **Borders:** Golden borders on panels and frames
- **Shadows:** Soft golden glow effects

### Layout
- **Desktop:** Full-screen immersive view with side navigation
- **Mobile:** Vertical scrolling with zone cards
- **Hotspots:** Pulsing golden circles (24px desktop, 44px mobile)
- **Info Panels:** Modal overlays with dark background and golden border

### Animations
- **Zone Transitions:** Fade and slide (0.5s ease-in-out)
- **Hotspot Pulse:** Continuous glow animation (2s infinite)
- **Panel Appearance:** Scale up from center (0.3s ease-out)
- **Image Loading:** Blur-up progressive loading

### Navigation Elements
- **Zone Selector:** Horizontal bar at bottom with zone thumbnails
- **Arrow Buttons:** Large golden arrows on sides (desktop)
- **Progress Bar:** Golden bar showing tour progress
- **Exit Button:** Top-right corner with golden X

## Implementation Approach

### Recommended: Photo Gallery Tour with Interactive Hotspots

**Rationale:**
1. **Feasible:** Can be implemented with existing images and Vue components
2. **Flexible:** Easy to add/update content without video production
3. **Interactive:** Hotspots provide engagement and information
4. **Performant:** Static images load faster than 360° or video
5. **Maintainable:** Simple to update zones and hotspots

**Structure:**
```
VirtualStudioTour.vue (main component)
├── StudioZoneViewer.vue (displays current zone)
│   ├── StudioImage.vue (image with hotspots)
│   └── StudioHotspot.vue (interactive markers)
├── StudioNavigation.vue (zone selector and arrows)
├── StudioInfoPanel.vue (hotspot information modal)
└── StudioProgress.vue (progress indicator)
```

### Alternative Approaches (Future Enhancements)

**360° Panoramic Tour:**
- Requires 360° camera equipment
- More complex implementation (Three.js or similar)
- Higher bandwidth requirements
- More immersive but harder to maintain

**Video Tour:**
- Requires professional video production
- Less interactive than photo tour
- Larger file sizes
- Harder to update content

**Interactive Map:**
- Requires floor plan or map creation
- Less immersive than photo tour
- Good as supplementary feature
- Could be added to photo tour

## Content Requirements

### Photography Needed
- **6 Studio Zones** × 2-3 angles each = 12-18 high-quality photos
- **Resolution:** Minimum 1920x1080px
- **Format:** JPEG or PNG (will be converted to WebP)
- **Lighting:** Natural or warm artificial lighting
- **Composition:** Wide shots showing entire zone, detail shots for hotspots

### Hotspot Content
For each hotspot (8-12 total):
- **Title:** Short descriptive name
- **Description:** 2-3 sentences explaining significance
- **Image:** Close-up photo (optional)
- **Category:** Tool, Material, Process, Inspiration, etc.

### Zone Descriptions
For each zone:
- **Name:** Descriptive title (e.g., "The Workshop")
- **Description:** 1-2 paragraphs about the zone's purpose
- **Atmosphere:** Brief description of the feeling/energy
- **Key Features:** 3-5 bullet points highlighting important elements

## Dependencies
- Vue 3 Composition API
- Nuxt 3 framework
- Tailwind CSS for styling
- Optional: Swiper.js for smooth transitions
- Optional: Howler.js for ambient audio

## Constraints
- Must work within existing Docker container setup
- Must maintain site performance (no heavy libraries)
- Must follow existing design language
- Must be deployable via base64 upload method
- Must work with browser cache clearing requirement

## Success Metrics
- Tour completion rate > 60%
- Average time on tour > 2 minutes
- Hotspot interaction rate > 40%
- Mobile usability score > 80%
- Page load time < 3 seconds
- Zero accessibility violations

## Out of Scope (Phase 1)
- 360° panoramic views
- Video content
- Audio narration (ambient music only)
- Virtual reality (VR) support
- Augmented reality (AR) features
- Live studio webcam
- Booking studio visits
- E-commerce integration

## Future Enhancements (Phase 2+)
- Audio narration for each zone
- Behind-the-scenes video clips
- Time-lapse of sculpture creation
- Artist commentary hotspots
- Virtual workshops or tutorials
- 360° panoramic upgrade
- VR headset support
- Social sharing of favorite zones

---

**Status:** Requirements Defined  
**Priority:** Medium  
**Estimated Effort:** 2-3 days development + content creation  
**Created:** 2026-02-10  
**Last Updated:** 2026-02-10
