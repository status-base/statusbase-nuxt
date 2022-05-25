<script setup lang="ts">
const { data } = await useAsyncData("reports", () => queryContent("/log").find())
</script>

<template>
  <div class="bg-white p-8">
    <ul>
      <li v-for="a in data" :key="a._id">
        <h2>{{ a.title }}</h2>
        {{ a.body }}
        <StatusGrid />
      </li>
    </ul>
  </div>
</template>
