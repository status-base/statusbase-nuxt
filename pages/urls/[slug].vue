<script setup lang="ts">
const {
  params: { slug },
} = useRoute()

const { data: url } = await useAsyncData(`url-${slug}`, () => queryContent(`/urls/${slug}`).findOne())
const { data: log } = await useAsyncData(`log-${slug}`, () => queryContent(`/logs/${slug}`).findOne())
const { data: incidents } = await useAsyncData(`incident-${slug}`, () =>
  queryContent("/incidents")
    .where({ application: { $contains: slug } })
    .sort({ title: 0 })
    .find()
)
const gridCount = useGridCount()
</script>

<template>
  <div class="">
    <OverallStatus :report_data="log"></OverallStatus>

    <div class="mt-12 md:mt-20 font-semibold inline-flex items-end">
      <h2 class="text-xl md:text-3xl">{{ url.title }}'s Uptime</h2>
      <h3 class="text-gray-300 md:text-xl ml-3 md:ml-6">Last {{ gridCount }} days</h3>
    </div>

    <div class="flex flex-col items-center">
      <Card :meta_data="url" :report_data="log"></Card>
    </div>

    <IncidentReport :incidents="incidents"></IncidentReport>
  </div>
</template>
