<template>
  <nav class="breadcrumb-nav" aria-label="Breadcrumb">
    <ol class="breadcrumb-list">
      <li class="breadcrumb-item">
        <NuxtLink to="/" class="breadcrumb-link">
          <span class="breadcrumb-icon">🏠</span>
          <span class="breadcrumb-text">Home</span>
        </NuxtLink>
      </li>
      
      <li 
        v-for="(crumb, index) in breadcrumbs" 
        :key="index"
        class="breadcrumb-item"
      >
        <span class="breadcrumb-separator">›</span>
        <NuxtLink 
          v-if="crumb.path && index < breadcrumbs.length - 1"
          :to="crumb.path" 
          class="breadcrumb-link"
        >
          {{ crumb.label }}
        </NuxtLink>
        <span v-else class="breadcrumb-current">
          {{ crumb.label }}
        </span>
      </li>
    </ol>
  </nav>
</template>

<script setup>
import { computed } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()

const breadcrumbs = computed(() => {
  const pathArray = route.path.split('/').filter(p => p)
  const crumbs = []
  
  // Map of route names to display labels
  const routeLabels = {
    'gallery': 'Gallery',
    'about': 'About Artilora',
    'awards': 'Awards & Recognition',
    'contact': 'Contact Us',
    'studio': 'Virtual Studio Tour'
  }
  
  pathArray.forEach((path, index) => {
    const label = routeLabels[path] || path.charAt(0).toUpperCase() + path.slice(1)
    const fullPath = '/' + pathArray.slice(0, index + 1).join('/')
    
    crumbs.push({
      label,
      path: fullPath
    })
  })
  
  return crumbs
})
</script>

<style scoped>
.breadcrumb-nav {
  padding: 15px 20px;
  background: rgba(0, 31, 63, 0.5);
  backdrop-filter: blur(10px);
  border-bottom: 1px solid rgba(255, 215, 0, 0.2);
}

.breadcrumb-list {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 8px;
  list-style: none;
  margin: 0;
  padding: 0;
  max-width: 1200px;
  margin: 0 auto;
}

.breadcrumb-item {
  display: flex;
  align-items: center;
  gap: 8px;
}

.breadcrumb-link {
  display: flex;
  align-items: center;
  gap: 6px;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFD700;
  text-decoration: none;
  transition: all 0.3s ease;
  padding: 4px 8px;
  border-radius: 4px;
}

.breadcrumb-link:hover {
  background: rgba(255, 215, 0, 0.1);
  color: #FFF;
}

.breadcrumb-icon {
  font-size: 16px;
}

.breadcrumb-separator {
  color: rgba(255, 215, 0, 0.5);
  font-size: 18px;
  user-select: none;
}

.breadcrumb-current {
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  color: #FFFFFF;
  font-weight: bold;
  padding: 4px 8px;
}

@media (max-width: 768px) {
  .breadcrumb-nav {
    padding: 10px 15px;
  }
  
  .breadcrumb-text {
    display: none;
  }
  
  .breadcrumb-link {
    font-size: 12px;
  }
  
  .breadcrumb-current {
    font-size: 12px;
  }
}
</style>
