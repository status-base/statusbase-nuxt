<script setup lang="ts">
import IconTick from "~icons/carbon/checkmark-filled"
import { ParsedContent } from "@nuxt/content/dist/runtime/types"
import { PropType } from "vue"

const props = defineProps({
  report_data: Object as PropType<ParsedContent[]>,
})
</script>

<template>
  <div class="flex justify-center transform -translate-y-6">
    <div
      class="max-w-screen-md w-full bg-white p-8 flex items-center rounded-xl shadow-lg text-purple-500 text-3xl font-semibold"
    >
      <IconTick></IconTick>
      <h2 class="ml-6">All Systems Operational</h2>
    </div>
  </div>
</template>
