<template>
  <div class="min-h-screen bg-[#001F3F] text-white font-serif flex flex-col">
    <TheHeader />

    <main class="flex-grow bg-[#001F3F]">
      <slot />
    </main>

    <TheFooter />
  </div>
</template>
