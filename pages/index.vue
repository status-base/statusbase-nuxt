<script setup lang="ts">
const { data: urls } = await useAsyncData("urls", () => queryContent("/url").find())
const { data: reports } = await useAsyncData("reports", () => queryContent("/log").find())
</script>

<template>
  <div>
    <OverallStatus :report_data="reports"></OverallStatus>
    <div class="flex flex-col items-center bg-white p-8">
      <Card :meta_data="url" :report_data="reports[index]" v-for="(url, index) in urls" :key="url._id"></Card>
    </div>
  </div>
</template>
