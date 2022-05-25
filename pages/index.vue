<script setup lang="ts">
const { data } = await useAsyncData("reports", () => queryContent("/log").find())
</script>

<template>
  <div>
    <ul>
      <li v-for="a in data" :key="a._id">
        <h2>{{ a.title }}</h2>
        {{ a.body }}
        <StatusGrid />
      </li>
    </ul>
  </div>
</template>
