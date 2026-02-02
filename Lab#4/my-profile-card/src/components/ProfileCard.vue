<script setup>
defineProps({
  background: String,
  profileimg: String,
  name: String,
  subheading: String,
  followers: String,
  following: String,
  projects: String,
  facebook: String,
  instagram: String,
  linkedin: String
})
</script>

<template>
  <div
    class="bg-white rounded-xl shadow-lg w-64 text-center overflow-hidden
           transition transform hover:-translate-y-2 hover:shadow-2xl"
  >
    <!-- Header -->
    <div
      class="h-28 bg-cover bg-center"
      :style="{ backgroundImage: `url('${background}')` }"
    ></div>

    <!-- Avatar -->
    <img
      :src="profileimg"
      class="w-20 h-20 rounded-full mx-auto -mt-10
             border-4 border-white object-cover bg-white"
    />

    <!-- Name -->
    <div class="mt-2 px-4">
      <h2 class="font-bold text-sm">{{ name }}</h2>
      <p class="text-gray-500 text-xs">{{ subheading }}</p>
    </div>

    <!-- Social links -->
    <div class="flex justify-center gap-4 mt-3 text-xs">
      <a :href="facebook" target="_blank" class="text-blue-600 hover:underline">
        Facebook
      </a>
      <a :href="instagram" target="_blank" class="text-pink-500 hover:underline">
        Instagram
      </a>
      <a :href="linkedin" target="_blank" class="text-blue-800 hover:underline">
        LinkedIn
      </a>
    </div>

    <!-- Stats -->
    <div class="flex justify-around py-4 text-xs border-t mt-3">
      <div>
        <p class="text-gray-400">Followers</p>
        <p class="font-bold">{{ followers }}</p>
      </div>
      <div>
        <p class="text-gray-400">Following</p>
        <p class="font-bold">{{ following }}</p>
      </div>
      <div>
        <p class="text-gray-400">Projects</p>
        <p class="font-bold">{{ projects }}</p>
      </div>
    </div>
  </div>
</template>
