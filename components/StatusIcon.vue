<script setup lang="ts">
import IconTick from "~icons/carbon/checkmark-filled"
import IconWarning from "~icons/carbon/warning-filled"
import IconDanger from "~icons/carbon/face-dizzy-filled"
import IconUnknown from "~icons/carbon/help-filled"
import { statusString } from "~~/utils/function"

const props = defineProps({
  uptime: Number,
})
</script>

<template>
  <div class="inline-flex md:text-xl">
    <IconTick v-if="statusString(uptime) == 'success'" class="text-purple-500"></IconTick>
    <IconWarning v-else-if="statusString(uptime) == 'warning'" class="text-yellow-300"></IconWarning>
    <IconDanger v-else-if="statusString(uptime) == 'danger'" class="text-red-400"></IconDanger>
    <IconUnknown v-else-if="statusString(uptime) == 'unknown'" class="text-gray-400"></IconUnknown>
  </div>
</template>
