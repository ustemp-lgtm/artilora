# Design Document

## Overview

The Snowshift website will be built as a single-page application (SPA) using Nuxt 4 with server-side rendering (SSR) enabled for optimal SEO performance. The design leverages Nuxt UI components for consistent styling, Tailwind CSS for custom design elements, and Vue 3's Composition API for reactive state management. The architecture prioritizes performance, accessibility, and a smooth user experience with scroll-triggered animations and theme switching capabilities.

The website will feature a modern, minimalistic design with a winter-inspired color palette that conveys professionalism, trust, and the convenience of at-home service. All interactions will be smooth and intentional, creating a premium feel that matches the quality of service offered.

## Architecture

### Technology Stack

- **Framework**: Nuxt 4 with SSR enabled for SEO optimization
- **UI Library**: Nuxt UI (built on Headless UI and Tailwind CSS)
- **Styling**: Tailwind CSS with custom theme extensions
- **Animation**: CSS transitions, Vue transitions, and Intersection Observer API for scroll animations
- **State Management**: Vue 3 Composition API with composables
- **Image Optimization**: Nuxt Image module for automatic optimization
- **SEO**: Nuxt's built-in SEO features with useHead composable and structured data

### Page Structure

The website will be a single-page application with the following sections:

1. **Navigation Header** (sticky)
2. **Hero Section** (full viewport height)
3. **Services Section** (grid layout)
4. **How It Works Section** (step-by-step process)
5. **Booking Section** (form interface)
6. **Contact Section** (contact form and info)
7. **Footer** (business info and links)

### Routing Strategy

Since this is a single-page design, we'll use anchor-based navigation with smooth scrolling. The main app.vue file will contain all sections, and navigation links will scroll to section IDs.

## Components and Interfaces

### Core Components

#### 1. AppHeader Component
**Purpose**: Sticky navigation header with logo, navigation links, and theme toggle

**Props**: None (uses global state)

**Features**:
- Sticky positioning with backdrop blur effect on scroll
- Logo that switches between Transperent_3.png (light mode) and Transperent_4.png (dark mode)
- Navigation links: Services, How It Works, Book Now, Contact
- Theme toggle button (sun/moon icon)
- Mobile hamburger menu for responsive design
- Smooth scroll behavior when clicking navigation links

**State**:
- `isScrolled`: Boolean to track scroll position for header styling
- `isMobileMenuOpen`: Boolean for mobile menu state

#### 2. HeroSection Component
**Purpose**: Eye-catching landing section with value proposition and CTA

**Features**:
- Full viewport height with centered content
- Large heading: "Winter Tire Changes, At Your Doorstep"
- Subheading: "Professional at-home tire service in Cambridge, Toronto. Save time, stay warm, and let us come to you."
- Primary CTA button: "Book Your Appointment" (scrolls to booking section)
- Secondary CTA button: "Learn More" (scrolls to services)
- Background gradient with winter-themed colors
- Fade-in animation on page load
- Decorative elements (subtle snowflake patterns or tire icons)

#### 3. ServicesSection Component
**Purpose**: Display available tire change services in an organized grid

**Features**:
- Section heading: "Our Services"
- Grid of ServiceCard components (3 columns on desktop, 2 on tablet, 1 on mobile)
- Staggered entrance animations as cards enter viewport
- Services to display:
  - **Standard Tire Change**: Swap winter/summer tires (already mounted on rims)
  - **Tire Mounting & Balancing**: Full service including mounting new tires on rims
  - **Tire Storage Pickup**: Convenient pickup of off-season tires for storage
  - **Emergency Service**: Same-day service for urgent needs (premium pricing)

#### 4. ServiceCard Component
**Purpose**: Reusable card component for displaying individual services

**Props**:
- `title`: String - Service name
- `description`: String - Service details
- `icon`: String - Icon name from Nuxt UI icons
- `features`: Array<String> - List of included features
- `price`: String - Starting price (e.g., "From $80")

**Features**:
- Card with subtle shadow and border
- Icon at the top (using Nuxt UI Icon component)
- Title and description
- Feature list with checkmarks
- Price display
- Hover effect: slight lift and shadow increase
- Smooth transitions (250ms)

#### 5. HowItWorksSection Component
**Purpose**: Explain the booking and service process in simple steps

**Features**:
- Section heading: "How It Works"
- Three-step process displayed horizontally (stacked on mobile):
  1. **Book Online**: "Choose your date and time through our simple booking form"
  2. **We Come to You**: "Our technician arrives at your location with all equipment"
  3. **Drive Safely**: "Your tires are changed professionally, and you're ready for winter"
- Each step has a number badge, icon, title, and description
- Connecting line between steps (hidden on mobile)
- Fade-in animation as section enters viewport

#### 6. BookingSection Component
**Purpose**: Allow customers to schedule tire change appointments

**Features**:
- Section heading: "Book Your Appointment"
- Form with the following fields:
  - Full Name (text input, required)
  - Email (email input, required, validated)
  - Phone Number (tel input, required, formatted)
  - Service Address (text input, required)
  - Service Type (select dropdown, required)
  - Preferred Date (date picker, required, minimum: tomorrow)
  - Preferred Time (select dropdown, required)
  - Vehicle Information (text input, required - make, model, year)
  - Additional Notes (textarea, optional)
- Form validation with inline error messages
- Submit button: "Request Appointment"
- Loading state during submission
- Success message after submission
- Form uses Nuxt UI form components for consistency

**State**:
- `formData`: Object containing all form fields
- `errors`: Object containing validation errors
- `isSubmitting`: Boolean for loading state
- `isSubmitted`: Boolean for success state

**Validation Rules**:
- Email must be valid format
- Phone must be 10 digits
- Date must be at least 24 hours in advance
- All required fields must be filled

#### 7. ContactSection Component
**Purpose**: Provide contact form and business information

**Features**:
- Section heading: "Get In Touch"
- Two-column layout (stacked on mobile):
  - Left: Contact form
  - Right: Contact information
- Contact form fields:
  - Name (text input, required)
  - Email (email input, required)
  - Phone (tel input, optional)
  - Message (textarea, required)
- Contact information display:
  - Service area: "Cambridge & Greater Toronto Area"
  - Response time: "We respond within 24 hours"
  - Email: contact@snowshift.space
  - Phone: (to be added)
- Form validation and submission handling similar to BookingSection

#### 8. AppFooter Component
**Purpose**: Display business information and navigation links

**Features**:
- Three-column layout (stacked on mobile):
  - Left: Logo and tagline
  - Center: Quick links (Services, Book Now, Contact)
  - Right: Business info (service area, hours)
- Copyright notice
- Social media links (if applicable)
- Background color matches theme
- Subtle top border

### Composables

#### useScrollAnimation
**Purpose**: Provide scroll-triggered animation functionality

**Returns**:
- `observeElement(element, callback)`: Function to observe element intersection
- `animateOnScroll(element, animationClass)`: Function to add animation class when element enters viewport

**Implementation**:
- Uses Intersection Observer API
- Respects `prefers-reduced-motion` media query
- Configurable threshold and root margin

#### useTheme
**Purpose**: Manage light/dark theme switching

**Returns**:
- `theme`: Ref<'light' | 'dark'> - Current theme
- `toggleTheme()`: Function to switch themes
- `logoSrc`: Computed - Returns appropriate logo path based on theme

**Implementation**:
- Reads initial theme from localStorage or system preference
- Persists theme choice to localStorage
- Updates document class for Tailwind dark mode
- Provides reactive logo source based on theme

#### useFormValidation
**Purpose**: Reusable form validation logic

**Parameters**:
- `rules`: Object - Validation rules for each field

**Returns**:
- `validate(field, value)`: Function to validate a single field
- `validateAll(formData)`: Function to validate entire form
- `errors`: Ref<Object> - Validation error messages

**Implementation**:
- Common validation patterns (email, phone, required, min length)
- Returns user-friendly error messages
- Supports custom validation rules

#### useSmoothScroll
**Purpose**: Handle smooth scrolling to page sections

**Returns**:
- `scrollToSection(sectionId)`: Function to scroll to a section
- `scrollToTop()`: Function to scroll to page top

**Implementation**:
- Uses native smooth scroll behavior
- Accounts for sticky header offset
- Fallback for browsers without smooth scroll support

## Data Models

### BookingFormData
```typescript
interface BookingFormData {
  fullName: string
  email: string
  phone: string
  address: string
  serviceType: 'standard' | 'mounting' | 'storage' | 'emergency'
  preferredDate: string // ISO date format
  preferredTime: string // e.g., "morning", "afternoon", "evening"
  vehicleInfo: string
  notes?: string
}
```

### ContactFormData
```typescript
interface ContactFormData {
  name: string
  email: string
  phone?: string
  message: string
}
```

### ServiceData
```typescript
interface ServiceData {
  id: string
  title: string
  description: string
  icon: string
  features: string[]
  price: string
}
```

## Design System

### Color Palette

**Light Mode**:
- Primary: `#2563EB` (Blue - trust and professionalism)
- Secondary: `#0EA5E9` (Sky Blue - winter theme)
- Accent: `#F59E0B` (Amber - warmth and action)
- Background: `#FFFFFF`
- Surface: `#F9FAFB`
- Text Primary: `#111827`
- Text Secondary: `#6B7280`
- Border: `#E5E7EB`

**Dark Mode**:
- Primary: `#3B82F6` (Lighter blue for contrast)
- Secondary: `#38BDF8` (Lighter sky blue)
- Accent: `#FBBF24` (Lighter amber)
- Background: `#0F172A` (Slate 900)
- Surface: `#1E293B` (Slate 800)
- Text Primary: `#F1F5F9`
- Text Secondary: `#94A3B8`
- Border: `#334155`

### Typography

- **Headings**: System font stack with fallback to sans-serif
  - H1: 3.5rem (56px) / 4rem (64px) on desktop, 2.5rem (40px) on mobile
  - H2: 2.5rem (40px) / 3rem (48px) on desktop, 2rem (32px) on mobile
  - H3: 1.875rem (30px) / 2.25rem (36px) on desktop, 1.5rem (24px) on mobile
- **Body**: 1rem (16px) base, 1.125rem (18px) for lead text
- **Small**: 0.875rem (14px)
- **Line Height**: 1.5 for body, 1.2 for headings
- **Font Weight**: 400 (normal), 500 (medium), 600 (semibold), 700 (bold)

### Spacing Scale

Following Tailwind's default spacing scale (4px base unit):
- xs: 0.5rem (8px)
- sm: 1rem (16px)
- md: 1.5rem (24px)
- lg: 2rem (32px)
- xl: 3rem (48px)
- 2xl: 4rem (64px)
- 3xl: 6rem (96px)

### Border Radius

- sm: 0.375rem (6px) - buttons, inputs
- md: 0.5rem (8px) - cards
- lg: 0.75rem (12px) - large cards
- full: 9999px - circular elements

### Shadows

- sm: `0 1px 2px 0 rgb(0 0 0 / 0.05)`
- md: `0 4px 6px -1px rgb(0 0 0 / 0.1)`
- lg: `0 10px 15px -3px rgb(0 0 0 / 0.1)`
- xl: `0 20px 25px -5px rgb(0 0 0 / 0.1)`

### Animation Timings

- Fast: 150ms - micro-interactions
- Normal: 250ms - hover effects, transitions
- Slow: 400ms - entrance animations
- Slower: 600ms - complex animations
- Easing: `cubic-bezier(0.4, 0, 0.2, 1)` - smooth ease-in-out

## Error Handling

### Form Validation Errors

- Display inline error messages below each field
- Use red color (`#EF4444`) for error text and borders
- Show error icon next to error message
- Clear errors when user starts typing
- Prevent form submission if validation fails

### Form Submission Errors

- Display error notification at top of form
- Provide clear error message (e.g., "Unable to submit. Please try again.")
- Offer retry option
- Log errors to console for debugging
- Maintain form data so user doesn't lose input

### Network Errors

- Show user-friendly message: "Connection issue. Please check your internet and try again."
- Implement retry logic with exponential backoff
- Provide offline indicator if applicable

### Image Loading Errors

- Use Nuxt Image's built-in error handling
- Provide fallback placeholder for failed logo loads
- Lazy load images with loading skeleton

## Testing Strategy

### Component Testing

- Test each component in isolation
- Verify props are correctly received and rendered
- Test user interactions (clicks, form inputs)
- Verify emitted events
- Test responsive behavior at different breakpoints

**Key Test Cases**:
- ServiceCard renders with all props correctly
- BookingSection validates form inputs
- AppHeader toggles mobile menu
- Theme toggle switches between light and dark mode

### Integration Testing

- Test navigation flow between sections
- Verify smooth scrolling works correctly
- Test form submission end-to-end
- Verify theme persistence across page reloads
- Test animation triggers on scroll

**Key Test Cases**:
- Clicking "Book Now" scrolls to booking section
- Submitting booking form shows success message
- Theme preference persists in localStorage
- Animations trigger when sections enter viewport

### Accessibility Testing

- Verify keyboard navigation works for all interactive elements
- Test with screen reader (NVDA/JAWS)
- Verify color contrast ratios meet WCAG AA standards
- Test with reduced motion preference enabled
- Verify all images have alt text
- Test form labels and error announcements

**Key Test Cases**:
- Tab navigation follows logical order
- Focus indicators are visible
- Form errors are announced to screen readers
- Theme toggle is keyboard accessible
- All interactive elements have 44x44px touch targets on mobile

### Performance Testing

- Run Lighthouse audits for Performance, SEO, Accessibility, Best Practices
- Test on throttled 4G connection
- Verify First Contentful Paint < 1.8s
- Check Total Blocking Time
- Verify Cumulative Layout Shift < 0.1
- Test image optimization and lazy loading

**Key Metrics**:
- Lighthouse Performance Score: ≥ 85
- Lighthouse SEO Score: ≥ 90
- First Contentful Paint: < 1.8s
- Time to Interactive: < 3.5s
- Total Bundle Size: < 200KB (gzipped)

### SEO Testing

- Verify meta tags are correctly set
- Test structured data with Google's Rich Results Test
- Verify sitemap.xml is generated
- Check robots.txt configuration
- Test social media preview cards (Open Graph)
- Verify canonical URLs

**Key Test Cases**:
- Title tag includes "Snowshift" and service keywords
- Meta description is compelling and includes location
- Structured data validates without errors
- Open Graph tags render correctly on social platforms

## SEO Implementation Details

### Meta Tags (using useHead)

```typescript
useHead({
  title: 'Snowshift - At-Home Winter Tire Change Service in Cambridge, Toronto',
  meta: [
    {
      name: 'description',
      content: 'Professional at-home winter tire change service in Cambridge and Greater Toronto Area. Book online and we come to you. Convenient, efficient, and safe tire service.'
    },
    { name: 'keywords', content: 'winter tires, tire change, Cambridge, Toronto, at-home service, mobile tire service' },
    // Open Graph
    { property: 'og:title', content: 'Snowshift - At-Home Winter Tire Change Service' },
    { property: 'og:description', content: 'Professional at-home winter tire change service in Cambridge, Toronto' },
    { property: 'og:type', content: 'website' },
    { property: 'og:url', content: 'https://snowshift.space' },
    { property: 'og:image', content: 'https://snowshift.space/logo/Transperent_3.png' },
    // Twitter Card
    { name: 'twitter:card', content: 'summary_large_image' },
    { name: 'twitter:title', content: 'Snowshift - At-Home Winter Tire Change Service' },
    { name: 'twitter:description', content: 'Professional at-home winter tire change service in Cambridge, Toronto' },
  ],
  link: [
    { rel: 'canonical', href: 'https://snowshift.space' },
    { rel: 'icon', type: 'image/png', href: '/logo/Transperent_3.png' }
  ]
})
```

### Structured Data (JSON-LD)

```json
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Snowshift",
  "description": "At-home winter tire change service",
  "url": "https://snowshift.space",
  "telephone": "+1-XXX-XXX-XXXX",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "addressLocality": "Cambridge",
    "addressRegion": "ON",
    "addressCountry": "CA"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": "43.3616",
    "longitude": "-80.3144"
  },
  "areaServed": {
    "@type": "City",
    "name": "Cambridge"
  },
  "serviceType": "Winter Tire Change Service",
  "hasOfferCatalog": {
    "@type": "OfferCatalog",
    "name": "Tire Change Services",
    "itemListElement": [
      {
        "@type": "Offer",
        "itemOffered": {
          "@type": "Service",
          "name": "Standard Tire Change"
        }
      }
    ]
  }
}
```

## Responsive Breakpoints

Following Tailwind's default breakpoints:
- **Mobile**: < 640px (sm)
- **Tablet**: 640px - 1024px (sm to lg)
- **Desktop**: ≥ 1024px (lg)
- **Large Desktop**: ≥ 1280px (xl)

### Responsive Behavior

**Navigation**:
- Mobile: Hamburger menu with slide-in drawer
- Desktop: Horizontal navigation links

**Hero Section**:
- Mobile: Stacked layout, smaller heading
- Desktop: Centered content with larger heading

**Services Grid**:
- Mobile: 1 column
- Tablet: 2 columns
- Desktop: 3 columns

**How It Works**:
- Mobile: Vertical stack
- Desktop: Horizontal row with connecting lines

**Booking/Contact Forms**:
- Mobile: Full-width single column
- Desktop: Two-column layout (form + info)

## Implementation Notes

### Logo Management

- Store logos in `/public/logo/` directory
- Use Nuxt Image component for optimization
- Logo mapping:
  - Light mode: `/logo/Transperent_3.png` (black logo with name)
  - Dark mode: `/logo/Transperent_4.png` (white logo with name)
- Provide alt text: "Snowshift - At-Home Winter Tire Service"

### Animation Implementation

Use Intersection Observer for scroll animations:

```typescript
const observer = new IntersectionObserver(
  (entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('animate-fade-in')
        observer.unobserve(entry.target)
      }
    })
  },
  { threshold: 0.1, rootMargin: '0px 0px -100px 0px' }
)
```

Respect reduced motion preference:

```typescript
const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches
if (!prefersReducedMotion) {
  // Apply animations
}
```

### Form Submission

For MVP, forms will:
1. Validate client-side
2. Show success message
3. Log data to console (for development)
4. Future: Integrate with backend API or email service

### Performance Optimizations

- Use Nuxt Image for automatic image optimization
- Implement lazy loading for below-fold images
- Code split components with dynamic imports
- Minimize CSS with PurgeCSS (automatic with Tailwind)
- Enable Nuxt's built-in compression
- Use font-display: swap for web fonts
- Preload critical assets

### Accessibility Considerations

- Use semantic HTML elements (header, nav, main, section, footer)
- Provide skip-to-content link
- Ensure focus indicators are visible
- Use ARIA labels where needed
- Maintain logical heading hierarchy (h1 → h2 → h3)
- Provide alt text for all images
- Ensure form labels are properly associated
- Test with keyboard navigation
- Support screen readers with proper ARIA attributes

## Future Enhancements

While not part of the initial implementation, these features could be added later:

- **Online Payment**: Integrate Stripe for booking deposits
- **Real-time Availability**: Calendar integration showing available time slots
- **Customer Portal**: Account creation for booking history
- **Reviews/Testimonials**: Display customer feedback
- **Blog**: SEO-focused content about tire maintenance
- **Multi-language Support**: French translation for Quebec customers
- **Live Chat**: Real-time customer support
- **Booking Confirmation Emails**: Automated email notifications
- **SMS Reminders**: Text message appointment reminders
- **Analytics Dashboard**: Track bookings and website metrics
