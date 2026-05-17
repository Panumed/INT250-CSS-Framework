<script setup>
// Theme Toggle Logic
import { ref, onMounted } from "vue";

// Reactive variable to track if dark mode is active
const isDark = ref(false);

// Function to apply the selected theme
function applyTheme(value) {
  // Update the reactive variable
  isDark.value = value;
  // Toggle the "dark" class on the root element
  document.documentElement.classList.toggle("dark", value);
  // Save the user's preference in localStorage
  localStorage.setItem("color-theme", value ? "dark" : "light");
}

// On component mount, check for saved theme preference or system preference
// This ensures the theme is applied correctly when the user revisits the site
// The logic checks for a saved theme in localStorage. If none is found, it checks the system's color scheme preference.
// If the saved theme is "dark" or if there is no saved theme but the system prefers dark mode, it applies the dark theme. Otherwise, it defaults to light mode.
// The use of onMounted ensures that this logic runs after the component is mounted, allowing it to access the DOM and apply the theme correctly.
// The theme is applied by toggling the "dark" class on the root element, which allows Tailwind CSS to apply the appropriate styles based on the presence of this class.
// This approach ensures that the user's theme preference is respected and provides a seamless experience when switching between themes.
onMounted(() => {
  // Check for saved theme in localStorage
  const savedTheme = localStorage.getItem("color-theme");

  // Determine if dark mode should be used based on saved preference or system preference
  const shouldUseDark =
    savedTheme === "dark" ||
    (savedTheme === null &&
      window.matchMedia("(prefers-color-scheme: dark)").matches);
  // Apply the determined theme
  applyTheme(shouldUseDark);
});

// Function to toggle the theme when the button is clicked
function toggleTheme() {
  // Toggle the theme by applying the opposite of the current theme
  applyTheme(!isDark.value);
}
</script>

<template>
  <!-- Header -->
  <header class="container mx-auto pt-10 px-6 text-center h-40 md:h-20">
    <!-- Dynamic Logo -->
    <div
      class="bg-logo-light-mode dark:bg-logo-dark-mode bg-no-repeat h-20 w-48 mx-auto md:mx-0 md:absolute top-10 left-10"
    ></div>
    <!-- Menu -->
    <div
      class="flex items-center justify-center space-x-4 md:space-x-10 md:absolute top-12 right-10"
    >
      <a href="#features" class="hover:text-accent-cyan">Features</a>
      <a href="#faq" class="hover:text-accent-cyan">FAQs</a>
      <a href="#testimonials" class="hover:text-accent-cyan">Testimonials</a>

      <!-- Dark/Light Mode Button -->
      <button
        id="theme-toggle"
        class="text-gray-500 dark:text-gray-400 hover:bg-gray-100 dark:hover:bg-gray-700 focus:outline-none focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 rounded-lg text-sm p-2.5"
        @click="toggleTheme"
      >
        <!-- Dark SVG Icon -->
        <svg
          v-if="!isDark"
          id="theme-toggle-dark-icon"
          class="w-5 h-5"
          fill="currentColor"
          viewBox="0 0 20 20"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"
          ></path>
        </svg>
        <!-- Light SVG Icon -->
        <svg
          v-if="isDark"
          id="theme-toggle-light-icon"
          class="w-5 h-5"
          fill="currentColor"
          viewBox="0 0 20 20"
          xmlns="http://www.w3.org/2000/svg"
        >
          <path
            d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
            fill-rule="evenodd"
            clip-rule="evenodd"
          ></path>
        </svg>
      </button>
    </div>
  </header>
</template>

<style scoped></style>
