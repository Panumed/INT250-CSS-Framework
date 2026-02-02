<script setup>
import { ref } from 'vue'

// state
const count = ref(0)
const step = ref(1)

// limits
const min = 0
const max = 100

// undo
const previousCount = ref(null)

const savePrevious = () => {
  previousCount.value = count.value
}

// methods
const increment = () => {
  savePrevious()
  count.value += step.value
  if (count.value > max) count.value = max
}

const decrement = () => {
  if (count.value === min) return
  savePrevious()
  count.value -= step.value
  if (count.value < min) count.value = min
}

const reset = () => {
  savePrevious()
  count.value = 0
}

const undo = () => {
  if (previousCount.value !== null) {
    count.value = previousCount.value
    previousCount.value = null
  }
}
</script>

<template>
  <div class="card">
    <h1>Counter App</h1>

    <div class="count">{{ count }}</div>

    <div class="controls">
      <button @click="increment">Increase</button>
      <button @click="decrement" :disabled="count === min">
        Decrease
      </button>
      <button class="reset" @click="reset">Reset</button>
      <button class="undo" @click="undo" :disabled="previousCount === null">
        Undo
      </button>
    </div>

    <div class="step">
      <label>Step:</label>
      <input type="number" v-model.number="step" min="1" />
    </div>
  </div>
</template>

<style scoped>
.card {
  background: #ffffff;
  padding: 2rem;
  width: 320px;
  border-radius: 12px;
  text-align: center;
  box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

h1 {
  margin-bottom: 1rem;
}

.count {
  font-size: 3rem;
  font-weight: bold;
  margin: 1rem 0;
}

.controls {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  justify-content: center;
}

button {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 6px;
  cursor: pointer;
}

button:disabled {
  opacity: 0.5;
  cursor: not-allowed;
}

.reset {
  background: #f87171;
  color: white;
}

.undo {
  background: #facc15;
}

.step {
  margin-top: 1rem;
}

input {
  margin-left: 0.5rem;
  width: 60px;
  text-align: center;
}
</style>
