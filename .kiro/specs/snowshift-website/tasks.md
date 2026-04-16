# Implementation Plan

- [x] 1. Configure project foundation and theme system


  - Update nuxt.config.ts with Snowshift branding (title, meta tags, favicon)
  - Extend Tailwind config with custom color palette for light/dark modes
  - Create useTheme composable for theme switching with localStorage persistence
  - _Requirements: 8.1, 8.2, 8.3, 8.4, 8.5, 10.1_




- [ ] 2. Create core utility composables
  - [ ] 2.1 Implement useSmoothScroll composable
    - Write scrollToSection function with header offset calculation
    - Write scrollToTop function with smooth behavior

    - _Requirements: 1.5, 6.1_
  
  - [ ] 2.2 Implement useScrollAnimation composable
    - Write observeElement function using Intersection Observer API

    - Write animateOnScroll function with reduced motion support
    - _Requirements: 6.1, 6.2, 6.3, 6.4_
  
  - [x] 2.3 Implement useFormValidation composable

    - Write validate function for single field validation

    - Write validateAll function for complete form validation
    - Implement validation rules for email, phone, required fields
    - _Requirements: 3.3, 4.3_

- [ ] 3. Build AppHeader component
  - [x] 3.1 Create AppHeader.vue with sticky navigation structure

    - Implement sticky header with backdrop blur on scroll
    - Add logo with theme-based switching (Transperent_3.png / Transperent_4.png)
    - Create navigation links (Services, How It Works, Book Now, Contact)
    - Integrate theme toggle button with useTheme composable
    - _Requirements: 1.2, 8.2, 10.2_

  
  - [ ] 3.2 Implement mobile responsive navigation
    - Create hamburger menu button for mobile
    - Build slide-in mobile menu drawer
    - Add smooth scroll behavior to navigation links
    - _Requirements: 5.2, 5.3_

- [ ] 4. Build HeroSection component
  - Create HeroSection.vue with full viewport height layout

  - Add heading "Winter Tire Changes, At Your Doorstep"
  - Add subheading with value proposition and Cambridge location
  - Implement primary CTA button "Book Your Appointment" with scroll to booking
  - Implement secondary CTA button "Learn More" with scroll to services
  - Add background gradient with winter-themed colors
  - Implement fade-in animation on page load
  - _Requirements: 1.1, 1.3, 1.4, 1.5, 6.1_


- [ ] 5. Build ServiceCard component
  - Create ServiceCard.vue with props (title, description, icon, features, price)
  - Implement card layout with Nuxt UI Icon component
  - Add feature list with checkmark icons
  - Implement hover effect with lift and shadow increase
  - Add smooth transitions (250ms)

  - _Requirements: 2.2, 2.4, 6.5_

- [ ] 6. Build ServicesSection component
  - Create ServicesSection.vue with section heading "Our Services"
  - Define service data array with 4 services (Standard, Mounting, Storage, Emergency)
  - Implement responsive grid layout (1 col mobile, 2 tablet, 3 desktop)
  - Integrate ServiceCard components with service data

  - Add staggered entrance animations using useScrollAnimation
  - _Requirements: 2.1, 2.2, 2.3, 2.5, 6.2_


- [ ] 7. Build HowItWorksSection component
  - Create HowItWorksSection.vue with section heading "How It Works"
  - Implement three-step process layout (Book Online, We Come to You, Drive Safely)
  - Add number badges, icons, titles, and descriptions for each step

  - Create connecting line between steps (hidden on mobile)
  - Add fade-in animation using useScrollAnimation
  - Implement responsive layout (vertical mobile, horizontal desktop)
  - _Requirements: 6.1, 10.4_


- [ ] 8. Build BookingSection component
  - [ ] 8.1 Create BookingSection.vue with form structure
    - Implement section heading "Book Your Appointment"

    - Create form fields using Nuxt UI components (name, email, phone, address, service type, date, time, vehicle info, notes)
    - Set up reactive formData object
    - _Requirements: 3.1, 3.2_
  
  - [ ] 8.2 Implement form validation and submission
    - Integrate useFormValidation composable

    - Add inline error message display
    - Implement submit button with loading state
    - Create success message display after submission
    - Add form submission handler (console log for MVP)
    - _Requirements: 3.3, 3.4, 3.5_


- [ ] 9. Build ContactSection component
  - [ ] 9.1 Create ContactSection.vue with two-column layout
    - Implement section heading "Get In Touch"
    - Create contact form (name, email, phone, message)
    - Add contact information display (service area, response time, email)
    - Implement responsive layout (stacked mobile, two-column desktop)
    - _Requirements: 4.1, 4.2, 4.5_

  
  - [ ] 9.2 Implement contact form validation and submission
    - Integrate useFormValidation composable

    - Add form validation with inline errors
    - Create submission handler with success message
    - _Requirements: 4.3, 4.4_


- [ ] 10. Build AppFooter component
  - Create AppFooter.vue with three-column layout
  - Add logo and tagline in left column
  - Add quick links in center column (Services, Book Now, Contact)
  - Add business info in right column (service area, hours)
  - Add copyright notice

  - Implement responsive layout (stacked mobile, three-column desktop)

  - _Requirements: 10.3, 10.5_

- [ ] 11. Integrate all components in app.vue
  - Clear existing app.vue content
  - Import and arrange all section components in order
  - Add semantic HTML structure (header, main, sections, footer)

  - Ensure proper section IDs for smooth scrolling
  - _Requirements: 1.1, 10.5_

- [ ] 12. Implement SEO optimization
  - [ ] 12.1 Add meta tags and structured data
    - Use useHead composable to set title, meta description, and keywords
    - Add Open Graph tags for social media sharing
    - Add Twitter Card tags
    - Set canonical URL and favicon

    - _Requirements: 7.1, 7.5_

  
  - [ ] 12.2 Add JSON-LD structured data
    - Create structured data script for LocalBusiness schema
    - Include business name, address, service area, and service type
    - Add geo coordinates for Cambridge location

    - _Requirements: 7.2, 7.4_

- [ ] 13. Implement responsive design refinements
  - Review all components at mobile (320px), tablet (768px), and desktop (1280px) breakpoints


  - Ensure touch targets are 44x44px minimum on mobile
  - Verify font sizes meet minimum 16px on mobile
  - Test orientation changes and layout adaptation
  - _Requirements: 5.1, 5.3, 5.4, 5.5_

- [ ] 14. Add accessibility enhancements
  - Add skip-to-content link at top of page
  - Verify semantic HTML structure (header, nav, main, section, footer)
  - Add ARIA labels where needed (mobile menu, theme toggle)
  - Ensure logical heading hierarchy (h1 → h2 → h3)
  - Add alt text to all images including logos
  - Verify form labels are properly associated
  - Test keyboard navigation flow
  - _Requirements: 5.3, 8.5, 10.5_

- [ ] 15. Optimize performance
  - [ ] 15.1 Implement image optimization
    - Use Nuxt Image component for all logo images
    - Add lazy loading to below-fold images
    - Optimize logo file sizes
    - _Requirements: 9.2, 9.3_
  
  - [ ] 15.2 Configure build optimizations
    - Verify code splitting is enabled in nuxt.config.ts
    - Ensure SSR is enabled for SEO
    - Configure static generation preset
    - _Requirements: 9.1, 9.4, 9.5_

- [ ] 16. Run Lighthouse audits and fix issues
  - Run Lighthouse audit for Performance, SEO, Accessibility, Best Practices
  - Address any issues to achieve Performance ≥ 85, SEO ≥ 90
  - Verify First Contentful Paint < 1.8s
  - Check Cumulative Layout Shift < 0.1
  - _Requirements: 7.5, 9.1, 9.4_
