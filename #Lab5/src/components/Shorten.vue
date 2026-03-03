<script setup>
import { ref } from 'vue'

const copied = ref(null)

const links = [
  { original: 'https://frontendmentor.io', short: 'https://rel.ink/k4lkyk' },
  { original: 'https://twitter.com/frontendmentor', short: 'https://rel.ink/gxOXp9' },
  { original: 'https://linkedin.com/frontendmentor', short: 'https://rel.ink/gob3X9' },
]
</script>

<template>
  <section class="bg-gray-100 py-20 px-6">

    <!-- Form -->
    <div class="bg-indigo-900 p-6 rounded-xl max-w-5xl mx-auto -mt-32">
      <div class="flex flex-col md:flex-row gap-4">
        <input
          class="flex-1 p-4 rounded-lg bg-white text-black placeholder-gray-400 focus:ring-2 focus:ring-cyan-400 outline-none"
          placeholder="Shorten a link here"
        />
        <button class="bg-cyan-500 text-white px-6 py-3 rounded-lg">
          Shorten It!
        </button>
      </div>
    </div>

    <!-- Cards -->
    <div class="max-w-5xl mx-auto mt-8 space-y-4">

      <div
        v-for="(l, i) in links"
        :key="i"
        class="bg-white p-6 rounded-lg
               flex flex-col md:flex-row
               md:items-center md:justify-between
               gap-4
               text-center md:text-left"
      >

        <!-- Original link -->
        <span class="break-all">
          {{ l.original }}
        </span>

        <!-- Short link + button -->
        <div
          class="flex flex-col md:flex-row
                 items-center md:items-center
                 gap-4"
        >
          <a class="text-cyan-500 font-semibold">
            {{ l.short }}
          </a>

          <button
            @click="copied = i"
            :class="[
              'px-5 py-2 rounded-lg text-white transition',
              copied === i ? 'bg-indigo-900' : 'bg-cyan-500'
            ]"
          >
            {{ copied === i ? 'Copied!' : 'Copy' }}
          </button>
        </div>

      </div>

    </div>
  </section>
</template>