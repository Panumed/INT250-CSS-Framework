<script setup>
import profile1 from '../assets/profile-1.jpg'
import profile2 from '../assets/profile-2.jpg'
import profile3 from '../assets/profile-3.jpg'
import bgQuotes from '../assets/bg-quotes.png'

const testimonials = [
  {
    name: 'Satish Patel',
    role: 'Founder & CEO, Huddle',
    quote: 'Fylo has improved our team productivity by an order of magnitude. Since making the switch our team has become a well-oiled collaboration machine.',
    image: profile1
  },
  {
    name: 'Bruce McKenzie',
    role: 'Founder & CEO, Huddle',
    quote: 'Fylo has improved our team productivity by an order of magnitude. Since making the switch our team has become a well-oiled collaboration machine.',
    image: profile2
  },
  {
    name: 'Iva Boyd',
    role: 'Founder & CEO, Huddle',
    quote: 'Fylo has improved our team productivity by an order of magnitude. Since making the switch our team has become a well-oiled collaboration machine.',
    image: profile3
  }
]
</script>

<template>
  <section id="testimonials" class="bg-gray-50 dark:bg-darkBlue-01 pt-12 pb-32">
    <div class="container mx-auto px-6">
      <div class="relative flex flex-col w-full space-y-6 md:flex-row md:space-y-0 md:space-x-12">
        <img :src="bgQuotes" alt="" class="absolute left-1 -top-8 w-10 md:-top-11 md:w-16 z-0" />
        
        <div v-for="t in testimonials" :key="t.name" class="flex flex-col p-10 space-y-6 rounded-lg bg-white dark:bg-darkBlue-03 shadow-lg z-10 md:w-1/3">
          <p class="text-sm leading-6">{{ t.quote }}</p>
          <div class="flex space-x-4">
            <img :src="t.image" :alt="t.name" class="w-10 h-10 rounded-full" />
            <div>
              <h5 class="text-sm font-bold font-sans">{{ t.name }}</h5>
              <p class="text-xs text-gray-400">{{ t.role }}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>