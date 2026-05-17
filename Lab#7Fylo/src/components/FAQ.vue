<script setup>
import { ref } from 'vue'

const faqs = ref([
  {
    question: 'How does Fylo work?',
    answer: 'Fylo is a cloud storage service that allows you to store your files securely and access them from anywhere.',
    isOpen: false
  },
  {
    question: 'Is my data secure with Fylo?',
    answer: 'Yes, we use 2-factor authentication and user-controlled encryption to ensure your files are safe.',
    isOpen: false
  },
  {
    question: 'Can I share files with others?',
    answer: 'Absolutely! You can securely share files and folders with friends, family, and colleagues for live collaboration.',
    isOpen: false
  }
])

const toggleFaq = (index) => {
  faqs.value[index].isOpen = !faqs.value[index].isOpen
}
</script>

<template>
  <section id="faq" class="bg-gray-50 dark:bg-darkBlue-01 pt-12 pb-24">
    <div class="container mx-auto px-6 md:max-w-3xl">
      <h2 class="text-3xl font-bold text-center mb-10 font-sans">Frequently Asked Questions</h2>
      <div class="space-y-4">
        <div v-for="(faq, index) in faqs" :key="index" class="border border-gray-300 dark:border-gray-700 rounded-lg overflow-hidden">
          <button 
            @click="toggleFaq(index)" 
            class="w-full flex justify-between items-center p-5 bg-white dark:bg-darkBlue-02 hover:bg-gray-100 dark:hover:bg-darkBlue-03 transition-colors focus:outline-none"
          >
            <span class="font-bold text-left">{{ faq.question }}</span>
            <svg class="w-5 h-5 transform transition-transform" :class="{'rotate-180': faq.isOpen}" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7"></path></svg>
          </button>
          <div v-show="faq.isOpen" class="p-5 bg-white dark:bg-darkBlue-02 border-t border-gray-300 dark:border-gray-700">
            <p class="text-sm">{{ faq.answer }}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>