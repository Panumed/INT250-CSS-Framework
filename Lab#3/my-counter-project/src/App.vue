<script setup>
import Counter from './components/Counter.vue'
</script>

<template>
  <div class="page">
    <Counter />
  </div>
</template>

<style scoped>
.page {
  min-height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  background: linear-gradient(135deg, #60a5fa, #34d399);
}
</style>
