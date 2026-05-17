<script setup>
defineProps({
  title: {
    type: String,
    required: true
  },
  value: {
    type: [String, Number],
    required: true
  }
})
</script>

<template>
  <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-700 p-6 transition-all duration-200 hover:shadow-md">
    <h3 class="text-sm font-medium text-gray-500 dark:text-slate-400 mb-2">{{ title }}</h3>
    <p class="text-3xl font-bold text-gray-900 dark:text-white">{{ value }}</p>
  </div>
</template>
