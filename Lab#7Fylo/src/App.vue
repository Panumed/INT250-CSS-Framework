<script setup>
import NavBar from './components/NavBar.vue'
import Hero from './components/Hero.vue'
import Features from './components/Features.vue'
import Productive from './components/Productive.vue'
import FAQ from './components/FAQ.vue'
import Testimonial from './components/Testimonial.vue'
import EarlyAccess from './components/EarlyAccess.vue'
import Footer from './components/Footer.vue'
</script>

<template>
  <div class="font-opensans bg-white dark:bg-darkBlue dark:text-white text-gray-800 min-h-screen">
    <NavBar />
    <Hero />
    <Features />
    <Productive />
    <FAQ />
    <Testimonial />
    <EarlyAccess />
    <Footer />
  </div>
</template>

<style scoped></style>
