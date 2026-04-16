<template>
  <Transition
    :name="transitionName"
    :mode="mode"
    @before-enter="onBeforeEnter"
    @enter="onEnter"
    @after-enter="onAfterEnter"
    @before-leave="onBeforeLeave"
    @leave="onLeave"
  >
    <slot />
  </Transition>
</template>

<script setup>
const props = defineProps({
  transitionName: {
    type: String,
    default: 'fade-slide'
  },
  mode: {
    type: String,
    default: 'out-in'
  },
  duration: {
    type: Number,
    default: 500
  }
})

const onBeforeEnter = (el) => {
  el.style.opacity = '0'
  el.style.transform = 'translateY(30px) scale(0.98)'
}

const onEnter = (el, done) => {
  el.offsetHeight // Trigger reflow
  el.style.transition = `all ${props.duration}ms cubic-bezier(0.4, 0, 0.2, 1)`
  
  requestAnimationFrame(() => {
    el.style.opacity = '1'
    el.style.transform = 'translateY(0) scale(1)'
  })
  
  setTimeout(done, props.duration)
}

const onAfterEnter = (el) => {
  el.style.transition = ''
}

const onBeforeLeave = (el) => {
  el.style.position = 'absolute'
  el.style.width = '100%'
}

const onLeave = (el, done) => {
  el.style.transition = `all ${props.duration}ms cubic-bezier(0.4, 0, 0.2, 1)`
  
  requestAnimationFrame(() => {
    el.style.opacity = '0'
    el.style.transform = 'translateY(-30px) scale(0.98)'
  })
  
  setTimeout(done, props.duration)
}
</script>

<style scoped>
/* Fade and slide transition */
.fade-slide-enter-active,
.fade-slide-leave-active {
  transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.fade-slide-enter-from {
  opacity: 0;
  transform: translateY(30px) scale(0.98);
}

.fade-slide-leave-to {
  opacity: 0;
  transform: translateY(-30px) scale(0.98);
}

/* Fade only transition */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.4s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* Slide from right transition */
.slide-right-enter-active,
.slide-right-leave-active {
  transition: all 0.5s cubic-bezier(0.4, 0, 0.2, 1);
}

.slide-right-enter-from {
  opacity: 0;
  transform: translateX(50px);
}

.slide-right-leave-to {
  opacity: 0;
  transform: translateX(-50px);
}

/* Zoom transition */
.zoom-enter-active,
.zoom-leave-active {
  transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

.zoom-enter-from {
  opacity: 0;
  transform: scale(0.9);
}

.zoom-leave-to {
  opacity: 0;
  transform: scale(1.1);
}
</style>
