<script setup lang="ts">
const props = defineProps({
  date: Date,
  uptime: Number,
})

const uptimeClass = computed(() => {
  if (props.uptime == 1) {
    return "bg-green-400"
  } else if (props.uptime >= 0.5) {
    return "bg-yellow-400"
  } else if (props.uptime >= 0) {
    return "bg-red-400"
  } else {
    return "bg-gray-200"
  }
})
</script>

<template>
  <div class="w-4 h-6 rounded mx-0.5" :class="uptimeClass"></div>
</template>
