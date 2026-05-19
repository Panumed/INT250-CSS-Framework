<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const props = defineProps({
  isDark: {
    type: Boolean,
    required: true
  }
});

const emit = defineEmits(['toggle-dark-mode']);

const isScrolled = ref(false);
const isMenuOpen = ref(false);

const navLinks = [
  { name: 'Home', href: '#home' },
  { name: 'About', href: '#about' },
  { name: 'Projects', href: '#projects' },
  { name: 'Education', href: '#experience' },
  { name: 'Contact', href: '#contact' },
];

const handleScroll = () => {
  isScrolled.value = window.scrollY > 20;
};

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll);
});
</script>

<template>
  <nav
    :class="[
      'fixed top-0 left-0 right-0 z-50 transition-all duration-300 font-mono border-b border-zinc-200 dark:border-zinc-900',
      isScrolled 
        ? 'bg-white/95 dark:bg-zinc-950/95 shadow-[0_4px_30px_rgba(0,0,0,0.1)] dark:shadow-[0_4px_30px_rgba(0,240,255,0.1)] py-3 backdrop-blur-md' 
        : 'bg-white/80 dark:bg-zinc-950/80 py-5 backdrop-blur-md'
    ]"
  >
    <div class="container mx-auto px-6 md:px-12 flex justify-between items-center">
      <!-- Logo -->
      <a href="#home" class="text-2xl font-bold tracking-tighter text-zinc-900 dark:text-white hover:text-cyan-500 dark:hover:text-cyan-400 transition-colors uppercase">
        <span class="text-cyan-500">></span> Portfolio<span class="animate-pulse text-zinc-900 dark:text-white">_</span>
      </a>

      <!-- Desktop Nav -->
      <div class="hidden md:flex items-center space-x-8">
        <a 
          v-for="link in navLinks" 
          :key="link.name" 
          :href="link.href"
          class="text-zinc-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-zinc-100 dark:hover:bg-zinc-900 px-3 py-1 transition-colors duration-300 font-bold uppercase tracking-widest text-sm border border-transparent hover:border-cyan-500/30"
        >
          [{{ link.name }}]
        </a>
        
        <!-- Status Indicator -->
        <div class="flex items-center gap-2 px-3 py-1 bg-zinc-100 dark:bg-black border border-zinc-300 dark:border-zinc-800 text-xs text-zinc-600 dark:text-zinc-500 uppercase">
          <div class="w-2 h-2 rounded-full bg-cyan-500 animate-pulse"></div>
          Online
        </div>

        <!-- Dark Mode Toggle -->
        <button 
          @click="emit('toggle-dark-mode')"
          class="p-2 border border-zinc-300 dark:border-zinc-700 hover:border-cyan-500 dark:hover:border-cyan-500 transition-colors text-zinc-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-cyan-400"
          aria-label="Toggle Dark Mode"
        >
          <svg v-if="isDark" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
          </svg>
          <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
          </svg>
        </button>
      </div>

      <!-- Mobile Menu Button -->
      <div class="flex items-center space-x-4 md:hidden">
        <!-- Dark Mode Toggle Mobile -->
        <button 
          @click="emit('toggle-dark-mode')"
          class="p-2 border border-zinc-300 dark:border-zinc-700 hover:border-cyan-500 dark:hover:border-cyan-500 transition-colors text-zinc-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-cyan-400"
        >
          <svg v-if="isDark" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
            <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z" />
          </svg>
          <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
            <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z" />
          </svg>
        </button>

        <button @click="isMenuOpen = !isMenuOpen" class="text-cyan-600 dark:text-cyan-500 hover:text-cyan-700 dark:hover:text-cyan-300 focus:outline-none border border-cyan-500/50 p-1 bg-zinc-100 dark:bg-black">
          <svg v-if="!isMenuOpen" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
          </svg>
          <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
            <path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </div>

    <!-- Mobile Nav -->
    <div 
      v-if="isMenuOpen" 
      class="md:hidden absolute top-full left-0 w-full bg-white dark:bg-zinc-950 border-b border-cyan-500/30 transition-all font-mono"
    >
      <div class="flex flex-col py-4 px-6 space-y-2 bg-zinc-50 dark:bg-black">
        <a 
          v-for="link in navLinks" 
          :key="link.name" 
          :href="link.href"
          @click="isMenuOpen = false"
          class="text-zinc-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-cyan-400 hover:bg-zinc-200 dark:hover:bg-zinc-900 border border-transparent hover:border-cyan-500/30 px-4 py-2 font-bold uppercase tracking-widest"
        >
          > {{ link.name }}
        </a>
      </div>
    </div>
  </nav>
</template>
