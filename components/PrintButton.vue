<template>
  <button @click="printPage" class="print-button" title="Print this page">
    <svg viewBox="0 0 24 24" width="20" height="20" fill="currentColor">
      <path d="M19 8H5c-1.66 0-3 1.34-3 3v6h4v4h12v-4h4v-6c0-1.66-1.34-3-3-3zm-3 11H8v-5h8v5zm3-7c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm-1-9H6v4h12V3z"/>
    </svg>
    <span>Print</span>
  </button>
</template>

<script setup>
import { useAnalytics } from '~/composables/useAnalytics'

const { trackEvent } = useAnalytics()

const printPage = () => {
  if (process.client) {
    trackEvent('print_page', { page: window.location.pathname })
    window.print()
  }
}
</script>

<style scoped>
.print-button {
  display: flex;
  align-items: center;
  gap: 8px;
  padding: 12px 24px;
  background: linear-gradient(135deg, rgba(255, 215, 0, 0.2), rgba(255, 165, 0, 0.2));
  border: 2px solid #FFD700;
  border-radius: 8px;
  color: #FFD700;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 16px;
  font-weight: bold;
  cursor: pointer;
  transition: all 0.3s ease;
  backdrop-filter: blur(10px);
}

.print-button:hover {
  background: linear-gradient(135deg, #FFD700, #FFA500);
  color: #001F3F;
  transform: translateY(-2px);
  box-shadow: 0 5px 15px rgba(255, 215, 0, 0.4);
}

.print-button svg {
  transition: transform 0.3s ease;
}

.print-button:hover svg {
  transform: scale(1.1);
}

/* Hide print button when printing */
@media print {
  .print-button {
    display: none;
  }
}
</style>
