<script setup lang="ts">
</script>

<template>
  <section class="mt-24 md:mt-40 mb-24 md:mb-32">
    <!-- Feature Container -->
    <div class="relative container mx-auto px-6 md:px-0 max-w-6xl flex flex-col md:flex-row text-dark-gray items-center justify-center">
      
      <!-- Image Container -->
      <div class="w-full md:w-2/3">
        <img src="/src/assets/desktop/image-interactive.jpg" alt="Interactive VR Experience" class="w-full h-auto object-cover" />
      </div>

      <!-- Text Container (Overlay Card on Desktop) -->
      <div class="w-full md:w-auto bg-white md:absolute md:bottom-0 md:right-0 md:pl-24 md:pt-24 mt-12 md:mt-0 text-center md:text-left flex flex-col justify-end max-w-xl pr-0">
        
        <!-- Heading -->
        <h2 class="text-3xl md:text-5xl uppercase font-light font-sans mb-6 md:mb-8 tracking-wider text-black">
          The leader in interactive VR
        </h2>
        
        <!-- Paragraph -->
        <p class="text-gray-500 font-alata leading-relaxed md:max-w-md mx-auto md:mx-0">
          Founded in 2011, Loopstudios has been producing world-class virtual reality 
          projects for some of the best companies around the globe. Our award-winning 
          creations have transformed businesses through digital experiences that bind 
          to their brand.
        </p>

      </div>
    </div>
  </section>
</template>

<style scoped>
/* Typography */
.font-sans, h2 {
  font-family: 'Josefin Sans', sans-serif;
}
.font-alata, p {
  font-family: 'Alata', sans-serif;
}
.text-dark-gray {
  color: hsl(0, 0%, 55%);
}
</style>
