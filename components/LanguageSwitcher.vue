<template>
  <div class="language-switcher">
    <select 
      v-model="currentLocale" 
      @change="switchLanguage"
      class="language-select"
      :aria-label="$t('language.select')"
    >
      <option 
        v-for="locale in availableLocales" 
        :key="locale.code" 
        :value="locale.code"
      >
        {{ locale.flag }} {{ locale.name }}
      </option>
    </select>
  </div>
</template>

<script setup>
const { locale, locales, setLocale } = useI18n()
const currentLocale = ref(locale.value)

const availableLocales = computed(() => {
  const flags = {
    en: '🇬🇧',
    fr: '🇫🇷',
    de: '🇩🇪',
    es: '🇪🇸',
    zh: '🇨🇳',
    ja: '🇯🇵'
  }
  
  return locales.value.map(loc => ({
    code: loc.code,
    name: loc.name,
    flag: flags[loc.code] || '🌐'
  }))
})

const switchLanguage = async () => {
  await setLocale(currentLocale.value)
}
</script>

<style scoped>
.language-switcher {
  position: relative;
}

.language-select {
  background: rgba(0, 31, 63, 0.9);
  color: #FFD700;
  border: 1px solid #FFD700;
  border-radius: 4px;
  padding: 8px 12px;
  font-family: 'Bradley Hand ITC', cursive;
  font-size: 14px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.language-select:hover {
  background: rgba(255, 215, 0, 0.1);
  border-color: #FFFFFF;
}

.language-select:focus {
  outline: none;
  box-shadow: 0 0 0 2px rgba(255, 215, 0, 0.3);
}

.language-select option {
  background: #001F3F;
  color: #FFFFFF;
  padding: 8px;
}
</style>
