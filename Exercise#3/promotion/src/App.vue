<script setup>
const plans = [
  {
    name: "BASIC",
    storage: "100GB",
    price: "$1.99/month",
    highlight: false,
    features: [
      "100 GB storage",
      "Option to add members",
      "Extra member benefits"
    ]
  },
  {
    name: "STANDARD",
    storage: "200GB",
    price: "$3.99/month",
    highlight: true,
    features: [
      "200 GB storage",
      "Option to add members",
      "Extra member benefits"
    ]
  },
  {
    name: "PREMIUM",
    storage: "2TB",
    price: "$8.99/month",
    highlight: false,
    features: [
      "2 TB storage",
      "Option to add members",
      "Extra member benefits"
    ]
  }
]
</script>

<template>
  <div class="min-h-screen bg-[#1b2538] flex items-center justify-center px-6">

    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 max-w-6xl w-full">

      <div v-for="plan in plans" :key="plan.name" :class="[
        'rounded-xl p-8 flex flex-col justify-between border transition',
        plan.highlight
          ? 'ring-4 ring-purple-500 shadow-purple-500/40 shadow-xl scale-105'
          : 'border border-white/10'
      ]">

        <!-- Header -->
        <div>
          <p class="text-center text-gray-400 text-sm mb-6">
            {{ plan.name }}
          </p>

          <h2 class="text-center text-white text-4xl font-semibold mb-2">
            {{ plan.storage }}
          </h2>

          <p class="text-center text-gray-400 mb-8">
            {{ plan.price }}
          </p>

          <!-- Button -->
          <button :class="[
            'w-full py-2 rounded-md text-sm font-medium transition',
            plan.highlight
              ? 'bg-purple-600 text-white hover:bg-purple-700'
              : 'border border-purple-500 text-purple-400 hover:bg-purple-500/10'
          ]">
            Purchase
          </button>
        </div>

        <!-- Divider -->
        <div class="border-t border-white/10 my-8"></div>

        <!-- Features -->
        <ul class="space-y-3 text-gray-300 text-sm">
          <li v-for="(feature, i) in plan.features" :key="i" class="flex items-center gap-3">
            <span class="text-purple-400">✔</span>
            {{ feature }}
          </li>
        </ul>

      </div>

    </div>
  </div>
</template>


<style scoped></style>
