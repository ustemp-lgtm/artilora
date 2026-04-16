/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./components/**/*.{js,vue,ts}",
    "./layouts/**/*.vue",
    "./pages/**/*.vue",
    "./plugins/**/*.{js,ts}",
    "./app.vue",
    "./error.vue",
  ],
  theme: {
    extend: {
      colors: {
        artilora: {
          dark: '#001F3F',
          ivory: '#ffffff',
          beige: '#f5f5dc',
          green: '#4a6741',
          brown: '#8c7e6a',
          gold: '#C5A059',
        }
      },
      fontFamily: {
        sans: ['Cinzel', 'sans-serif'],
        serif: ['Playfair Display', 'serif'],
      },
      spacing: {
        'safe-top': 'env(safe-area-inset-top)',
        'safe-bottom': 'env(safe-area-inset-bottom)',
        'safe-left': 'env(safe-area-inset-left)',
        'safe-right': 'env(safe-area-inset-right)',
      }
    },
  },
  plugins: [],
}