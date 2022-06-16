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
    <img alt="background banner" class="w-full h-54 object-cover" :src="Banner" />
    <div class="w-full max-w-screen-md absolute top-0 px-6 xl:px-0">
      <div class="mt-8 sm:mt-20 mb-10 flex flex-col sm:flex-row items-center justify-between">
        <NuxtLink
          to="/"
          class="text-white text-3xl md:text-4xl font-semibold inline-flex items-center text-shadow-md shadow-purple-500"
        >
          <Logo class="mr-4"></Logo> StatusBase Nuxt
        </NuxtLink>
        <GithubButton class="mt-4 sm:mt-0"></GithubButton>
      </div>
      <NuxtPage />

      <Footer></Footer>
    </div>
  </div>
</template>
