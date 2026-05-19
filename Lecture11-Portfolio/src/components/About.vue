<script setup>
const skills = [
  {
    name: "HTML",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/html5/html5-original.svg",
  },
  {
    name: "CSS",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/css3/css3-original.svg",
  },
  {
    name: "JS",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/javascript/javascript-original.svg",
  },
  {
    name: "VUE",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/vuejs/vuejs-original.svg",
  },
  {
    name: "NODE",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/nodejs/nodejs-original-wordmark.svg",
  },
  {
    name: "REACT",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/react/react-original.svg",
  },
  {
    name: "TAILWIND",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/tailwindcss/tailwindcss-original.svg",
  },
  {
    name: "GIT/GITHUB",
    icon: "https://cdn.jsdelivr.net/gh/devicons/devicon@latest/icons/git/git-original.svg",
  },
];
</script>

<template>
  <section
    id="about"
    class="py-24 bg-zinc-50 dark:bg-zinc-950 border-t border-zinc-200 dark:border-zinc-900 relative transition-colors duration-300"
  >
    <div class="absolute top-20 left-10 text-zinc-200 dark:text-zinc-800 font-mono text-6xl opacity-40 dark:opacity-20 pointer-events-none select-none transition-colors">
      02_ABOUT
    </div>
    <div class="container mx-auto px-6 md:px-12 relative z-10">
      <!-- Section Title -->
      <div class="mb-16">
        <div class="flex items-center gap-4 mb-4">
          <div class="w-12 h-1 bg-yellow-500 dark:bg-yellow-400"></div>
          <h2 class="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white uppercase tracking-wider transition-colors">
            About <span class="text-cyan-600 dark:text-cyan-400">Me</span>
          </h2>
        </div>
        <p class="text-zinc-500 font-mono">> Loading profile data...</p>
      </div>

      <div class="flex flex-col md:flex-row items-center gap-12">
        <!-- Profile Image Placeholder -->
        <div class="w-full md:w-5/12 flex justify-center">
          <div class="relative w-64 h-64 md:w-80 md:h-80 group">
            <!-- Decorative background elements -->
            <div
              class="absolute inset-0 bg-cyan-500 transform translate-x-4 translate-y-4 border border-cyan-500/50 opacity-10 dark:opacity-20 group-hover:translate-x-6 group-hover:translate-y-6 transition-transform"
            ></div>
            <div
              class="absolute inset-0 bg-white dark:bg-black border-2 border-zinc-300 dark:border-zinc-800 group-hover:border-cyan-500 dark:group-hover:border-cyan-400 z-10 flex items-center justify-center overflow-hidden transition-colors"
            >
              <!-- Scanline -->
              <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0IiBoZWlnaHQ9IjQiPjxyZWN0IHdpZHRoPSI0IiBoZWlnaHQ9IjEiIGZpbGw9InJnYmEoMCwyNDAsMjU1LDAuMSkiLz48L3N2Zz4=')] opacity-20 dark:opacity-50 z-20 pointer-events-none mix-blend-multiply dark:mix-blend-normal"></div>
              
              <!-- Profile Image -->
              <img
                src="../assets/img/profile.jpg"
                alt="Profile Picture"
                class="w-full h-full object-cover object-center grayscale group-hover:grayscale-0 transition-all duration-700"
              />
              
              <div class="absolute bottom-0 left-0 w-full bg-white/90 dark:bg-black/80 text-cyan-600 dark:text-cyan-400 font-mono text-xs p-2 text-center z-30 border-t border-cyan-500/30 dark:border-cyan-500/50 transition-colors">
                Panumed
              </div>
            </div>
          </div>
        </div>

        <!-- Bio & Skills -->
        <div class="w-full md:w-7/12 font-mono">
          <h3
            class="text-2xl font-bold text-zinc-900 dark:text-white mb-4 uppercase tracking-wider transition-colors"
          >
            > Hello! I'm Panumed Ratthnaphokhin (Ty)
          </h3>
          <div class="bg-white/50 dark:bg-zinc-900/50 border-l-4 border-cyan-500 p-4 mb-8 text-zinc-600 dark:text-zinc-400 text-sm md:text-base leading-relaxed border border-transparent dark:border-transparent transition-colors shadow-sm dark:shadow-none">
            <p class="mb-4">
              I'm a 20-year-old second-year student at King Mongkut's University
              of Technology Thonburi (KMUTT).
            </p>
            <p>
              I'm currently interested in programming, especially web development,
              and enjoy building websites and applications. I'm also open to
              freelance or collaborative opportunities to gain experience and grow
              as a developer.
            </p>
          </div>

          <!-- Skills Grid -->
          <div class="mb-4 text-cyan-600 dark:text-cyan-400 text-sm font-bold tracking-widest uppercase flex items-center gap-2 transition-colors">
            <div class="w-2 h-2 bg-yellow-500 dark:bg-yellow-400 animate-pulse"></div>
            > MY_SKILLS:
            <div class="flex-1 border-t border-dashed border-cyan-500/30 ml-2"></div>
          </div>
          <div class="grid grid-cols-2 sm:grid-cols-4 gap-3 relative">
            <!-- Decorative tech background for skills -->
            <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0IiBoZWlnaHQ9IjQiPjxyZWN0IHdpZHRoPSI0IiBoZWlnaHQ9IjEiIGZpbGw9InJnYmEoMCwyNDAsMjU1LDAuMSkiLz48L3N2Zz4=')] opacity-5 dark:opacity-10 pointer-events-none mix-blend-multiply dark:mix-blend-normal"></div>

            <div
              v-for="skill in skills"
              :key="skill.name"
              class="flex flex-col items-center justify-center gap-2 p-4 bg-white/80 dark:bg-black/80 border border-zinc-200 dark:border-zinc-800 hover:border-cyan-500 dark:hover:border-cyan-400 hover:bg-cyan-50 dark:hover:bg-cyan-500/5 transition-all duration-300 group relative overflow-hidden"
            >
              <!-- Scanline hover -->
              <div class="absolute top-0 left-0 w-full h-1 bg-cyan-400/30 dark:bg-cyan-400/50 -translate-y-full group-hover:translate-y-[1000%] transition-transform duration-1000 ease-linear"></div>
              
              <div
                class="flex-shrink-0 w-8 h-8 transition-transform duration-500 group-hover:scale-110 grayscale group-hover:grayscale-0 drop-shadow-[0_0_8px_rgba(0,255,255,0)] group-hover:drop-shadow-[0_0_8px_rgba(0,255,255,0.5)]"
              >
                <img :src="skill.icon" :alt="skill.name" class="w-full h-full object-contain" />
              </div>
              <span
                class="text-xs font-bold text-zinc-500 group-hover:text-cyan-600 dark:group-hover:text-cyan-400 uppercase tracking-wider transition-colors"
                >{{ skill.name }}</span
              >
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>
