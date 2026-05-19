<script setup>
import { ref, onMounted, onUnmounted } from 'vue';

const isVisible = ref(false);
const keyText = ref('E');

// Show by default when testing in browser instead of in-game (FiveM)
if (!window.invokeNative) {
  isVisible.value = true;
}

const handleMessage = (event) => {
  const item = event.data;
  
  if (item.type === 'Newbie') {
    if (item.display) {
      isVisible.value = true;
    } else {
      isVisible.value = false;
    }
  }

  if (item.key) {
    keyText.value = item.key;
  }
};

const handleKeyUp = (e) => {
  if (e.key === "Escape" && isVisible.value) {
    fetch(`https://UR_Newbie/CloseMenu`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: JSON.stringify({})
    }).catch(err => console.log(err));
    
    // FiveM server usually handles closing via NUI, but we can hide it early if needed
    isVisible.value = false; 
  }
};

const sendAction = (actionType) => {
  fetch(`https://UR_Newbie/type`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify({
      type: actionType
    })
  }).catch(err => console.log(err));
};

onMounted(() => {
  window.addEventListener('message', handleMessage);
  window.addEventListener('keyup', handleKeyUp);
});

onUnmounted(() => {
  window.removeEventListener('message', handleMessage);
  window.removeEventListener('keyup', handleKeyUp);
});
</script>

<template>
  <Transition name="fade">
    <main v-if="isVisible" class="w-screen h-screen flex items-center bg-cover bg-center bg-no-repeat overflow-hidden">
      <div class="absolute bottom-[20%] left-[1.5%] scale-[0.70] origin-bottom-left w-[270px] flex flex-col select-none bg-black/30 border-[1.5px] border-solid border-[#3c3d3a] rounded-[24px] px-[20px] py-[24px]">
        
        <!-- Header -->
        <h1 class="text-[#00a6ff] text-[17px] font-[800] uppercase tracking-[0.05em] mb-5 text-left ml-1 title-glow">
          New Player Menu
        </h1>

        <!-- Buttons Container -->
        <div class="flex flex-col gap-4">
          
          <!-- Button: Reset Position -->
          <button @click="sendAction('fall')" class="relative flex items-center w-full bg-[#1f1f20]/90 backdrop-blur border border-white/5 rounded-full p-[4px] transition-transform duration-200 hover:scale-[1.02] active:scale-95 cursor-pointer hud-button">
            <!-- Segmented Circle -->
            <div class="hud-circle">
              <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.3" stroke-linecap="round" stroke-linejoin="round" class="w-[18px] h-[18px] text-[#00a6ff]" style="transform: scale(1.1) translateX(1px) translateY(1px);">
                <circle cx="12" cy="7" r="1.8" fill="none"></circle>
                <path d="M11 10.5L8 13.5M11 10.5v5.5M11 10.5l4 2.5 M11 16l-3 4 M11 16l3 4"></path>
              </svg>
            </div>
            <span class="ml-[14px] text-white font-[700] text-[13px] tracking-[0.05em] uppercase mt-[1px]">Reset Position</span>
          </button>

          <!-- Button: Customize -->
          <button @click="sendAction('reskin')" class="relative flex items-center w-full bg-[#1f1f20]/90 backdrop-blur border border-white/5 rounded-full p-[4px] transition-transform duration-200 hover:scale-[1.02] active:scale-95 cursor-pointer hud-button">
            <div class="hud-circle">
              <!-- Custom Shirt SVG -->
              <svg viewBox="0 0 24 24" fill="currentColor" class="w-[18px] h-[18px] text-[#00a6ff]" stroke="currentColor" stroke-width="0.2">
                 <path fill-rule="evenodd" clip-rule="evenodd" d="M5 6l4-2h6l4 2v5h-3v9H8v-9H5V6zm6.5 1h1v4h-1V7z" />
              </svg>
            </div>
            <span class="ml-[14px] text-white font-[700] text-[13px] tracking-[0.05em] uppercase mt-[1px]">Customize</span>
          </button>

          <!-- Button: Enter City -->
          <button @click="sendAction('teleport')" class="relative flex items-center w-full bg-[#1f1f20]/90 backdrop-blur border border-white/5 rounded-full p-[4px] transition-transform duration-200 hover:scale-[1.02] active:scale-95 cursor-pointer hud-button">
            <div class="hud-circle">
              <svg viewBox="0 0 24 24" fill="currentColor" class="w-[20px] h-[20px] text-[#00a6ff]" stroke="currentColor" stroke-width="0.2">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M6 6a3 3 0 0 1 3-3h6a3 3 0 0 1 3 3v10a3 3 0 0 1-3 3H9a3 3 0 0 1-3-3V6zm2 1.5a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1V10a1 1 0 0 1-1 1H9a1 1 0 0 1-1-1V7.5zm0 6a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1.5a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1.5zm1 4.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3zm7 0a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
              </svg>
            </div>
            <span class="ml-[14px] text-white font-[700] text-[13px] tracking-[0.05em] uppercase mt-[1px]">Enter City</span>
          </button>

        </div>

        <!-- Bottom Hint text -->
        <div class="mt-8 flex justify-center w-full">
          <p class="text-[#cfd1d3] text-[12px] font-[500] tracking-[0.02em]">
            Press <strong class="text-white font-[800] text-[14px] mx-1">{{ keyText }}</strong> To Enable Mouse
          </p>
        </div>

      </div>
    </main>
  </Transition>
</template>

<style scoped>
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.3s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
