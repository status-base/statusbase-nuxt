<script setup lang="ts">
import { ParsedContent } from "@nuxt/content/dist/runtime/types"
import { PropType } from "vue"

const props = defineProps({
  data: Object as PropType<ParsedContent>,
})
</script>

<template>
  <div>
    <h2>{{ data.title }}</h2>
    {{ data.body }}
    <StatusGrid :data="data.body" />
  </div>
</template>
