<script setup lang="ts">
import { ParsedContent } from "@nuxt/content/dist/runtime/types"
import { PropType } from "vue"

const props = defineProps({
  incidents: Object as PropType<ParsedContent[]>,
})
const { $dayjs } = useNuxtApp()
</script>

<template>
  <div class="mt-12 md:mt-20 font-semibold inline-flex items-end">
    <h2 class="text-xl md:text-3xl">Recent Incident</h2>
  </div>

  <div class="mt-4 md:mt-8">
    <div v-if="!incidents || incidents.length == 0">
      <div class="bg-gray-50 rounded-xl p-8 h-48 flex items-center justify-center">No incident reported</div>
    </div>
    <div v-else class="mb-8" v-for="(incident, index) in incidents" :key="incident._id">
      <h3 class="md:text-xl my-4">{{ $dayjs.utc(incident.date) }}</h3>
      <div class="bg-gray-50 rounded-xl p-4 md:p-8">
        <p v-if="incident.resolved" class="px-4 py-2 mb-4 rounded-xl text-white bg-purple-500 w-max">Resolved</p>
        <ContentRenderer class="prose max-w-none" :value="incident" />
      </div>
    </div>
  </div>
</template>
