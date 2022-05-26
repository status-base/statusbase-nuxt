<script setup lang="ts">
const { data: urls } = await useAsyncData("urls", () => queryContent("/urls").find())
const { data: logs } = await useAsyncData("logs", () => queryContent("/logs").find())
const { data: incidents } = await useAsyncData("reports", () => queryContent("/incidents").sort({ title: 0 }).find())

const gridCount = useGridCount()
</script>

<template>
  <div class="">
    <OverallStatus :report_data="logs"></OverallStatus>

    <div class="mt-12 md:mt-20 font-semibold inline-flex items-end">
      <h2 class="text-xl md:text-3xl">Uptime</h2>
      <h3 class="text-gray-300 md:text-xl ml-3 md:ml-6">Last {{ gridCount }} days</h3>
    </div>

    <div class="flex flex-col items-center">
      <Card :meta_data="url" :report_data="logs[index]" v-for="(url, index) in urls" :key="url._id"></Card>
    </div>

    <IncidentReport :incidents="incidents"></IncidentReport>
  </div>
</template>
