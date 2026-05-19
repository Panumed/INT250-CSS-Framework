<script setup>
import { ref, onMounted } from 'vue';
import Navbar from './components/Navbar.vue';
import Hero from './components/Hero.vue';
import About from './components/About.vue';
import Projects from './components/Projects.vue';
import Experience from './components/Experience.vue';
import Contact from './components/Contact.vue';
import Footer from './components/Footer.vue';

const isDark = ref(false);

const toggleDarkMode = () => {
  isDark.value = !isDark.value;
  updateTheme();
};

const updateTheme = () => {
  if (isDark.value) {
    document.documentElement.classList.add('dark');
    localStorage.setItem('theme', 'dark');
  } else {
    document.documentElement.classList.remove('dark');
    localStorage.setItem('theme', 'light');
  }
};

onMounted(() => {
  // Check localStorage or system preference
  const savedTheme = localStorage.getItem('theme');
  if (savedTheme === 'dark' || (!savedTheme && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    isDark.value = true;
  } else {
    isDark.value = false;
  }
  updateTheme();
});
</script>

<template>
  <div class="min-h-screen bg-white dark:bg-zinc-950 text-zinc-900 dark:text-cyan-50 transition-colors duration-300 font-mono selection:bg-cyan-500/50 selection:text-black">
    <Navbar :isDark="isDark" @toggle-dark-mode="toggleDarkMode" />
    <main>
      <Hero />
      <About />
      <Projects />
      <Experience />
      <Contact />
    </main>
    <Footer />
  </div>
</template>

<style>
/* Global styles for smooth scrolling and base text styles that might not be caught by utility classes alone */
</style>
