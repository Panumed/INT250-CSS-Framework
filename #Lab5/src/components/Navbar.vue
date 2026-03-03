<script setup>
import { ref } from 'vue'
const open = ref(false)
</script>

<template>
  <nav class="max-w-7xl mx-auto px-6 py-6 flex justify-between items-center">
    <h1 class="font-bold text-xl">Shortly</h1>

    <!-- Desktop menu -->
    <div class="hidden lg:flex items-center gap-8">
      <div class="flex gap-6 text-gray-600">
        <a href="#">Features</a>
        <a href="#">Pricing</a>
        <a href="#">Resources</a>
      </div>
      <div class="flex gap-4">
        <button>Login</button>
        <button class="bg-cyan-500 text-white px-4 py-2 rounded-full">
          Sign Up
        </button>
      </div>
    </div>

    <!-- Hamburger -->
    <button class="lg:hidden" @click="open = !open">☰</button>
  </nav>

  <!-- Mobile menu -->
  <div
    v-if="open"
    class="mx-6 bg-indigo-900 text-white rounded-xl p-6 text-center space-y-4 lg:hidden"
  >
    <a class="block">Features</a>
    <a class="block">Pricing</a>
    <a class="block">Resources</a>
    <hr />
    <button class="block w-full">Login</button>
    <button class="bg-cyan-500 w-full py-2 rounded-full">
      Sign Up
    </button>
  </div>
</template>