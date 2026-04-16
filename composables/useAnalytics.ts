export const useAnalytics = () => {
  const { $gtag } = useNuxtApp()
  
  // Track custom events
  const trackEvent = (eventName: string, eventParams?: Record<string, any>) => {
    if ($gtag) {
      $gtag('event', eventName, eventParams)
    }
  }
  
  // Track page views
  const trackPageView = (pagePath: string, pageTitle?: string) => {
    if ($gtag) {
      $gtag('event', 'page_view', {
        page_path: pagePath,
        page_title: pageTitle || document.title
      })
    }
  }
  
  // Track sculpture views in gallery
  const trackSculptureView = (sculptureName: string, sculptureId?: string) => {
    trackEvent('view_sculpture', {
      sculpture_name: sculptureName,
      sculpture_id: sculptureId,
      content_type: 'artwork'
    })
  }
  
  // Track contact form submissions
  const trackContactForm = (formType: string = 'general') => {
    trackEvent('contact_form_submit', {
      form_type: formType,
      engagement_type: 'inquiry'
    })
  }
  
  // Track gallery interactions
  const trackGalleryInteraction = (action: string, itemName?: string) => {
    trackEvent('gallery_interaction', {
      action: action,
      item_name: itemName
    })
  }
  
  // Track button clicks
  const trackButtonClick = (buttonName: string, location: string) => {
    trackEvent('button_click', {
      button_name: buttonName,
      click_location: location
    })
  }
  
  // Track scroll depth
  const trackScrollDepth = (percentage: number, pageName: string) => {
    trackEvent('scroll_depth', {
      scroll_percentage: percentage,
      page_name: pageName
    })
  }
  
  // Track AI chat interactions
  const trackChatOpen = () => {
    trackEvent('ai_chat_open', {
      engagement_type: 'chat',
      chat_type: 'artilorian_counsel'
    })
  }
  
  const trackChatClose = (messageCount: number, duration: number) => {
    trackEvent('ai_chat_close', {
      engagement_type: 'chat',
      message_count: messageCount,
      session_duration: duration
    })
  }
  
  const trackChatMessage = (userMessage: string, messageNumber: number) => {
    trackEvent('ai_chat_message', {
      engagement_type: 'chat',
      message_preview: userMessage.substring(0, 100), // First 100 chars for privacy
      message_number: messageNumber,
      message_length: userMessage.length
    })
  }
  
  const trackChatSuggestion = (suggestionText: string) => {
    trackEvent('ai_chat_suggestion_click', {
      engagement_type: 'chat',
      suggestion: suggestionText
    })
  }
  
  return {
    trackEvent,
    trackPageView,
    trackSculptureView,
    trackContactForm,
    trackGalleryInteraction,
    trackButtonClick,
    trackScrollDepth,
    trackChatOpen,
    trackChatClose,
    trackChatMessage,
    trackChatSuggestion
  }
}
