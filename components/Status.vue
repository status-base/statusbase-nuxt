<script setup lang="ts">
const props = defineProps({
  date: Date,
  uptime: Number,
})

const uptimeClass = computed(() => {
  if (props.uptime == 1) {
    return "bg-purple-500"
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
  <div class="w-2 h-7 rounded mx-1" :class="uptimeClass"></div>
</template>
