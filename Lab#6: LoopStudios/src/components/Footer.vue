<script setup lang="ts">
</script>

<template>
  <footer class="bg-black py-12 md:py-10">
    <!-- Container -->
    <div class="container mx-auto px-6 max-w-6xl flex flex-col md:flex-row justify-between items-center md:items-start text-white text-center md:text-left">
      
      <!-- Left Section: Logo & Menu -->
      <div class="flex flex-col items-center md:items-start mb-12 md:mb-0">
        <!-- Logo -->
        <a href="#" class="mb-8 md:mb-6">
          <img src="/src/assets/logo.svg" alt="Loopstudios Logo" class="h-6 md:h-7" />
        </a>

        <!-- Footer Menu -->
        <div class="flex flex-col md:flex-row gap-6 md:gap-8 font-alata">
          <div class="group relative inline-block w-fit">
            <a href="#" class="hover:text-gray-300">About</a>
            <div class="absolute bottom-[-6px] left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative inline-block w-fit">
            <a href="#" class="hover:text-gray-300">Careers</a>
            <div class="absolute bottom-[-6px] left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative inline-block w-fit">
            <a href="#" class="hover:text-gray-300">Events</a>
            <div class="absolute bottom-[-6px] left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative inline-block w-fit">
            <a href="#" class="hover:text-gray-300">Products</a>
            <div class="absolute bottom-[-6px] left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative inline-block w-fit">
            <a href="#" class="hover:text-gray-300">Support</a>
            <div class="absolute bottom-[-6px] left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
        </div>
      </div>

      <!-- Right Section: Social & Copyright -->
      <div class="flex flex-col items-center md:items-end">
        <!-- Social Icons -->
        <div class="flex gap-4 md:gap-6 mb-6 md:mb-6">
          <div class="group relative pb-2 w-fit">
            <a href="#">
              <img src="/src/assets/icon-facebook.svg" alt="Facebook" class="h-6 hover:scale-110 transition-transform" />
            </a>
            <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative pb-2 w-fit">
            <a href="#">
              <img src="/src/assets/icon-twitter.svg" alt="Twitter" class="h-6 hover:scale-110 transition-transform" />
            </a>
            <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative pb-2 w-fit">
            <a href="#">
              <img src="/src/assets/icon-pinterest.svg" alt="Pinterest" class="h-6 hover:scale-110 transition-transform" />
            </a>
            <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
          <div class="group relative pb-2 w-fit">
            <a href="#">
              <img src="/src/assets/icon-instagram.svg" alt="Instagram" class="h-6 hover:scale-110 transition-transform" />
            </a>
            <div class="absolute bottom-0 left-1/2 -translate-x-1/2 w-0 h-[2px] bg-white group-hover:w-full transition-all duration-300"></div>
          </div>
        </div>

        <!-- Copyright -->
        <p class="text-gray-500 font-alata">
          © 2021 Loopstudios. All rights reserved.
        </p>
      </div>
      
    </div>
  </footer>
</template>

<style scoped>
.font-alata {
  font-family: 'Alata', sans-serif;
}
</style>
