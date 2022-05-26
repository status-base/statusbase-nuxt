<script setup lang="ts">
const { data: urls } = await useAsyncData("urls", () => queryContent("/urls").find())
const { data: logs } = await useAsyncData("logs", () => queryContent("/logs").find())
const { data: incidents } = await useAsyncData("reports", () => queryContent("/incidents").sort({ title: 0 }).find())

const gridCount = useGridCount()
</script>

<template>
  <div class="">
    <h1 class="text-white text-3xl md:text-4xl font-semibold mt-20 mb-10">StatusBase</h1>
    <OverallStatus :report_data="logs"></OverallStatus>

    <div class="mt-12 md:mt-20 font-semibold inline-flex items-end">
      <h2 class="text-xl md:text-3xl">Uptime</h2>
      <h3 class="text-gray-300 md:text-xl ml-3 md:ml-6">Last {{ gridCount }} days</h3>
    </div>

    <div class="flex flex-col items-center">
      <Card :meta_data="url" :report_data="logs[index]" v-for="(url, index) in urls" :key="url._id"></Card>
    </div>

    <div class="mt-12 md:mt-20 font-semibold inline-flex items-end">
      <h2 class="text-xl md:text-3xl">Recent Incident</h2>
    </div>

    <div class="mt-4 md:mt-8">
      <div class="mb-8" v-for="(incident, index) in incidents" :key="incident._id">
        <h3 class="md:text-xl my-4">{{ new Date(incident.date).toLocaleString() }}</h3>
        <div class="bg-gray-50 rounded-xl p-8">
          <p v-if="incident.resolved" class="px-4 py-2 mb-4 rounded-xl text-white bg-purple-500 w-max">Resolved</p>
          <ContentRenderer class="prose max-w-none" :value="incident" />
        </div>
      </div>
    </div>
  </div>
</template>
