<template>
  <footer class="bg-gray-100 dark:bg-darkBlue-02 text-gray-800 dark:text-white pt-32 pb-10 mt-[-10rem]">
    <div class="container mx-auto px-6 md:px-12 pt-16">

      <!-- Content -->
      <div class="flex flex-col md:flex-row w-full mt-4">
        
        <!-- Contact Info -->
        <div class="flex flex-col space-y-4 mb-10 md:mb-0 md:w-[35%] text-sm">
          <div class="flex items-center space-x-4">
            <img src="../assets/icon-phone.svg" alt="Phone" class="w-4 dark:brightness-200 invert dark:invert-0" />
            <p>1-543-123-4567</p>
          </div>
          <div class="flex items-center space-x-4">
            <img src="../assets/icon-email.svg" alt="Email" class="w-4 dark:brightness-200 invert dark:invert-0" />
            <p>example@fylo.com</p>
          </div>
        </div>

        <!-- Links 1 -->
        <div class="flex flex-col space-y-4 mb-10 md:mb-0 md:w-[20%] text-sm">
          <a href="#" class="hover:text-accent-cyan transition-colors">About</a>
          <a href="#" class="hover:text-accent-cyan transition-colors">Jobs</a>
          <a href="#" class="hover:text-accent-cyan transition-colors">Press</a>
          <a href="#" class="hover:text-accent-cyan transition-colors">Blog</a>
        </div>

        <!-- Links 2 -->
        <div class="flex flex-col space-y-4 mb-10 md:mb-0 md:w-[20%] text-sm">
          <a href="#" class="hover:text-accent-cyan transition-colors">Contact Us</a>
          <a href="#" class="hover:text-accent-cyan transition-colors">Terms</a>
          <a href="#" class="hover:text-accent-cyan transition-colors">Privacy</a>
        </div>

        <!-- Socials -->
        <div class="flex md:justify-end space-x-4 md:w-[25%] mt-2 md:mt-0">
          <a href="#" class="flex items-center justify-center w-8 h-8 rounded-full border border-gray-800 dark:border-white hover:text-accent-cyan dark:hover:border-accent-cyan hover:border-accent-cyan transition-colors group">
            <svg class="w-3.5 h-3.5 fill-current group-hover:fill-accent-cyan" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10v4h3v7h4v-7h3l1 -4h-4v-2a1 1 0 0 1 1 -1h3v-4h-3a5 5 0 0 0 -5 5v2h-3" /></svg>
          </a>
          <a href="#" class="flex items-center justify-center w-8 h-8 rounded-full border border-gray-800 dark:border-white hover:text-accent-cyan dark:hover:border-accent-cyan hover:border-accent-cyan transition-colors group">
            <svg class="w-4 h-4 fill-current group-hover:fill-accent-cyan" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M22 4.01c-1 .49 -1.98 .689 -3 .99c-1.121 -1.265 -2.783 -1.335 -4.38 -.737s-2.643 2.06 -2.62 3.737v1c-3.245 .083 -6.135 -1.395 -8 -4c0 0 -4.182 7.433 4 11c-1.872 1.247 -3.739 2.088 -6 2c3.308 1.803 6.913 2.423 10.034 1.517c3.58 -1.04 6.522 -3.723 7.651 -7.742a13.84 13.84 0 0 0 .497 -3.753c-.002 -.249 1.51 -2.772 1.818 -4.013z" /></svg>
          </a>
          <a href="#" class="flex items-center justify-center w-8 h-8 rounded-full border border-gray-800 dark:border-white hover:text-accent-cyan dark:hover:border-accent-cyan hover:border-accent-cyan transition-colors group">
            <svg class="w-4 h-4 stroke-current fill-transparent group-hover:stroke-accent-cyan" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><rect x="4" y="4" width="16" height="16" rx="4" /><circle cx="12" cy="12" r="3" /><line x1="16.5" y1="7.5" x2="16.5" y2="7.501" /></svg>
          </a>
        </div>
      </div>
    </div>
  </footer>
</template>