<script setup lang="ts">
import { ParsedContent } from "@nuxt/content/dist/runtime/types"
import { PropType } from "vue"
import { isSameDate } from "~~/utils/function"
import { Report } from "~~/utils/interface"

const props = defineProps({
  report_data: Object as PropType<ParsedContent[]>,
})

const overallUptime = computed(() => {
  let uptime = 1
  props.report_data.forEach((i) => {
    let todayData: number[] = i.body
      .filter((j: Report) => isSameDate(j.time, new Date()))
      .map((j: Report) => (j.status === "success" ? 1 : 0))
    let averageUptime = todayData.reduce((a, v) => a + v, 0) / todayData.length
    if (averageUptime >= 0 && averageUptime < 0.5) {
      uptime = 0
    }
  })
  return uptime
})
</script>

<template>
  <div class="flex justify-center">
    <div
      class="w-full bg-white p-6 md:p-8 flex items-center rounded-xl shadow-lg shadow-purple-100 text-purple-500 text-xl md:text-3xl font-medium"
    >
      <StatusIcon :uptime="overallUptime" class="md:text-3xl" />
      <h2 class="ml-3 md:ml-6">All Systems Operational</h2>
    </div>
  </div>
</template>
