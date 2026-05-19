<script setup>
const scrollToTop = () => {
  window.scrollTo({
    top: 0,
    behavior: 'smooth'
  });
};
</script>

<template>
  <footer class="bg-zinc-100 dark:bg-black border-t border-zinc-200 dark:border-zinc-900 transition-colors duration-300 py-6 font-mono">
    <div class="container mx-auto px-6 md:px-12 flex flex-col md:flex-row justify-between items-center gap-4">
      
      <!-- Copyright -->
      <div class="text-zinc-500 dark:text-zinc-500 text-xs uppercase tracking-widest transition-colors">
        &copy; {{ new Date().getFullYear() }} PORTFOLIO. ALL RIGHTS RESERVED.
      </div>

      <!-- Back to top -->
      <button 
        @click="scrollToTop"
        class="flex items-center gap-2 text-xs font-bold text-cyan-600 dark:text-cyan-500 hover:text-yellow-500 dark:hover:text-yellow-400 transition-colors group uppercase tracking-widest border border-cyan-500/30 hover:border-yellow-500 dark:hover:border-yellow-400 px-3 py-1 bg-white dark:bg-zinc-900 shadow-sm dark:shadow-none"
      >
        [ BACK TO TOP ]
      </button>
      
    </div>
  </footer>
</template>
