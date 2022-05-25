<script setup lang="ts">
const { data: urls } = await useAsyncData("urls", () => queryContent("/urls").find())
const { data: reports } = await useAsyncData("reports", () => queryContent("/logs").find())
</script>

<template>
  <div>
    <h1 class="text-white text-4xl font-semibold mt-20 mb-10">StatusBase</h1>
    <OverallStatus :report_data="reports"></OverallStatus>

    <div class="mt-20 font-semibold inline-flex items-end">
      <h2 class="text-3xl">Uptime</h2>
      <h3 class="text-gray-300 text-xl ml-6">Last 45 days</h3>
    </div>

    <div class="flex flex-col items-center">
      <Card :meta_data="url" :report_data="reports[index]" v-for="(url, index) in urls" :key="url._id"></Card>
    </div>

    <div class="mt-20 font-semibold inline-flex items-end">
      <h2 class="text-3xl">Recent Incident</h2>
    </div>
  </div>
</template>
