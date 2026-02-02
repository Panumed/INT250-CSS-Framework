<script setup>
import ProfileCard from './components/ProfileCard.vue'
</script>

<template>
  <div
    class="min-h-screen w-screen flex items-center justify-center gap-8
           bg-gradient-to-br from-green-400 to-blue-500"
  >
    <!-- Card 1 -->
    <ProfileCard
      background="/background.jpg"
      profileimg="/profile.jpg"
      name="Panumed Ratthanaphokhin"
      followers="58k"
      following="512"
      projects="10+"
      facebook="https://www.facebook.com/Imzalonez"
      instagram="https://instagram.com"
      linkedin="https://linkedin.com"
    />

    <!-- Card 2 -->
    <ProfileCard
      background="/background.jpg"
      profileimg="/profile2.jpg"
      name="Sompong Ratthanaphokhin"
      followers="12k"
      following="320"
      projects="6"
      facebook="https://facebook.com"
      instagram="https://instagram.com"
      linkedin="https://linkedin.com"
    />

    <!-- Card 3 -->
    <ProfileCard
      background="/background.jpg"
      profileimg="/profile3.jpg"
      name="Cristiano Ronaldo"
      followers="8k"
      following="150"
      projects="4"
      facebook="https://facebook.com"
      instagram="https://instagram.com"
      linkedin="https://linkedin.com"
    />
  </div>
</template>
