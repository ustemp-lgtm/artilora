export default defineNuxtPlugin(() => {
  const config = useRuntimeConfig()
  const router = useRouter()
  
  const gaId = config.public.googleAnalyticsId
  
  // Only load if we have a valid GA ID (not the placeholder)
  if (!gaId || gaId === 'G-XXXXXXXXXX') {
    console.log('Google Analytics: No valid Measurement ID configured')
    return
  }
  
  // Load Google Analytics script
  const script = document.createElement('script')
  script.async = true
  script.src = `https://www.googletagmanager.com/gtag/js?id=${gaId}`
  document.head.appendChild(script)
  
  // Initialize gtag
  window.dataLayer = window.dataLayer || []
  function gtag(...args: any[]) {
    window.dataLayer.push(args)
  }
  
  gtag('js', new Date())
  gtag('config', gaId, {
    send_page_view: true,
    anonymize_ip: true // GDPR compliance
  })
  
  // Track page views on route change
  router.afterEach((to) => {
    gtag('config', gaId, {
      page_path: to.fullPath,
      page_title: to.name || document.title
    })
  })
  
  // Make gtag available globally
  return {
    provide: {
      gtag
    }
  }
})
