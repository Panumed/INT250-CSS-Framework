<script setup>
import { ref } from 'vue';

const form = ref({
  name: '',
  email: '',
  message: ''
});

const isSubmitting = ref(false);

const submitForm = () => {
  isSubmitting.value = true;
  // Simulate form submission
  setTimeout(() => {
    isSubmitting.value = false;
    alert('Message sent successfully! (Simulated)');
    form.value = { name: '', email: '', message: '' };
  }, 1500);
};

const socials = [
  { 
    name: 'Instagram', 
    url: 'https://www.instagram.com/t.pxnme_/', 
    icon: 'M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z'
  }
];
</script>

<template>
  <section id="contact" class="py-24 bg-zinc-50 dark:bg-zinc-950 border-t border-zinc-200 dark:border-zinc-900 relative transition-colors duration-300">
    <div class="absolute top-20 left-10 text-zinc-200 dark:text-zinc-800 font-mono text-6xl opacity-40 dark:opacity-20 pointer-events-none select-none transition-colors">
      04_CONTACT
    </div>
    <div class="container mx-auto px-6 md:px-12 max-w-5xl relative z-10">
      <!-- Section Title -->
      <div class="mb-16">
        <div class="flex items-center gap-4 mb-4">
          <div class="w-12 h-1 bg-yellow-500 dark:bg-yellow-400"></div>
          <h2 class="text-3xl md:text-5xl font-black text-zinc-900 dark:text-white uppercase tracking-wider transition-colors">
            Contact <span class="text-cyan-600 dark:text-cyan-400">Me</span>
          </h2>
        </div>
        <p class="text-zinc-500 font-mono">> Get in touch...</p>
      </div>

      <div class="flex flex-col md:flex-row gap-8 font-mono">
        
        <!-- Contact Info (Terminal Style) -->
        <div class="w-full md:w-5/12 p-8 bg-white dark:bg-black border border-zinc-200 dark:border-zinc-800 relative group hover:border-cyan-500 transition-colors">
          <!-- Cyberpunk Corner Accents -->
          <div class="absolute top-0 left-0 w-4 h-4 border-t-2 border-l-2 border-cyan-500"></div>
          <div class="absolute bottom-0 right-0 w-4 h-4 border-b-2 border-r-2 border-cyan-500"></div>

          <div class="mb-8">
            <h3 class="text-xl font-bold text-zinc-900 dark:text-white mb-2 uppercase tracking-widest transition-colors">> Let's talk</h3>
            <div class="w-full h-px bg-zinc-200 dark:bg-zinc-800 mb-6 group-hover:bg-cyan-500/50 transition-colors"></div>
            <p class="text-zinc-600 dark:text-zinc-400 text-sm leading-relaxed mb-8 transition-colors">
              Have a module to deploy, a question, or just want to say hi? Fill out the form and I'll get back to you.
            </p>
            
            <div class="space-y-6">
              <div class="flex items-start gap-4">
                <span class="text-cyan-600 dark:text-cyan-500 font-bold">[E]</span>
                <div>
                  <h4 class="font-bold text-zinc-700 dark:text-zinc-300 uppercase tracking-widest text-sm mb-1 transition-colors">Email</h4>
                  <p class="text-yellow-600 dark:text-yellow-400 text-sm transition-colors">panumed2438@gmail.com</p>
                </div>
              </div>
              <div class="flex items-start gap-4">
                <span class="text-cyan-600 dark:text-cyan-500 font-bold">[P]</span>
                <div>
                  <h4 class="font-bold text-zinc-700 dark:text-zinc-300 uppercase tracking-widest text-sm mb-1 transition-colors">Phone</h4>
                  <p class="text-yellow-600 dark:text-yellow-400 text-sm transition-colors">0934369888</p>
                </div>
              </div>
            </div>
          </div>

          <div class="mt-auto border-t border-zinc-200 dark:border-zinc-800 pt-6 group-hover:border-cyan-500/50 transition-colors">
            <h4 class="font-bold text-zinc-500 text-sm mb-4 uppercase tracking-widest">> SOCIAL LINKS</h4>
            <div class="flex gap-4">
              <a 
                v-for="social in socials" 
                :key="social.name" 
                :href="social.url"
                class="w-10 h-10 bg-zinc-50 dark:bg-zinc-900 border border-zinc-200 dark:border-zinc-700 flex items-center justify-center hover:bg-cyan-50 dark:hover:bg-cyan-500 text-zinc-600 dark:text-zinc-400 hover:text-cyan-600 dark:hover:text-black hover:border-cyan-500 transition-colors duration-300"
                :aria-label="social.name"
              >
                <svg class="w-5 h-5 fill-current" viewBox="0 0 24 24">
                  <path :d="social.icon" />
                </svg>
              </a>
            </div>
          </div>
        </div>

        <!-- Contact Form -->
        <div class="w-full md:w-7/12 p-8 bg-white/50 dark:bg-zinc-900/50 border border-zinc-200 dark:border-zinc-800 relative transition-colors">
          <!-- Scanline -->
          <div class="absolute inset-0 bg-[url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI0IiBoZWlnaHQ9IjQiPjxyZWN0IHdpZHRoPSI0IiBoZWlnaHQ9IjEiIGZpbGw9InJnYmEoMCwyNDAsMjU1LDAuMSkiLz48L3N2Zz4=')] opacity-10 dark:opacity-30 pointer-events-none mix-blend-multiply dark:mix-blend-normal transition-opacity"></div>
          
          <form @submit.prevent="submitForm" class="space-y-6 relative z-10">
            <div class="grid grid-cols-1 gap-6">
              <div>
                <label for="name" class="block text-xs font-bold text-cyan-600 dark:text-cyan-400 mb-2 uppercase tracking-widest transition-colors">> Name</label>
                <input 
                  type="text" 
                  id="name" 
                  v-model="form.name"
                  required
                  class="w-full px-4 py-3 bg-white dark:bg-black border border-zinc-300 dark:border-zinc-700 text-zinc-900 dark:text-white focus:border-cyan-500 outline-none transition-colors font-mono text-sm shadow-sm dark:shadow-none"
                  placeholder="Enter name..."
                >
              </div>
              <div>
                <label for="email" class="block text-xs font-bold text-cyan-600 dark:text-cyan-400 mb-2 uppercase tracking-widest transition-colors">> Email</label>
                <input 
                  type="email" 
                  id="email" 
                  v-model="form.email"
                  required
                  class="w-full px-4 py-3 bg-white dark:bg-black border border-zinc-300 dark:border-zinc-700 text-zinc-900 dark:text-white focus:border-cyan-500 outline-none transition-colors font-mono text-sm shadow-sm dark:shadow-none"
                  placeholder="Enter email..."
                >
              </div>
              <div>
                <label for="message" class="block text-xs font-bold text-cyan-600 dark:text-cyan-400 mb-2 uppercase tracking-widest transition-colors">> Message</label>
                <textarea 
                  id="message" 
                  v-model="form.message"
                  required
                  rows="5"
                  class="w-full px-4 py-3 bg-white dark:bg-black border border-zinc-300 dark:border-zinc-700 text-zinc-900 dark:text-white focus:border-cyan-500 outline-none transition-colors resize-none font-mono text-sm shadow-sm dark:shadow-none"
                  placeholder="Write your message..."
                ></textarea>
              </div>
            </div>
            
            <button 
              type="submit" 
              :disabled="isSubmitting"
              class="w-full py-4 px-6 bg-cyan-500 text-white dark:text-black font-black uppercase tracking-widest hover:bg-yellow-400 hover:text-zinc-900 transition-colors disabled:opacity-50 disabled:cursor-not-allowed flex justify-center items-center gap-2 group relative overflow-hidden shadow-[0_0_15px_rgba(0,240,255,0.3)] hover:shadow-[0_0_20px_rgba(250,204,21,0.5)]"
            >
              <span class="absolute inset-0 w-full h-full border border-cyan-400 dark:border-black top-1 left-1 group-hover:top-0 group-hover:left-0 transition-all -z-10 group-hover:border-yellow-400"></span>
              <span v-if="!isSubmitting">[ SEND MESSAGE ]</span>
              <span v-else class="animate-pulse">[ SENDING... ]</span>
            </button>
          </form>
        </div>
      </div>
    </div>
  </section>
</template>
