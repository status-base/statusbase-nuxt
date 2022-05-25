<script setup lang="ts">
import { statusColor } from "~~/utils/function"

const props = defineProps({
  date: Date,
  uptime: Number,
})

const uptimeClass = computed(() => statusColor(props.uptime))
</script>

<template>
  <div class="w-2 h-7 rounded cursor-pointer transform transition hover:scale-125" :class="uptimeClass"></div>
</template>
