<script setup lang="ts">
import { PropType } from "vue"
import { formatUptime } from "~~/utils/function"
import { ParsedContent } from "@nuxt/content/dist/runtime/types"

const props = defineProps({
  meta_data: Object as PropType<ParsedContent>,
  report_data: Object as PropType<ParsedContent>,
})
const status = ref()
</script>

<template>
  <div class="my-10 w-full">
    <div class="mb-4 flex items-center justify-between">
      <div class="mx-0.5">
        <div class="flex items-center">
          <StatusIcon :uptime="status?.overallUptime"></StatusIcon>
          <h2 class="ml-2 text-xl">{{ meta_data.title }}</h2>
        </div>
        <h4 class="text-sm text-gray-400">{{ meta_data.url }}</h4>
      </div>
      <p class="ml-6 text-xl text-gray-400">{{ formatUptime(status?.overallUptime) }}</p>
    </div>
    <StatusGrid ref="status" :data="report_data.body" />
  </div>
</template>
