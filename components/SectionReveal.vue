<template>
  <div ref="target" :class="['transition-all duration-1000 transform', isVisible ? 'opacity-100 translate-y-0' : 'opacity-0 translate-y-10']">
    <slot />
  </div>
</template>

<script setup>
const target = ref(null)
const isVisible = ref(false)

onMounted(() => {
  const observer = new IntersectionObserver(
    ([entry]) => {
      if (entry.isIntersecting) {
        isVisible.value = true
        observer.unobserve(entry.target)
      }
    },
    {
      threshold: 0.1,
      rootMargin: '50px',
    }
  )

  if (target.value) {
    observer.observe(target.value)
  }
})
</script>
