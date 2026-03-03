<script setup>
import facebook from '@/assets/icon-facebook.svg'
import twitter from '@/assets/icon-twitter.svg'
import instagram from '@/assets/icon-instagram.svg'
</script>

<template>
  <footer class="bg-gray-900 text-gray-400 py-16 px-6">
    <div class="max-w-7xl mx-auto flex flex-col lg:flex-row lg:items-start lg:justify-between gap-12">

      <!-- Logo -->
      <h2 class="text-white text-2xl font-bold text-center lg:text-left">
        Shortly
      </h2>

      <!-- Menu Columns -->
      <div class="flex flex-col md:flex-row gap-12 text-center lg:text-left">

        <div>
          <h3 class="text-white font-semibold mb-4">Features</h3>
          <ul class="space-y-2">
            <li>Link Shortening</li>
            <li>Branded Links</li>
            <li>Analytics</li>
          </ul>
        </div>

        <div>
          <h3 class="text-white font-semibold mb-4">Resources</h3>
          <ul class="space-y-2">
            <li>Blog</li>
            <li>Developers</li>
            <li>Support</li>
          </ul>
        </div>

        <div>
          <h3 class="text-white font-semibold mb-4">Company</h3>
          <ul class="space-y-2">
            <li>About</li>
            <li>Our Team</li>
            <li>Careers</li>
            <li>Contact</li>
          </ul>
        </div>

      </div>

      <!-- Social -->
      <div class="flex justify-center lg:justify-end gap-6">
        <img :src="facebook" class="w-5 h-5 cursor-pointer hover:brightness-150 transition" />
        <img :src="twitter" class="w-5 h-5 cursor-pointer hover:brightness-150 transition" />
        <img :src="instagram" class="w-5 h-5 cursor-pointer hover:brightness-150 transition" />
      </div>

    </div>
  </footer>
</template>