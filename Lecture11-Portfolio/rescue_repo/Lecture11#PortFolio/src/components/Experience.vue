<script setup>
const experiences = [
  {
    id: 1,
    role: 'Information Technology (IT)',
    company: 'King Mongkut\'s University of Technology Thonburi',
    period: '2024 - Present',
    description: 'Currently studying Information Technology at KMUTT. Focusing on software development, web technologies, and system architecture.',
    technologies: ['Web Development', 'Programming', 'System Analysis']
  }
];
</script>

<template>
  <section
    id="experience"
    class="py-24 bg-zinc-50 dark:bg-zinc-950 border-t border-zinc-200 dark:border-zinc-900 relative transition-colors duration-300"
  >
    <div class="absolute top-20 right-10 text-zinc-200 dark:text-zinc-800 font-mono text-6xl opacity-40 dark:opacity-20 pointer-events-none select-none transition-colors">
      03_EDUCATION
    </div>
    <div class="container mx-auto px-6 md:px-12 relative z-10 max-w-4xl">
      <!-- Section Title -->
      <div class="mb-16">
        <div class="flex items-center gap-4 mb-4">
          <div class="w-12 h-1 bg-yellow-500 dark:bg-yellow-400"></div>
          <h2 class="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white uppercase tracking-wider transition-colors">
            My <span class="text-cyan-600 dark:text-cyan-400">Education</span>
          </h2>
        </div>
        <p class="text-zinc-500 font-mono">> Education background...</p>
      </div>

      <div class="relative border-l border-zinc-300 dark:border-zinc-800 ml-3 md:ml-6 font-mono transition-colors">
        <div 
          v-for="(exp, index) in experiences" 
          :key="index"
          class="mb-12 relative pl-8 md:pl-12 group"
        >
          <!-- Timeline Node -->
          <div class="absolute left-[-5px] md:left-[-5px] top-1.5 w-2.5 h-2.5 border border-cyan-500 bg-zinc-100 dark:bg-zinc-950 group-hover:bg-cyan-500 group-hover:shadow-[0_0_10px_rgba(0,240,255,0.8)] transition-all duration-300"></div>
          
          <!-- Content Card -->
          <div class="bg-white/80 dark:bg-zinc-900/40 p-6 border border-zinc-200 dark:border-zinc-800 group-hover:border-cyan-500/50 transition-colors relative overflow-hidden shadow-sm dark:shadow-none">
            <!-- Decorative corner -->
            <div class="absolute top-0 right-0 w-8 h-8 border-t-2 border-r-2 border-zinc-300 dark:border-zinc-700 group-hover:border-cyan-500/50 transition-colors"></div>
            
            <div class="flex flex-col md:flex-row md:justify-between md:items-center mb-4">
              <h3 class="text-xl font-bold text-zinc-900 dark:text-white group-hover:text-cyan-600 dark:group-hover:text-cyan-400 transition-colors uppercase tracking-widest">
                {{ exp.role }}
              </h3>
              <span class="text-yellow-600 dark:text-yellow-400 text-sm mt-1 md:mt-0 font-bold">[{{ exp.period }}]</span>
            </div>
            
            <h4 class="text-zinc-600 dark:text-zinc-400 mb-4 flex items-center gap-2 uppercase text-sm tracking-widest transition-colors">
              <span class="text-cyan-500">></span> {{ exp.company }}
            </h4>
            
            <p class="text-zinc-600 dark:text-zinc-500 text-sm leading-relaxed mb-6 transition-colors">
              {{ exp.description }}
            </p>
            
            <div class="flex flex-wrap gap-2">
              <span 
                v-for="(tech, techIndex) in exp.technologies" 
                :key="techIndex"
                class="px-2 py-1 text-xs font-mono bg-zinc-50 dark:bg-black text-zinc-600 dark:text-zinc-400 border border-zinc-200 dark:border-zinc-800 group-hover:border-cyan-500/30 transition-colors uppercase"
              >
                {{ tech }}
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
