<script setup lang="ts">
const getDateArray = function (start: Date, days: number) {
  var arr = []

  for (let i = days; i > 0; i--) {
    let dt = new Date(start)
    dt.setDate(dt.getDate() - i + 1)
    arr.push(new Date(dt))
  }
  return arr
}
const dates = computed(() => getDateArray(new Date(), 30))
</script>

<template>
  <div class="flex">
    <template v-for="date in dates">
      <Status :date="date"></Status>
    </template>
  </div>
</template>
