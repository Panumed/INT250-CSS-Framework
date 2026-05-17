<script setup>
import { computed } from 'vue'

const props = defineProps({
  course: {
    type: Object,
    required: true,
    // Expected structure: { id, code, title, description, progress, status }
  }
})

const emit = defineEmits(['view-details', 'submit-assignment'])

const progressStyle = computed(() => {
  return { width: `${props.course.progress}%` }
})
</script>

<template>
  <div class="bg-white dark:bg-slate-800 rounded-2xl shadow-sm border border-gray-100 dark:border-slate-700 p-6 flex flex-col h-full transition-all duration-200 hover:shadow-md">
    
    <!-- Header: Code & Status -->
    <div class="flex justify-between items-start mb-4">
      <span class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-indigo-50 dark:bg-indigo-900/30 text-indigo-600 dark:text-indigo-400">
        {{ course.code }}
      </span>
      <span v-if="course.status === 'In Progress'" class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-amber-50 dark:bg-amber-900/30 text-amber-600 dark:text-amber-400">
        {{ course.status }}
      </span>
      <span v-else-if="course.status === 'Completed'" class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-green-50 dark:bg-green-900/30 text-green-600 dark:text-green-400">
        {{ course.status }}
      </span>
      <span v-else class="inline-flex items-center px-2.5 py-1 rounded-full text-xs font-semibold bg-gray-50 dark:bg-gray-800 text-gray-600 dark:text-gray-400">
        {{ course.status }}
      </span>
    </div>

    <!-- Title & Description -->
    <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-3">{{ course.title }}</h3>
    <p class="text-sm text-gray-500 dark:text-slate-400 mb-6 flex-grow">{{ course.description }}</p>

    <!-- Progress Bar -->
    <div class="mb-6 mt-auto">
      <div class="flex justify-between items-center mb-2">
        <span class="text-sm font-medium text-gray-500 dark:text-slate-400">Progress</span>
        <span class="text-sm font-bold text-gray-900 dark:text-white">{{ course.progress }}%</span>
      </div>
      <div class="w-full bg-gray-100 dark:bg-slate-700 rounded-full h-2.5">
        <div class="bg-indigo-600 h-2.5 rounded-full" :style="progressStyle"></div>
      </div>
    </div>

    <!-- Actions -->
    <div class="flex flex-col sm:flex-row gap-3">
      <button 
        @click="emit('view-details', course)"
        class="inline-flex justify-center items-center px-4 py-2 border border-transparent text-sm font-medium rounded-lg shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors"
      >
        View Course Details
      </button>
      <button 
        @click="emit('submit-assignment', course)"
        class="inline-flex justify-center items-center px-4 py-2 border border-gray-300 dark:border-slate-600 text-sm font-medium rounded-lg text-gray-700 dark:text-slate-300 bg-white dark:bg-slate-800 hover:bg-gray-50 dark:hover:bg-slate-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 transition-colors"
      >
        Submit Assignment
      </button>
    </div>
  </div>
</template>
