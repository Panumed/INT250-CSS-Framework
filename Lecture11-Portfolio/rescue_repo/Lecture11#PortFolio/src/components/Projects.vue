<script setup>
import ui1Img from '@/assets/img/imgjob/UI1.png';
import craftingtableImg from '@/assets/img/imgjob/craftingtable.png';

import urwarzoneImg from '@/assets/img/imgjob/ur_warzone.png';
import xcoreairdropImg from '@/assets/img/imgjob/xcore-airdrop.png';

const projects = [
  {
    id: 1,
    title: 'FiveM Custom NUI Interfaces',
    description: 'Designed and developed highly interactive and responsive custom User Interfaces (NUI) for FiveM servers. Built using modern web technologies to ensure optimal performance and seamless in-game integration.',
    tags: ['Lua', 'JavaScript', 'HTML/CSS'],
    image: ui1Img,
    github: '#',
    live: '#'
  },
  {
    id: 2,
    title: 'FiveM Crafting System',
    description: 'A custom, interactive crafting table interface designed for FiveM roleplay servers. Features intuitive UI mechanics and dynamic recipe management.',
    tags: ['Lua', 'JavaScript', 'HTML/CSS'],
    image: craftingtableImg,
    github: '#',
    live: '#'
  },

  {
    id: 4,
    title: 'Warzone Game Mode UI',
    description: 'A specialized UI designed for a Warzone-style game mode in FiveM. Includes live killfeeds, dynamic scoreboards, and responsive match timers.',
    tags: ['Lua', 'JavaScript', 'HTML/CSS'],
    image: urwarzoneImg,
    github: '#',
    live: '#'
  },
  {
    id: 5,
    title: 'XCore Airdrop Interface',
    description: 'An engaging, animated user interface for airdrop events in FiveM servers. Displays drop notifications and loot previews dynamically.',
    tags: ['Lua', 'JavaScript', 'HTML/CSS'],
    image: xcoreairdropImg,
    github: '#',
    live: '#'
  }
];
</script>

<template>
  <section
    id="projects"
    class="py-24 bg-white dark:bg-zinc-950 border-t border-zinc-200 dark:border-zinc-900 relative transition-colors duration-300"
  >
    <div class="absolute top-20 right-10 text-zinc-200 dark:text-zinc-800 font-mono text-6xl opacity-40 dark:opacity-20 pointer-events-none select-none transition-colors">
      01_PROJECTS
    </div>

    <div class="container mx-auto px-6 md:px-12 relative z-10">
      <!-- Section Title -->
      <div class="mb-16">
        <div class="flex items-center gap-4 mb-4">
          <div class="w-12 h-1 bg-yellow-500 dark:bg-yellow-400"></div>
          <h2 class="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white uppercase tracking-wider transition-colors">
            Featured <span class="text-cyan-600 dark:text-cyan-400">Projects</span>
          </h2>
        </div>
        <p class="text-zinc-500 font-mono">> My recent work...</p>
      </div>

      <!-- Projects Grid (Zig-Zag Layout) -->
      <div class="flex flex-col gap-16 md:gap-24">
        <div 
          v-for="(project, index) in projects" 
          :key="project.id"
          class="group relative bg-zinc-50 dark:bg-black/40 border border-zinc-200 dark:border-zinc-800 hover:border-cyan-500 dark:hover:border-cyan-400 transition-colors duration-300 overflow-hidden flex flex-col md:flex-row"
          :class="index % 2 !== 0 ? 'md:flex-row-reverse' : ''"
        >
          <!-- Cyberpunk Corner Accents -->
          <div class="absolute top-0 left-0 w-4 h-4 border-t-2 border-l-2 border-cyan-500 opacity-0 group-hover:opacity-100 transition-opacity z-20"></div>
          <div class="absolute bottom-0 right-0 w-4 h-4 border-b-2 border-r-2 border-cyan-500 opacity-0 group-hover:opacity-100 transition-opacity z-20"></div>

          <!-- Image Container (50% width on desktop) -->
          <div class="w-full md:w-1/2 min-h-[300px] md:min-h-[400px] bg-zinc-100 dark:bg-black flex items-center justify-center overflow-hidden relative border-b md:border-b-0 border-zinc-200 dark:border-zinc-800 group-hover:border-cyan-500/50 transition-colors"
               :class="index % 2 !== 0 ? 'border-l-0 md:border-l' : 'border-r-0 md:border-r'"
          >
            <!-- Scanline effect overlay -->
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0IiBoZWlnaHQ9IjQiPjxyZWN0IHdpZHRoPSI0IiBoZWlnaHQ9IjEiIGZpbGw9InJnYmEoMCwyNDAsMjU1LDAuMSkiLz48L3N2Zz4=')] opacity-20 dark:opacity-50 z-10 pointer-events-none mix-blend-multiply dark:mix-blend-normal transition-opacity"></div>
            <!-- Moving scanline -->
            <div class="absolute top-0 left-0 w-full h-2 bg-cyan-400/30 dark:bg-cyan-500/20 shadow-[0_0_15px_rgba(0,240,255,0.3)] dark:shadow-[0_0_15px_rgba(0,240,255,0.5)] z-20 pointer-events-none scanline-anim transition-shadow"></div>
            
            <img v-if="project.image" :src="project.image" :alt="project.title" class="absolute inset-0 w-full h-full object-cover group-hover:scale-105 group-hover:grayscale-0 grayscale transition-all duration-700" />
            <div v-else class="text-zinc-400 dark:text-zinc-600 font-mono text-sm animate-pulse transition-colors">[Image Missing]</div>
            
            <!-- Tech Overlay Tag -->
            <div class="absolute top-4" :class="index % 2 !== 0 ? 'left-4' : 'right-4'">
              <div class="bg-white/80 dark:bg-black/80 border border-cyan-500/30 dark:border-cyan-500/50 text-cyan-600 dark:text-cyan-400 text-xs px-3 py-1 font-mono z-20 backdrop-blur-sm shadow-[0_0_10px_rgba(0,240,255,0.1)] dark:shadow-[0_0_10px_rgba(0,240,255,0.2)] flex items-center gap-2 transition-colors">
                <div class="w-1.5 h-1.5 bg-cyan-500 rounded-full animate-ping"></div>
                PROJECT_ID: {{ project.id.toString().padStart(4, '0') }}
              </div>
            </div>

            <!-- Decorative Barcode -->
            <div class="absolute bottom-4 left-4 z-20 opacity-30 dark:opacity-50 font-mono text-[8px] text-zinc-500 dark:text-zinc-400 tracking-tighter mix-blend-multiply dark:mix-blend-screen select-none pointer-events-none transition-opacity">
              ||| |||| | || |||| | | |||
            </div>
          </div>

          <!-- Content Container (50% width on desktop) -->
          <div class="w-full md:w-1/2 p-8 md:p-12 flex flex-col justify-center relative bg-white/50 dark:bg-zinc-900/50 transition-colors">
            <!-- Background Watermark -->
            <div class="absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 text-zinc-100 dark:text-zinc-800/20 font-black text-6xl md:text-8xl select-none pointer-events-none whitespace-nowrap overflow-hidden transition-colors">
              0{{ index + 1 }}
            </div>

            <div class="relative z-10">
              <div class="text-[10px] text-zinc-500 dark:text-zinc-600 font-mono mb-2 tracking-widest uppercase flex items-center gap-2 transition-colors">
                <span class="w-2 h-2 bg-zinc-300 dark:bg-zinc-700 block transition-colors"></span>
                > HASH: {{ project.title.length * 1234 }}_F{{ project.id }}
              </div>
              <h3 class="text-3xl md:text-4xl font-bold text-zinc-900 dark:text-white mb-4 group-hover:text-cyan-600 dark:group-hover:text-cyan-400 transition-colors uppercase tracking-wider glitch-hover cursor-default">
                {{ project.title }}
              </h3>
              
              <div class="w-12 h-1 bg-cyan-500 mb-6 group-hover:w-full group-hover:bg-yellow-400 transition-all duration-700 ease-in-out shadow-[0_0_10px_rgba(0,240,255,0.3)] dark:shadow-[0_0_10px_rgba(0,240,255,0.5)] group-hover:shadow-[0_0_15px_rgba(250,204,21,0.4)] dark:group-hover:shadow-[0_0_15px_rgba(250,204,21,0.6)]"></div>

              <p class="text-zinc-600 dark:text-zinc-400 mb-8 text-base md:text-lg leading-relaxed font-mono relative transition-colors">
                {{ project.description }}
                <span class="inline-block w-2 h-4 bg-zinc-400/50 dark:bg-zinc-500/50 ml-1 animate-pulse"></span>
              </p>

              <!-- Tags -->
              <div class="flex flex-wrap gap-3 mb-10">
                <span 
                  v-for="(tag, tagIndex) in project.tags" 
                  :key="tagIndex"
                  class="px-3 py-1.5 text-xs font-mono font-bold bg-zinc-100 dark:bg-zinc-950 text-zinc-600 dark:text-zinc-400 border border-zinc-200 dark:border-zinc-700 group-hover:border-cyan-500/40 group-hover:text-cyan-600 dark:group-hover:text-cyan-300 transition-colors uppercase tracking-widest shadow-sm flex items-center gap-1.5"
                >
                  <span class="text-cyan-500">></span> {{ tag }}
                </span>
              </div>

              <!-- Links -->
              <div class="flex flex-col sm:flex-row items-stretch sm:items-center gap-4">
                <a :href="project.github" class="flex-1 text-center py-3 bg-white dark:bg-black border border-zinc-300 dark:border-zinc-700 hover:border-cyan-500 dark:hover:border-cyan-500 hover:text-cyan-600 dark:hover:text-cyan-400 text-sm font-mono text-zinc-700 dark:text-zinc-300 transition-colors uppercase tracking-widest font-bold shadow-sm dark:shadow-none">
                  [ VIEW CODE ]
                </a>
                <a :href="project.live" class="flex-1 text-center py-3 bg-cyan-500 hover:bg-yellow-400 text-white dark:text-black text-sm font-mono transition-colors uppercase tracking-widest font-bold border border-cyan-500 hover:border-yellow-400 shadow-[0_0_15px_rgba(0,240,255,0.3)] hover:shadow-[0_0_20px_rgba(250,204,21,0.5)]">
                  [ LIVE DEMO ]
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
@keyframes scanline {
  0% { transform: translateY(-400px); }
  100% { transform: translateY(400px); }
}

.scanline-anim {
  animation: scanline 4s linear infinite;
}

@keyframes glitch {
  0% { text-shadow: 2px 0 0 rgba(0, 240, 255, 0.8), -2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(0); }
  20% { text-shadow: -2px 0 0 rgba(0, 240, 255, 0.8), 2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(-2px, 1px); }
  40% { text-shadow: 2px 0 0 rgba(0, 240, 255, 0.8), -2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(2px, -1px); }
  60% { text-shadow: -2px 0 0 rgba(0, 240, 255, 0.8), 2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(-2px, -1px); }
  80% { text-shadow: 2px 0 0 rgba(0, 240, 255, 0.8), -2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(2px, 1px); }
  100% { text-shadow: -2px 0 0 rgba(0, 240, 255, 0.8), 2px 0 0 rgba(255, 0, 60, 0.8); transform: translate(0); }
}

.glitch-hover:hover {
  animation: glitch 0.3s cubic-bezier(.25, .46, .45, .94) both infinite;
}
</style>
