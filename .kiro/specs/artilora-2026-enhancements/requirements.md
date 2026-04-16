# Artilora 2026 Website Enhancements - Requirements

## Feature Overview
A comprehensive set of visual and interactive enhancements for the Artilora sculpture gallery website to improve user engagement, social media integration, and create a more immersive experience for visitors exploring aerial root sculptures.

## User Stories

### US-1: Gallery Visual Clarity
**As a** visitor viewing the gallery  
**I want** sculptures and photographs to be displayed without visual interference  
**So that** I can appreciate the artwork in its full clarity without distracting patterns

**Acceptance Criteria:**
- Grid pattern removed from Gallery page images
- Dark blue background (#001F3F) maintained on Gallery page
- Grid patterns remain on other pages (Home, About, Contact)
- Sculptures and photographs display clearly without overlay patterns

### US-2: Launch Countdown Timer
**As a** visitor to the website  
**I want** to see a countdown to the official 2026 launch  
**So that** I can track when the full collection will be available

**Acceptance Criteria:**
- Countdown timer displays days, hours, minutes, and seconds
- Target date: November 21, 2026 at midnight
- Timer updates in real-time every second
- Positioned on Home page after Brand Essence section
- Golden styling with dark red gradient background matching site theme
- Animated pulsing effects for visual interest
- Responsive design for mobile and desktop
- Bradley Hand ITC font used throughout

### US-3: Custom Cursor with Particle Effects
**As a** desktop visitor  
**I want** an enhanced cursor with golden particle trail  
**So that** I have a more magical and immersive browsing experience

**Acceptance Criteria:**
- Golden glowing cursor dot (8px) replaces default cursor
- Trailing ring (32px) follows cursor with smooth delay
- Ring expands to 48px when hovering over interactive elements
- Golden particles spawn and float upward, fading away
- Desktop only (hidden on mobile/tablets)
- Site-wide effect across all pages
- Smooth animations without performance impact

### US-4: Social Media Integration
**As a** visitor interested in following Artilora  
**I want** easy access to social media platforms  
**So that** I can stay connected and share content

**Acceptance Criteria:**
- Floating vertical social media bar on desktop
- Fixed position: bottom right corner (20px from bottom, 20px from right)
- Six platforms: Facebook, Instagram, Twitter, LinkedIn, YouTube, WhatsApp
- Platform-specific colors and hover effects
- Gentle floating animation
- Desktop only (hidden on mobile/tablets)
- Social icons also in footer for all devices
- Animated hover effects on footer icons

### US-5: Virtual Studio Tour (Planned)
**As a** visitor curious about the creative process  
**I want** to explore the artist's studio virtually  
**So that** I can understand the environment where sculptures are created

**Acceptance Criteria:**
- TBD - Awaiting user decision on tour type:
  - Option A: 360° Panoramic Tour
  - Option B: Video Tour
  - Option C: Photo Gallery Tour
  - Option D: Interactive Map

## Technical Requirements

### TR-1: Performance
- Custom cursor must not impact page performance
- Particle effects throttled to maintain 60fps
- Social media bar loads asynchronously
- Countdown timer uses efficient interval management

### TR-2: Responsive Design
- All enhancements must be mobile-responsive
- Desktop-only features properly hidden on mobile/tablets
- Touch-friendly interactions on mobile devices
- Breakpoints: 768px (tablet), 480px (mobile)

### TR-3: Browser Compatibility
- Support for modern browsers (Chrome, Firefox, Safari, Edge)
- Graceful degradation for older browsers
- CSS animations with fallbacks

### TR-4: Accessibility
- Countdown timer has proper ARIA labels
- Social media links have descriptive titles
- Custom cursor doesn't interfere with screen readers
- Keyboard navigation maintained for all interactive elements

### TR-5: Deployment
- Docker container hot reload working correctly
- Changes deployed to VM at 192.168.10.66:3009
- Base64 encoding for file uploads via SSH
- Browser cache management instructions for users

## Design Specifications

### Colors
- Pure Black: #000000
- Golden: #FFD700
- Dark Red: #8B0000
- Dark Blue (Gallery): #001F3F

### Typography
- Font Family: Bradley Hand ITC (all text)
- Countdown Title: 1.75rem, bold
- Countdown Values: 3rem, extra bold
- Social Icons: 20px SVG

### Grid Pattern
- Size: 30px x 30px
- Color: rgba(255,215,0,0.15)
- Applied globally except Gallery page images

### Animations
- Countdown: Pulsing glow effect (3s infinite)
- Cursor: Smooth follow with 50ms delay
- Social Bar: Floating animation (3s ease-in-out infinite)
- Particles: Float upward 1s duration

## Dependencies
- Nuxt 3 framework
- Vue 3 composition API
- Tailwind CSS (limited z-index classes)
- Docker container environment
- SSH access via Posh-SSH module

## Constraints
- VM Environment: 192.168.10.66 (frank/VMware1!)
- Container: website-nuxt-1
- Working Directory: /home/frank/website (VM), /usr/src/app/ (container)
- File Upload: Base64 encoding in 4KB chunks
- Browser Cache: Users must clear cache or use Incognito mode

## Success Metrics
- Gallery images display without grid interference
- Countdown timer accurately counts down to November 21, 2026
- Custom cursor visible and functional on desktop
- Social media bar accessible and functional
- All enhancements responsive across devices
- No performance degradation

## Out of Scope
- Backend social media API integration
- Newsletter subscription functionality
- Virtual Studio Tour implementation (separate spec)
- Mobile-specific cursor effects
- Social media analytics tracking

---

**Status:** Completed (Tasks 1-4), Planned (Task 5)  
**Created:** 2026-02-10  
**Last Updated:** 2026-02-10
