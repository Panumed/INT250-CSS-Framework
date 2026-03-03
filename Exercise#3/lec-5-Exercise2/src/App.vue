<script setup>
const tabs = ["Vector", "Illustrations", "Images", "Icons"]

const images = [
  "https://images.unsplash.com/photo-1529626455594-4ff0802cfb7e",
  "https://images.unsplash.com/photo-1502673530728-f79b4cab31b1",
  "https://images.unsplash.com/photo-1492724441997-5dc865305da7",
  "https://images.unsplash.com/photo-1549880338-65ddcdfd017b",
  "https://images.unsplash.com/photo-1486325212027-8081e485255e",
  "https://images.unsplash.com/photo-1500530855697-b586d89ba3ee"
]
</script>

<template>
  <div class="min-h-screen bg-white py-10">

    <!-- ✅ Container กลาง -->
    <div class="max-w-5xl mx-auto px-4">

      <!-- Tabs (ขวา แต่ไม่เกินเส้นแดง) -->
      <div class="flex justify-end mb-6">
        <div class="flex gap-6 text-sm text-black">
          <button v-for="tab in tabs" :key="tab">
            {{ tab }}
          </button>
        </div>
      </div>

      <!-- Search + Upload -->
      <div class="flex items-center mb-10">
        <div class="relative w-72">
          <input
            type="text"
            placeholder="Search"
            class="w-full border-b border-gray-300 py-2 pr-8 focus:outline-none"
          />
          <span class="absolute right-2 top-2 text-gray-400">🔍</span>
        </div>

        <button class="bg-black text-white px-6 py-2 rounded-md text-sm ml-auto">
          Upload
        </button>
      </div>

      <!-- Image Grid -->
      <div class="grid grid-cols-3 gap-6">
        <div v-for="(img, i) in images" :key="i" class="overflow-hidden rounded-md">
          <img :src="img" class="h-56 w-full object-cover 
             transition duration-300 ease-out
             hover:scale-105 hover:shadow-lg" />
        </div>
      </div>


    </div>
  </div>
</template>




<style scoped></style>
