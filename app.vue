<script setup lang="ts">
//@ts-ignore
import Banner from "assets/banner.png"
import { useWindowSize } from "@vueuse/core"

const gridCount = useGridCount()
const { width: windowWidth } = useWindowSize()

watch(windowWidth, (n) => (gridCount.value = n > 768 ? 45 : n > 400 ? 30 : 20))
</script>
<template>
  <div class="w-full flex flex-col items-center relative">
    <img class="w-full h-54 object-cover" :src="Banner" />
    <div class="w-full max-w-screen-md absolute top-0 px-4 sm:px-6 md:px-8 xl:px-0">
      <div class="mt-20 mb-10 flex items-center justify-between">
        <NuxtLink to="/" class="text-white text-3xl md:text-4xl font-semibold">StatusBase </NuxtLink>
        <GithubButton></GithubButton>
      </div>
      <NuxtPage />

      <Footer></Footer>
    </div>
  </div>
</template>
