<script setup></script>

<template>
  <!-- Background Container -->
  <div class="flex items-center justify-center bg-zinc-700 h-screen">
    
    <!-- Card -->
    <div class="bg-zinc-800 p-2 mx-6 rounded-2xl shadow-xl">
      
      <!-- Flex Container -->
      <div class="flex flex-col md:flex-row rounded-xl overflow-hidden items-stretch">
        
        <!-- Image -->
        <img 
          src="../src/assets/diet.jpg.webp"
          alt=""
          class="md:w-72 object-cover
                 md:rounded-l-xl md:rounded-r-none
                 transform hover:scale-105
                 transition duration-200"
        />

        <!-- Content -->
        <div class="p-6 md:p-12 flex flex-col justify-center">
          
          <h2 class="font-serif text-xl font-medium text-center text-white md:text-left">
            Get diet and fitness tips in your inbox
          </h2>

          <p class="max-w-xs my-4 text-xs leading-5 tracking-wide text-center text-zinc-300 md:text-left">
            Eat better and exercise better. Sign up for the Diet&Fitness newsletter.
          </p>

          <div class="flex flex-col mt-5 space-y-4 md:space-y-0 md:flex-row md:space-x-3">
            
            <input
              type="text"
              placeholder="Enter your email address"
              class="p-2 px-4 text-xs text-white bg-zinc-800 border border-zinc-600 rounded-md
                     placeholder:text-xs placeholder:text-center md:placeholder:text-left
                     focus:outline-none"
            />

            <button
              class="px-5 py-3 text-xs text-zinc-800 bg-lime-500 rounded-md
                     hover:bg-lime-700 hover:text-white
                     transition duration-500"
            >
              Subscribe
            </button>

          </div>

        </div>
      </div>
    </div>
  </div>
</template>


<style scoped></style>
