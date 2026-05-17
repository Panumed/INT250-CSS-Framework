<script setup>
import { ref } from 'vue'
import AppNavbar from './components/AppNavbar.vue'
import StarCard from './components/StarCard.vue'
import CourseCard from './components/CourseCard.vue'
import CourseModal from './components/CourseModal.vue'
import ToastNotification from './components/ToastNotification.vue'

// Stats Data
const stats = ref([
  { id: 1, title: 'Active Courses', value: '3' },
  { id: 2, title: 'Pending Assignments', value: '2' },
  { id: 3, title: 'Completed Tasks', value: '8' },
  { id: 4, title: 'Overall Progress', value: '72%' }
])

// Courses Data
const courses = ref([
  {
    id: 1,
    code: 'INT250',
    status: 'In Progress',
    title: 'CSS Framework',
    description: 'Learn how to build responsive and interactive web applications using Vue.js and Tailwind CSS.',
    progress: 72
  },
  {
    id: 2,
    code: 'INT161',
    status: 'In Progress',
    title: 'Object-Oriented Programming',
    description: 'Practice Java programming, object-oriented design, and software development principles.',
    progress: 58
  }
])

// Modal State
const isModalOpen = ref(false)
const selectedCourse = ref(null)

const openCourseModal = (course) => {
  selectedCourse.value = course
  isModalOpen.value = true
}

const closeCourseModal = () => {
  isModalOpen.value = false
  setTimeout(() => {
    selectedCourse.value = null
  }, 300) // Clear after animation
}

// Toast State
const isToastOpen = ref(false)
const toastMessage = ref('')
let toastTimeout = null

const showToast = (message) => {
  toastMessage.value = message
  isToastOpen.value = true
  
  if (toastTimeout) clearTimeout(toastTimeout)
  
  toastTimeout = setTimeout(() => {
    isToastOpen.value = false
  }, 3000)
}

const handleAssignmentSubmit = (course) => {
  showToast(`Assignment submitted for ${course.code}`)
}
</script>

<template>
  <div class="min-h-screen bg-slate-50 dark:bg-slate-900 transition-colors duration-200 flex flex-col font-sans">
    <AppNavbar />

    <main class="flex-grow">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8 space-y-8">
        
        <!-- Hero Section -->
        <section class="bg-gradient-to-r from-indigo-500 to-purple-600 rounded-3xl p-8 sm:p-12 text-white shadow-lg overflow-hidden relative">
          <!-- Optional background decorative elements can go here -->
          <div class="relative z-10">
            <p class="text-indigo-100 mb-2 font-medium">Welcome back, Student 👋</p>
            <h2 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4">Continue your learning journey today.</h2>
            <p class="text-indigo-100 mb-8 max-w-2xl text-sm sm:text-base">Track your courses, review assignments, and monitor your learning progress in one place.</p>
            <button class="bg-white text-indigo-600 hover:bg-indigo-50 px-6 py-3 rounded-full font-semibold transition-colors shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-offset-indigo-600 focus:ring-white">
              View My Courses
            </button>
          </div>
        </section>

        <!-- Stats Section -->
        <section>
          <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <StarCard 
              v-for="stat in stats" 
              :key="stat.id" 
              :title="stat.title" 
              :value="stat.value" 
            />
          </div>
        </section>

        <!-- Courses Section -->
        <section class="pt-4">
          <div class="mb-6">
            <h2 class="text-2xl font-bold text-gray-900 dark:text-white">My Courses</h2>
            <p class="text-gray-500 dark:text-slate-400 mt-1">Review your course progress and assignment status.</p>
          </div>
          
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
            <CourseCard 
              v-for="course in courses" 
              :key="course.id" 
              :course="course" 
              @view-details="openCourseModal"
              @submit-assignment="handleAssignmentSubmit"
            />
          </div>
        </section>

      </div>
    </main>
    
    <!-- Footer from the image -->
    <footer class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 w-full text-center sm:flex sm:justify-between sm:text-left text-xs text-gray-500 dark:text-slate-400 border-t border-gray-200 dark:border-slate-800 mt-8">
      <span>04/29/2026</span>
      <span>&copy;WONGABUT, T. - INT250 (2/2025)</span>
      <span>1</span>
    </footer>

    <!-- Modals & Toasts -->
    <CourseModal 
      :is-open="isModalOpen" 
      :course="selectedCourse" 
      @close="closeCourseModal" 
    />
    
    <ToastNotification 
      :show="isToastOpen" 
      :message="toastMessage" 
      @close="isToastOpen = false" 
    />
  </div>
</template>

<style>
/* Any additional global styles */
</style>
