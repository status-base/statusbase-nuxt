<script setup lang="ts">
import { PropType } from "vue"
import { isSameDate } from "~~/utils/function"
import { Report } from "~~/utils/interface"

const props = defineProps({
  data: Object as PropType<Report[]>,
})

const getDateArray = function (start: Date, days: number) {
  var arr: Date[] = []
  for (let i = days; i > 0; i--) {
    let dt = new Date(start)
    dt.setDate(dt.getDate() - i + 1)
    arr.push(new Date(dt))
  }
  return arr
}

const computedData = computed(() => {
  let dates = getDateArray(new Date(), 45)
  return dates.map((i) => {
    let dataGroupByDates: number[] = props.data
      ?.filter((j) => isSameDate(i, j.time))
      .map((i) => (i.status === "success" ? 1 : 0))

    let uptime = dataGroupByDates?.length ? dataGroupByDates.reduce((a, v) => a + v, 0) / dataGroupByDates.length : -1

    return {
      date: i,
      uptime,
    }
  })
})

const overallUptime = computed(() => {
  let dateWithUptimeData = computedData.value.filter((i) => i.uptime >= 0)
  return dateWithUptimeData.reduce((a, v) => a + v.uptime, 0) / dateWithUptimeData.length
})

defineExpose({ overallUptime })
</script>

<template>
  <div class="flex justify-between">
    <template v-for="data in computedData">
      <Status v-bind="data"></Status>
    </template>
  </div>
</template>
