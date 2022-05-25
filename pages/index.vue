<script setup lang="ts">
const { data } = await useAsyncData("reports", () => queryContent("/log").find())
</script>

<template>
  <div class="bg-white p-8">
    <Card :data="report" v-for="report in data" :key="report._id"></Card>
  </div>
</template>
