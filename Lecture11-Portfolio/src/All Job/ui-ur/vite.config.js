import { fileURLToPath, URL } from 'node:url'

import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vueDevTools from 'vite-plugin-vue-devtools'
import tailwind from '@tailwindcss/vite'

// https://vite.dev/config/
export default defineConfig({
  base: './', // REQUIRED FOR FIVEM NUI TO LOAD ASSETS RELATIVE TO NUI://ROOT/
  build: {
    outDir: 'dist', // กำหนดโฟลเดอร์ที่จะได้หลังจาก build
    emptyOutDir: true,
    rollupOptions: {
      output: {
        // ปิดการสุ่มชื่อไฟล์ (hash) เพื่อให้ง่ายต่อการใส่ในไฟล์ fxmanifest.lua
        entryFileNames: `assets/[name].js`,
        chunkFileNames: `assets/[name].js`,
        assetFileNames: `assets/[name].[ext]`
      }
    }
  },
  plugins: [
    vue(),
    vueDevTools(),
    tailwind(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url))
    },
  },
})
