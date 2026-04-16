// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2024-04-03',
  devtools: { enabled: false },
  modules: ['@nuxtjs/tailwindcss'],
  css: ['~/assets/css/mobile.css', '~/assets/css/print.css'],
  ssr: true, // Switched to true for full SSG pre-rendering

  nitro: {
    preset: 'github-pages' // Auto-generates .nojekyll and optimizes for GitHub Pages
  },

  // Runtime configuration for Google Analytics
  runtimeConfig: {
    public: {
      googleAnalyticsId: process.env.NUXT_PUBLIC_GOOGLE_ANALYTICS_ID || 'G-XXXXXXXXXX'
    }
  },

  vite: {
    server: {
      watch: {
        usePolling: true,
        interval: 1000,
      },
    },
    build: {
      rollupOptions: {
        output: {
          // Add timestamp to force cache busting
          entryFileNames: `assets/[name]-[hash]-${Date.now()}.js`,
          chunkFileNames: `assets/[name]-[hash]-${Date.now()}.js`,
          assetFileNames: `assets/[name]-[hash]-${Date.now()}.[ext]`
        }
      }
    }
  },

  app: {
    baseURL: '/',  // Changed from '/artilora/' for local Docker development
    head: {
      title: 'Artilora - Born of Nature, Shaped by Art',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1, maximum-scale=5, user-scalable=yes' },
        { hid: 'description', name: 'description', content: 'Artilora is a fusion of Art and Flora — symbolizing the union of creativity and nature.' },
        { name: 'theme-color', content: '#4a6741' },
        { name: 'apple-mobile-web-app-capable', content: 'yes' },
        { name: 'apple-mobile-web-app-status-bar-style', content: 'black-translucent' },
        // Force no cache during development
        { 'http-equiv': 'Cache-Control', content: 'no-cache, no-store, must-revalidate' },
        { 'http-equiv': 'Pragma', content: 'no-cache' },
        { 'http-equiv': 'Expires', content: '0' }
      ],
      link: [
        { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' },
        { rel: 'preconnect', href: 'https://fonts.googleapis.com' },
        { rel: 'preconnect', href: 'https://fonts.gstatic.com', crossorigin: '' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Comfortaa:wght@300;400;500;600;700&display=swap' },
        { rel: 'stylesheet', href: 'https://fonts.googleapis.com/css2?family=Cinzel:wght@400;700&family=Quicksand:wght@300;400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400&family=Dancing+Script:wght@400;700&family=Poiret+One&family=Josefin+Sans:wght@300;400&family=Cormorant+Garamond:wght@400;600;700&display=swap' }
      ]
    }
  }
})
