<script setup>
import { ref, onMounted } from 'vue'

const isDarkMode = ref(false)
const isMobileMenuOpen = ref(false)

const toggleDarkMode = () => {
  isDarkMode.value = !isDarkMode.value
  if (isDarkMode.value) {
    document.documentElement.classList.add('dark')
    localStorage.theme = 'dark'
  } else {
    document.documentElement.classList.remove('dark')
    localStorage.theme = 'light'
  }
}

onMounted(() => {
  if (localStorage.theme === 'dark' || (!('theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
    isDarkMode.value = true
    document.documentElement.classList.add('dark')
  } else {
    isDarkMode.value = false
    document.documentElement.classList.remove('dark')
  }
})

const toggleMobileMenu = () => {
  isMobileMenuOpen.value = !isMobileMenuOpen.value
}
</script>

<template>
  <nav class="bg-white border-b border-gray-100 dark:bg-slate-900 dark:border-slate-800 transition-colors duration-200 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between h-20">
        <!-- Logo Section -->
        <div class="flex items-center">
          <div class="flex-shrink-0 flex items-center gap-3">
            <div class="w-10 h-10 rounded-full bg-indigo-600 flex items-center justify-center text-white font-bold text-sm shadow-md shadow-indigo-600/20">
              LS
            </div>
            <div>
              <h1 class="text-xl font-bold text-gray-900 dark:text-white leading-tight">LearnSpace</h1>
              <p class="text-xs text-gray-500 dark:text-slate-400 font-medium">Student Dashboard</p>
            </div>
          </div>
        </div>

        <!-- Desktop Menu -->
        <div class="hidden md:flex md:items-center md:space-x-8">
          <a href="#" class="text-gray-900 dark:text-white inline-flex items-center px-1 pt-1 border-b-2 border-indigo-600 text-sm font-semibold">
            Dashboard
          </a>
          <a href="#" class="text-gray-500 dark:text-slate-400 hover:text-gray-900 dark:hover:text-white inline-flex items-center px-1 pt-1 border-b-2 border-transparent hover:border-gray-300 dark:hover:border-slate-700 text-sm font-medium transition-colors">
            Courses
          </a>
          <a href="#" class="text-gray-500 dark:text-slate-400 hover:text-gray-900 dark:hover:text-white inline-flex items-center px-1 pt-1 border-b-2 border-transparent hover:border-gray-300 dark:hover:border-slate-700 text-sm font-medium transition-colors">
            Assignments
          </a>
          <a href="#" class="text-gray-500 dark:text-slate-400 hover:text-gray-900 dark:hover:text-white inline-flex items-center px-1 pt-1 border-b-2 border-transparent hover:border-gray-300 dark:hover:border-slate-700 text-sm font-medium transition-colors">
            Progress
          </a>
        </div>

        <!-- Right Section (Dark Mode & Profile) -->
        <div class="hidden md:flex md:items-center md:gap-4">
          <!-- Dark Mode Toggle -->
          <button @click="toggleDarkMode" class="p-2 rounded-full text-gray-500 dark:text-slate-400 hover:bg-gray-100 dark:hover:bg-slate-800 focus:outline-none transition-colors">
            <svg v-if="!isDarkMode" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z" />
            </svg>
            <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />
            </svg>
          </button>
          
          <!-- User Profile -->
          <div class="flex items-center gap-2 px-3 py-1.5 border border-gray-200 dark:border-slate-700 rounded-full cursor-pointer hover:bg-gray-50 dark:hover:bg-slate-800 transition-colors">
            <div class="w-8 h-8 rounded-full bg-indigo-100 dark:bg-indigo-900/50 flex items-center justify-center text-indigo-700 dark:text-indigo-300 font-bold text-xs">
              ST
            </div>
            <span class="text-sm font-semibold text-gray-700 dark:text-slate-200">Student</span>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" class="w-4 h-4 text-gray-500 dark:text-slate-400">
              <path fill-rule="evenodd" d="M5.22 8.22a.75.75 0 0 1 1.06 0L10 11.94l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 9.28a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd" />
            </svg>
          </div>
        </div>

        <!-- Mobile menu button -->
        <div class="flex items-center md:hidden gap-4">
          <button @click="toggleDarkMode" class="p-2 rounded-full text-gray-500 dark:text-slate-400 hover:bg-gray-100 dark:hover:bg-slate-800 focus:outline-none transition-colors">
            <svg v-if="!isDarkMode" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M21.752 15.002A9.72 9.72 0 0 1 18 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 0 0 3 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 0 0 9.002-5.998Z" />
            </svg>
            <svg v-else xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 3v2.25m6.364.386-1.591 1.591M21 12h-2.25m-.386 6.364-1.591-1.591M12 18.75V21m-4.773-4.227-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0Z" />
            </svg>
          </button>
          
          <button @click="toggleMobileMenu" class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-gray-500 hover:bg-gray-100 dark:hover:bg-slate-800 dark:hover:text-white focus:outline-none focus:ring-2 focus:ring-inset focus:ring-indigo-500 transition-colors" aria-expanded="false">
            <span class="sr-only">Open main menu</span>
            <svg v-if="!isMobileMenuOpen" class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
            </svg>
            <svg v-else class="block h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>
        </div>
      </div>
    </div>

    <!-- Mobile Menu -->
    <div v-show="isMobileMenuOpen" class="md:hidden border-t border-gray-100 dark:border-slate-800 bg-white dark:bg-slate-900">
      <div class="pt-2 pb-3 space-y-1">
        <a href="#" class="bg-indigo-50 dark:bg-indigo-900/20 border-indigo-500 text-indigo-700 dark:text-indigo-400 block pl-3 pr-4 py-2 border-l-4 text-base font-medium">Dashboard</a>
        <a href="#" class="border-transparent text-gray-500 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800 hover:border-gray-300 dark:hover:border-slate-600 hover:text-gray-700 dark:hover:text-white block pl-3 pr-4 py-2 border-l-4 text-base font-medium transition-colors">Courses</a>
        <a href="#" class="border-transparent text-gray-500 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800 hover:border-gray-300 dark:hover:border-slate-600 hover:text-gray-700 dark:hover:text-white block pl-3 pr-4 py-2 border-l-4 text-base font-medium transition-colors">Assignments</a>
        <a href="#" class="border-transparent text-gray-500 dark:text-slate-400 hover:bg-gray-50 dark:hover:bg-slate-800 hover:border-gray-300 dark:hover:border-slate-600 hover:text-gray-700 dark:hover:text-white block pl-3 pr-4 py-2 border-l-4 text-base font-medium transition-colors">Progress</a>
      </div>
      <div class="pt-4 pb-3 border-t border-gray-200 dark:border-slate-800">
        <div class="flex items-center px-4">
          <div class="flex-shrink-0">
            <div class="w-10 h-10 rounded-full bg-indigo-100 dark:bg-indigo-900/50 flex items-center justify-center text-indigo-700 dark:text-indigo-300 font-bold text-sm">
              ST
            </div>
          </div>
          <div class="ml-3">
            <div class="text-base font-medium text-gray-800 dark:text-white">Student User</div>
            <div class="text-sm font-medium text-gray-500 dark:text-slate-400">student@learnspace.com</div>
          </div>
        </div>
      </div>
    </div>
  </nav>
</template>
