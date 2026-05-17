<script setup>
import accessAnywhere from '../assets/icon-access-anywhere.svg'
import security from '../assets/icon-security.svg'
import collaboration from '../assets/icon-collaboration.svg'
import anyFile from '../assets/icon-any-file.svg'

const features = [
  {
    icon: accessAnywhere,
    title: 'Access your files, anywhere',
    description: 'The ability to use a smartphone, tablet, or computer to access your account means your files follow you everywhere.'
  },
  {
    icon: security,
    title: 'Security you can trust',
    description: '2-factor authentication and user-controlled encryption are just a couple of the security features we allow to help secure your files.'
  },
  {
    icon: collaboration,
    title: 'Real-time collaboration',
    description: 'Securely share files and folders with friends, family and colleagues for live collaboration. No email attachments required.'
  },
  {
    icon: anyFile,
    title: 'Store any type of file',
    description: 'Whether you\'re sharing holidays photos or work documents, Fylo has you covered allowing for all file types to be securely stored and shared.'
  }
]
</script>

<template>
  <section id="features" class="features-section">
    <div class="features-container">
      <div class="features-grid mt-10">
        <div v-for="feature in features" :key="feature.title" class="feature-card">
          <div class="feature-icon-wrapper">
            <img :src="feature.icon" :alt="feature.title" class="object-contain h-full" />
          </div>
          <h3 class="feature-title font-sans">{{ feature.title }}</h3>
          <p class="feature-description text-sm">{{ feature.description }}</p>
        </div>
      </div>
    </div>
  </section>
</template>