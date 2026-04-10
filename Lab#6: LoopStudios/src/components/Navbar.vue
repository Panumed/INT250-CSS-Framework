<script setup lang="ts">
import { ref } from 'vue'

const isMobileMenuOpen = ref(false)

const toggleMobileMenu = () => {
  isMobileMenuOpen.value = !isMobileMenuOpen.value
  if (isMobileMenuOpen.value) {
    document.body.style.overflow = 'hidden'
  } else {
    document.body.style.overflow = 'auto'
  }
}
</script>

<template>
  <section class="relative w-full min-h-screen md:min-h-[600px] bg-cover bg-no-repeat bg-center pb-24" 
           style="background-image: url('/src/assets/desktop/image-hero.jpg');"
           :style="`background-image: url('/src/assets/${isMobileMenuOpen ? 'mobile' : 'desktop'}/image-hero.jpg'); /* Defaulting inline via tailwind classes instead where possible */`">
    
    <!-- We'll use Tailwind classes for background to ensure breakpoints work cleanly -->
    <div class="absolute inset-0 w-full h-full bg-cover bg-no-repeat bg-center bg-[url('/src/assets/mobile/image-hero.jpg')] md:bg-[url('/src/assets/desktop/image-hero.jpg')] z-0"></div>

    <!-- Container -->
    <div class="relative z-10 container mx-auto px-6 py-12 max-w-6xl">
      <!-- Navigation Bar -->
      <nav class="flex justify-between items-center font-bold text-white mb-28 md:mb-32">
        <a href="#" class="z-50">
          <img src="/src/assets/logo.svg" alt="Loopstudios Logo" class="h-6 md:h-8" />
        </a>

        <!-- Desktop Menu (hidden on mobile) -->
        <div class="hidden md:flex h-10 font-sans gap-8">
          <div class="group relative flex items-center h-full">
            <a href="#" class="hover:text-white pb-2">About</a>
            <div class="absolute bottom-1 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative flex items-center h-full">
            <a href="#" class="hover:text-white pb-2">Careers</a>
            <div class="absolute bottom-1 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative flex items-center h-full">
            <a href="#" class="hover:text-white pb-2">Events</a>
            <div class="absolute bottom-1 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative flex items-center h-full">
            <a href="#" class="hover:text-white pb-2">Products</a>
            <div class="absolute bottom-1 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative flex items-center h-full">
            <a href="#" class="hover:text-white pb-2">Support</a>
            <div class="absolute bottom-1 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
        </div>

        <!-- Hamburger Icon (Mobile Only) -->
        <button class="md:hidden z-50 focus:outline-none" @click="toggleMobileMenu">
          <img v-if="!isMobileMenuOpen" src="/src/assets/icon-hamburger.svg" alt="Open Menu" />
          <img v-else src="/src/assets/icon-close.svg" alt="Close Menu" />
        </button>
      </nav>

      <!-- Mobile Menu Overlay -->
      <div v-show="isMobileMenuOpen" class="fixed inset-0 z-40 bg-black flex flex-col justify-center px-6 md:hidden">
        <div class="flex flex-col gap-6 text-white text-3xl font-light font-sans uppercase">
          <a href="#" class="hover:text-gray-300 w-fit group">
            ABOUT
            <div class="h-[2px] w-0 bg-white group-hover:w-full transition-all duration-300 mt-1"></div>
          </a>
          <a href="#" class="hover:text-gray-300 w-fit group">
            CAREERS
            <div class="h-[2px] w-0 bg-white group-hover:w-full transition-all duration-300 mt-1"></div>
          </a>
          <a href="#" class="hover:text-gray-300 w-fit group">
            EVENTS
            <div class="h-[2px] w-0 bg-white group-hover:w-full transition-all duration-300 mt-1"></div>
          </a>
          <a href="#" class="hover:text-gray-300 w-fit group">
            PRODUCTS
            <div class="h-[2px] w-0 bg-white group-hover:w-full transition-all duration-300 mt-1"></div>
          </a>
          <a href="#" class="hover:text-gray-300 w-fit group">
            SUPPORT
            <div class="h-[2px] w-0 bg-white group-hover:w-full transition-all duration-300 mt-1"></div>
          </a>
        </div>
      </div>

      <!-- Hero Headline Text Box -->
      <div v-show="!isMobileMenuOpen" class="border-2 border-white p-6 md:p-10 max-w-lg mt-16 md:mt-0 group cursor-default">
        <h1 class="text-white text-4xl md:text-5xl lg:text-6xl uppercase font-light leading-snug tracking-wider">
          IMPRESSIVE EXPERIENCES THAT 
          <span class="relative inline-block">
            DELIVER
            <span class="absolute -bottom-1 lg:-bottom-2 left-0 w-0 h-[3px] bg-white group-hover:w-full transition-all duration-500 ease-in-out"></span>
          </span>
        </h1>
      </div>
      
    </div>
  </section>
</template>

<style scoped>
/* Specific fonts matching Loopstudios */
.font-sans, h1 {
  font-family: 'Josefin Sans', sans-serif;
}
</style>
