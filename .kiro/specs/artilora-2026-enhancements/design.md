# Artilora 2026 Website Enhancements - Design Document

## Architecture Overview

This feature set consists of four independent Vue components and one CSS modification, all integrated into the existing Nuxt 3 application. Each enhancement is designed to be modular and non-intrusive to existing functionality.

### Component Hierarchy
```
app.vue (root)
├── CustomCursor.vue (global, desktop-only)
├── SocialMediaBar.vue (global, desktop-only)
├── pages/
│   ├── index.vue
│   │   └── CountdownTimer.vue (home page only)
│   └── gallery.vue (grid pattern removed via CSS)
└── components/
    └── TheFooter.vue (social icons added)
```

## Component Designs

### 1. Gallery Grid Pattern Removal

**Implementation:** CSS modification to `pages/gallery.vue`

**Approach:**
- Remove grid pattern background from Gallery page container
- Maintain dark blue background (#001F3F)
- Keep grid patterns on all other pages via global `app.vue` styles

**CSS Changes:**
```css
/* Gallery page - no grid pattern */
.container {
  background-color: #001F3F;
  /* Grid pattern removed */
}

/* Global grid pattern (app.vue) - applies to all other pages */
.fixed.inset-0 {
  background-image: linear-gradient(to right, rgba(255,215,0,0.15) 1px, transparent 1px),
                    linear-gradient(to bottom, rgba(255,215,0,0.15) 1px, transparent 1px);
  background-size: 30px 30px;
}
```

**Correctness Properties:**
- P1.1: Gallery page MUST NOT display grid pattern over images
- P1.2: Gallery page background MUST be #001F3F
- P1.3: Other pages MUST retain grid pattern
- P1.4: Grid pattern MUST be 30px x 30px with rgba(255,215,0,0.15)

---

### 2. Countdown Timer Component

**File:** `components/CountdownTimer.vue`

**State Management:**
```javascript
const days = ref(0)
const hours = ref(0)
const minutes = ref(0)
const seconds = ref(0)
const launchDateFormatted = ref('')
let intervalId = null
```

**Core Logic:**
```javascript
const updateCountdown = () => {
  const now = new Date().getTime()
  const target = new Date(props.targetDate).getTime()
  const distance = target - now
  
  if (distance < 0) {
    // Countdown finished - all values set to 0
    days.value = 0
    hours.value = 0
    minutes.value = 0
    seconds.value = 0
    if (intervalId) clearInterval(intervalId)
    return
  }
  
  // Calculate time units
  days.value = Math.floor(distance / (1000 * 60 * 60 * 24))
  hours.value = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60))
  minutes.value = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60))
  seconds.value = Math.floor((distance % (1000 * 60)) / 1000)
}
```

**Lifecycle:**
- `onMounted`: Initialize countdown, start 1-second interval
- `onUnmounted`: Clear interval to prevent memory leaks

**Styling:**
- Container: Dark red gradient background with golden border
- Values: 3rem golden text with glow effects
- Animations: Pulsing glow (3s), number pulse (1s), separator blink (2s)
- Responsive: Scales down on mobile (2rem values, smaller padding)

**Correctness Properties:**
- P2.1: Countdown MUST update every second
- P2.2: Target date MUST be November 21, 2026 00:00:00
- P2.3: Time calculations MUST be accurate (days, hours, minutes, seconds)
- P2.4: Countdown MUST stop at zero when target date reached
- P2.5: Interval MUST be cleared on component unmount
- P2.6: Component MUST only run on client-side (process.client check)

---

### 3. Custom Cursor Component

**File:** `components/CustomCursor.vue`

**State Management:**
```javascript
const isDesktop = ref(false)
const cursorX = ref(0)
const cursorY = ref(0)
const cursorRingX = ref(0)
const cursorRingY = ref(0)
const isHovering = ref(false)
const particles = ref([])
let particleId = 0
let animationFrameId = null
```

**Desktop Detection:**
```javascript
isDesktop.value = window.innerWidth > 768 && !('ontouchstart' in window)
```

**Cursor Tracking:**
```javascript
const handleMouseMove = (e) => {
  // Immediate cursor dot update
  cursorX.value = e.clientX
  cursorY.value = e.clientY
  
  // Delayed ring update (50ms) for smooth trailing effect
  setTimeout(() => {
    cursorRingX.value = e.clientX
    cursorRingY.value = e.clientY
  }, 50)
  
  // Throttled particle creation (30% chance per move)
  if (Math.random() > 0.7) {
    createParticle(e.clientX, e.clientY)
  }
}
```

**Particle System:**
```javascript
const createParticle = (x, y) => {
  const particle = {
    id: particleId++,
    x: x + (Math.random() - 0.5) * 20, // Random offset
    y: y + (Math.random() - 0.5) * 20,
    opacity: 1,
    scale: Math.random() * 0.5 + 0.5, // 0.5 to 1.0
    delay: Math.random() * 0.3,
    createdAt: Date.now()
  }
  
  particles.value.push(particle)
  
  // Auto-remove after 1 second
  setTimeout(() => {
    particles.value = particles.value.filter(p => p.id !== particle.id)
  }, 1000)
}

const animateParticles = () => {
  const now = Date.now()
  
  particles.value.forEach(particle => {
    const age = now - particle.createdAt
    const progress = age / 1000 // 0 to 1
    
    // Fade out and scale down
    particle.opacity = Math.max(0, 1 - progress)
    particle.scale = Math.max(0, particle.scale * (1 - progress * 0.5))
    
    // Float upward
    particle.y -= 0.5
  })
  
  animationFrameId = requestAnimationFrame(animateParticles)
}
```

**Hover Detection:**
- Interactive elements: `a, button, input, textarea, select, [role="button"], .cursor-pointer`
- Ring expands from 32px to 48px on hover
- Border color intensifies on hover

**Styling:**
- Cursor dot: 8px, golden gradient with glow
- Cursor ring: 32px (48px on hover), golden border with glow
- Particles: 4px, golden gradient, float upward animation
- Z-index: 9999 (cursor), 10000 (dot), 9998 (particles)

**Correctness Properties:**
- P3.1: Custom cursor MUST only display on desktop (width > 768px, no touch)
- P3.2: Default cursor MUST be hidden when custom cursor active
- P3.3: Cursor dot MUST follow mouse immediately
- P3.4: Cursor ring MUST follow with 50ms delay
- P3.5: Ring MUST expand on hover over interactive elements
- P3.6: Particles MUST spawn randomly (30% chance per move)
- P3.7: Particles MUST float upward and fade out over 1 second
- P3.8: Animation frame MUST be cancelled on unmount
- P3.9: Default cursor MUST be restored on unmount

---

### 4. Social Media Bar Component

**File:** `components/SocialMediaBar.vue`

**State Management:**
```javascript
const isDesktop = ref(false)

onMounted(() => {
  if (process.client) {
    isDesktop.value = window.innerWidth > 768
    
    const handleResize = () => {
      isDesktop.value = window.innerWidth > 768
    }
    window.addEventListener('resize', handleResize)
    
    onUnmounted(() => {
      window.removeEventListener('resize', handleResize)
    })
  }
})
```

**Platform Configuration:**
```javascript
const platforms = [
  { name: 'Facebook', url: 'https://www.facebook.com/artilora', color: '#1877F2' },
  { name: 'Instagram', url: 'https://www.instagram.com/artilora', color: '#E1306C' },
  { name: 'Twitter', url: 'https://twitter.com/artilora', color: '#1DA1F2' },
  { name: 'LinkedIn', url: 'https://www.linkedin.com/company/artilora', color: '#0A66C2' },
  { name: 'YouTube', url: 'https://www.youtube.com/@artilora', color: '#FF0000' },
  { name: 'WhatsApp', url: 'https://wa.me/YOUR_PHONE_NUMBER', color: '#25D366' }
]
```

**Positioning:**
- Fixed position: `bottom: 20px; right: 20px`
- Z-index: 1000
- Vertical flex layout with 12px gap

**Styling:**
- Container: Dark red gradient background, golden border, floating animation
- Icons: 40px circles, platform-specific colors, hover scale 1.15
- Hover effects: Translate left 5px, platform-specific glow
- Animation: Floating (3s ease-in-out infinite)

**Footer Integration:**
- Social icons added to `TheFooter.vue`
- Same 6 platforms with consistent styling
- Visible on all devices (mobile and desktop)
- Animated hover effects (translateY -5px, scale 1.1)

**Correctness Properties:**
- P4.1: Social bar MUST only display on desktop (width > 768px)
- P4.2: Social bar MUST be fixed at bottom right (20px, 20px)
- P4.3: All 6 platforms MUST be present and functional
- P4.4: Links MUST open in new tab (target="_blank")
- P4.5: Links MUST have rel="noopener noreferrer" for security
- P4.6: Icons MUST have descriptive titles for accessibility
- P4.7: Hover effects MUST be smooth (0.3s transition)
- P4.8: Footer icons MUST be visible on all devices
- P4.9: Resize listener MUST be cleaned up on unmount

---

## Integration Points

### app.vue Integration
```vue
<template>
  <div class="bg-black min-h-screen relative">
    <!-- Custom Cursor with Golden Particles -->
    <CustomCursor />
    
    <!-- Floating Social Media Bar -->
    <SocialMediaBar />
    
    <!-- Global grid pattern overlay -->
    <div class="fixed inset-0 pointer-events-none" 
         style="background-image: linear-gradient(...); z-index: 1;">
    </div>
    
    <!-- Rest of app -->
    <NuxtLayout>
      <NuxtPage />
    </NuxtLayout>
  </div>
</template>
```

### index.vue Integration
```vue
<template>
  <div>
    <!-- Brand Essence Section -->
    <section>...</section>
    
    <!-- Countdown Timer -->
    <CountdownTimer target-date="2026-11-21T00:00:00" />
    
    <!-- Featured Preview Section -->
    <section>...</section>
  </div>
</template>
```

## Performance Considerations

### Custom Cursor Optimization
- Particle creation throttled (30% chance)
- Particles auto-removed after 1 second
- RequestAnimationFrame for smooth 60fps animation
- Cleanup on unmount prevents memory leaks

### Countdown Timer Optimization
- Single 1-second interval (not multiple)
- Interval cleared on unmount
- Client-side only (no SSR overhead)

### Social Media Bar Optimization
- Resize listener debounced via Vue reactivity
- SVG icons (lightweight, scalable)
- CSS animations (GPU-accelerated)

## Accessibility

### Countdown Timer
- Semantic HTML structure
- Readable time labels
- High contrast golden text on dark background

### Custom Cursor
- Does not interfere with screen readers
- Default cursor restored on unmount
- Desktop-only (doesn't affect mobile accessibility)

### Social Media Bar
- Descriptive link titles
- ARIA-friendly SVG icons
- Keyboard accessible (standard links)
- High contrast colors

## Browser Compatibility

### Supported Browsers
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

### Fallbacks
- Custom cursor: Falls back to default cursor on unsupported browsers
- CSS animations: Graceful degradation without animations
- Grid pattern: Falls back to solid background

## Testing Strategy

### Unit Tests
- Countdown timer calculations
- Particle creation and cleanup
- Desktop detection logic
- Resize handler behavior

### Integration Tests
- Component mounting and unmounting
- Event listener cleanup
- State updates on user interaction

### Visual Regression Tests
- Countdown timer appearance
- Custom cursor visibility
- Social media bar positioning
- Grid pattern removal on Gallery page

### Performance Tests
- Particle system frame rate
- Memory leak detection
- Animation smoothness

## Deployment Process

### File Upload Method
1. Base64 encode file content
2. Split into 4KB chunks
3. Upload via SSH (Posh-SSH module)
4. Decode on VM
5. Hot reload in Docker container

### Cache Management
- Users must clear browser cache (Ctrl+Shift+Delete)
- Or use Incognito mode (Ctrl+Shift+N)
- Build time tracking in localStorage

### Verification
1. Check container logs for hot reload
2. Verify file changes in container
3. Test in browser (Incognito mode)
4. Confirm functionality on VM IP (192.168.10.66:3009)

---

## Future Enhancements

### Virtual Studio Tour (Separate Spec)
- Awaiting user decision on tour type
- Will be documented in separate spec file
- Options: 360° panoramic, video tour, photo gallery, interactive map

### Potential Improvements
- Social media share counts
- Newsletter subscription backend
- Analytics tracking for social clicks
- Custom cursor themes
- Countdown timer milestone notifications

---

**Status:** Design Complete  
**Implementation:** Complete (Tasks 1-4)  
**Created:** 2026-02-10  
**Last Updated:** 2026-02-10
