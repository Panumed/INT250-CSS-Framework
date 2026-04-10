ไ<script setup lang="ts">
const items = [
  { id: 1, title: 'Deep<span class="md:hidden"> </span><br class="hidden md:block"/>earth', mobileImage: '/src/assets/mobile/image-deep-earth.jpg', desktopImage: '/src/assets/desktop/image-deep-earth.jpg' },
  { id: 2, title: 'Night<span class="md:hidden"> </span><br class="hidden md:block"/>arcade', mobileImage: '/src/assets/mobile/image-night-arcade.jpg', desktopImage: '/src/assets/desktop/image-night-arcade.jpg' },
  { id: 3, title: 'Soccer<span class="md:hidden"> </span><br class="hidden md:block"/>team VR', mobileImage: '/src/assets/mobile/image-soccer-team.jpg', desktopImage: '/src/assets/desktop/image-soccer-team.jpg' },
  { id: 4, title: 'The<span class="md:hidden"> </span><br class="hidden md:block"/>grid', mobileImage: '/src/assets/mobile/image-grid.jpg', desktopImage: '/src/assets/desktop/image-grid.jpg' },
  { id: 5, title: 'From up<span class="md:hidden"> </span><br class="hidden md:block"/>above VR', mobileImage: '/src/assets/mobile/image-from-above.jpg', desktopImage: '/src/assets/desktop/image-from-above.jpg' },
  { id: 6, title: 'Pocket<span class="md:hidden"> </span><br class="hidden md:block"/>borealis', mobileImage: '/src/assets/mobile/image-pocket-borealis.jpg', desktopImage: '/src/assets/desktop/image-pocket-borealis.jpg' },
  { id: 7, title: 'The<span class="md:hidden"> </span><br class="hidden md:block"/>curiosity', mobileImage: '/src/assets/mobile/image-curiosity.jpg', desktopImage: '/src/assets/desktop/image-curiosity.jpg' },
  { id: 8, title: 'Make it<span class="md:hidden"> </span><br class="hidden md:block"/>fisheye', mobileImage: '/src/assets/mobile/image-fisheye.jpg', desktopImage: '/src/assets/desktop/image-fisheye.jpg' },
]
</script>

<template>
  <section class="mt-24 mb-32 md:mt-40 md:mb-40 font-sans">
    <div class="container mx-auto px-6 md:px-0 max-w-6xl">
      <!-- Header Row -->
      <div class="flex justify-center md:justify-between items-center mb-12 md:mb-20">
        <h2 class="text-3xl md:text-5xl uppercase font-light tracking-wider">
          Our creations
        </h2>
        <!-- Desktop Button -->
        <button class="hidden md:block px-10 py-2 border-2 border-black font-alata uppercase tracking-[0.25em] hover:bg-black hover:text-white transition-colors duration-300">
          See all
        </button>
      </div>

      <!-- Item Container -->
      <div class="grid grid-cols-1 md:grid-cols-4 gap-6 md:gap-8 w-full">
        <!-- Item Card -->
        <div v-for="item in items" :key="item.id" class="group relative overflow-hidden cursor-pointer h-32 md:h-[450px]">
          
          <!-- Responsive Images -->
          <img :src="item.mobileImage" :alt="item.title" class="w-full h-full object-cover md:hidden transition-transform duration-500 group-hover:scale-110" />
          <img :src="item.desktopImage" :alt="item.title" class="w-full h-full object-cover hidden md:block transition-transform duration-500 group-hover:scale-110" />

          <!-- Gradient Overlay -->
          <div class="absolute inset-0 bg-gradient-to-b from-transparent to-black/60 group-hover:from-white/50 group-hover:to-white/50 transition-colors duration-300"></div>

          <!-- Title -->
          <h5 class="absolute bottom-4 md:bottom-8 left-6 md:left-10 text-white font-light text-2xl md:text-3xl uppercase tracking-wider w-full md:w-40 pr-6 group-hover:text-black transition-colors duration-300 z-10" v-html="item.title">
          </h5>
        </div>
      </div>

      <!-- Bottom Button (Mobile Only) -->
      <div class="flex justify-center mt-10 md:hidden">
        <button class="w-full sm:w-auto px-10 py-3 border-2 border-black font-alata uppercase tracking-[0.25em] font-semibold hover:bg-black hover:text-white transition-colors duration-300">
          See all
        </button>
      </div>
    </div>
  </section>
</template>

<style scoped>
.font-sans, h2, h5 {
  font-family: 'Josefin Sans', sans-serif;
}
.font-alata, button {
  font-family: 'Alata', sans-serif;
}
</style>
