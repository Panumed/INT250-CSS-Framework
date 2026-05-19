<script setup></script>

<template>
  <section
    id="home"
    class="relative min-h-screen flex items-center justify-center overflow-hidden bg-zinc-50 dark:bg-zinc-950 transition-colors duration-300"
  >
    <!-- Cyberpunk Grid Background -->
    <div class="absolute inset-0 z-0 opacity-10 dark:opacity-20 transition-opacity" style="background-image: linear-gradient(to right, #00f0ff 1px, transparent 1px), linear-gradient(to bottom, #00f0ff 1px, transparent 1px); background-size: 50px 50px;">
    </div>
    
    <!-- Neon Vignette -->
    <div class="absolute inset-0 z-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-transparent via-zinc-50/80 dark:via-zinc-950/80 to-zinc-50 dark:to-zinc-950 transition-colors duration-300"></div>

    <!-- Decorative HUD Elements -->
    <div class="absolute top-24 left-12 text-cyan-600/50 dark:text-cyan-500/30 font-mono text-xs hidden md:block transition-colors">
      <div class="mb-1">LOCATION: Bangkok, TH</div>
      <div class="mb-1">STATUS: <span class="animate-pulse">ONLINE</span></div>
    </div>
    
    <div class="absolute bottom-24 right-12 text-yellow-600/50 dark:text-yellow-500/30 font-mono text-xs text-right hidden md:block transition-colors">
      <div class="flex justify-end gap-1 mb-2">
        <div class="w-1 h-4 bg-yellow-500/50"></div>
        <div class="w-1 h-6 bg-yellow-500/80"></div>
        <div class="w-1 h-3 bg-yellow-500/40"></div>
        <div class="w-1 h-5 bg-yellow-500/60"></div>
        <div class="w-1 h-8 bg-yellow-500"></div>
      </div>
      <div>CONNECTION SECURE</div>
    </div>

    <!-- Rotating Crosshair -->
    <div class="absolute top-1/2 right-32 w-32 h-32 border border-dashed border-cyan-500/20 rounded-full animate-[spin_10s_linear_infinite] hidden lg:block pointer-events-none"></div>
    <div class="absolute top-1/2 right-32 w-16 h-16 border border-zinc-300 dark:border-zinc-800 rounded-full animate-[spin_5s_linear_infinite_reverse] hidden lg:block pointer-events-none transform -translate-x-8 -translate-y-8 transition-colors"></div>

    <div
      class="container mx-auto px-6 relative z-10 text-center flex flex-col items-center"
    >
      <div class="inline-block border border-cyan-500/30 bg-cyan-50 dark:bg-cyan-500/10 px-4 py-1 mb-6 text-cyan-600 dark:text-cyan-400 text-sm tracking-widest uppercase flex items-center gap-2 transition-colors">
        <div class="w-2 h-2 bg-cyan-500 dark:bg-cyan-400 rounded-full animate-ping"></div>
        WELCOME
      </div>
      
      <h1
        class="text-5xl md:text-8xl font-black tracking-tighter text-zinc-900 dark:text-white mb-6 uppercase relative glitch-container group cursor-default transition-colors"
        style="text-shadow: 3px 3px 0px rgba(0,240,255,0.5), -3px -3px 0px rgba(255,0,60,0.5);"
      >
        <span class="text-zinc-400 dark:text-zinc-500 text-xl md:text-3xl absolute -top-8 left-0 transition-colors">Hi, I'm</span>
        <span class="text-cyan-600 dark:text-cyan-400 group-hover:text-zinc-900 dark:group-hover:text-white transition-colors duration-300">Panumed</span>
        <span class="inline-block w-4 md:w-8 h-10 md:h-20 bg-yellow-400 ml-2 md:ml-4 animate-pulse align-middle"></span>
      </h1>
      <h2
        class="text-2xl md:text-3xl font-bold text-zinc-600 dark:text-zinc-400 mb-8 uppercase tracking-widest border-y border-zinc-200 dark:border-zinc-800 py-3 w-full max-w-md mx-auto relative overflow-hidden transition-colors"
      >
        <div class="absolute top-0 left-0 w-full h-full bg-cyan-500/5 -translate-x-full hover:translate-x-full transition-transform duration-1000 ease-in-out z-0"></div>
        <span class="relative z-10"><span class="text-yellow-500 dark:text-yellow-400 mr-2 transition-colors">///</span> Student of KMUTT</span>
      </h2>
      <p
        class="max-w-2xl text-lg text-zinc-600 dark:text-zinc-400 mb-12 leading-relaxed font-mono relative bg-white/80 dark:bg-black/50 p-6 border border-zinc-200 dark:border-zinc-800/50 backdrop-blur-sm transition-colors"
      >
        <span class="absolute top-0 left-0 w-2 h-2 border-t border-l border-cyan-500"></span>
        <span class="absolute bottom-0 right-0 w-2 h-2 border-b border-r border-cyan-500"></span>
        > I am a KMUTT student with a strong passion for programming and software development. This website serves as a portfolio to showcase and document the projects I have worked on.
      </p>

      <div class="flex flex-col sm:flex-row gap-6 w-full sm:w-auto">
        <a
          href="#projects"
          class="relative px-10 py-4 bg-cyan-500 text-white dark:text-black font-black uppercase tracking-widest hover:bg-yellow-400 dark:hover:bg-yellow-400 hover:text-zinc-900 transition-colors duration-300 group overflow-hidden w-full sm:w-auto flex justify-center items-center shadow-[0_0_15px_rgba(0,240,255,0.3)] hover:shadow-[0_0_20px_rgba(250,204,21,0.5)]"
        >
          <span class="absolute inset-0 w-full h-full border-2 border-cyan-400 top-1.5 left-1.5 group-hover:top-0 group-hover:left-0 transition-all duration-300 -z-10 group-hover:border-yellow-400"></span>
          <span class="mr-2 group-hover:animate-pulse">></span> View Projects
        </a>
        <a
          href="#contact"
          class="relative px-10 py-4 border border-zinc-300 dark:border-zinc-700 text-zinc-700 dark:text-zinc-300 font-bold uppercase tracking-widest hover:border-yellow-500 dark:hover:border-yellow-400 hover:text-yellow-600 dark:hover:text-yellow-400 transition-colors duration-300 w-full sm:w-auto bg-white/50 dark:bg-black/50 backdrop-blur-sm"
        >
          Contact Me
        </a>
      </div>
    </div>
  </section>
</template>

<style scoped>
@keyframes glitch-anim {
  0% { transform: translate(0); text-shadow: 3px 3px 0px rgba(0,240,255,0.5), -3px -3px 0px rgba(255,0,60,0.5); }
  20% { transform: translate(-3px, 2px); text-shadow: -3px 0px 0px rgba(0,240,255,0.5), 3px -2px 0px rgba(255,0,60,0.5); }
  40% { transform: translate(3px, -2px); text-shadow: 3px 0px 0px rgba(0,240,255,0.5), -3px 2px 0px rgba(255,0,60,0.5); }
  60% { transform: translate(-3px, -2px); text-shadow: -3px 0px 0px rgba(0,240,255,0.5), 3px 2px 0px rgba(255,0,60,0.5); }
  80% { transform: translate(3px, 2px); text-shadow: 3px 0px 0px rgba(0,240,255,0.5), -3px -2px 0px rgba(255,0,60,0.5); }
  100% { transform: translate(0); text-shadow: 3px 3px 0px rgba(0,240,255,0.5), -3px -3px 0px rgba(255,0,60,0.5); }
}

.glitch-container:hover .text-cyan-400 {
  animation: glitch-anim 0.2s cubic-bezier(.25, .46, .45, .94) both infinite;
}
</style>

<style scoped>
/* Removed old blob animations */
</style>
