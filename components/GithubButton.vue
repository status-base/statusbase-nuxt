<script setup lang="ts">
import IconGitHub from "~icons/carbon/logo-github"
import IconUp from "~icons/carbon/play-filled-alt"

const { data } = await useLazyFetch<{ stargazers_count: number }>(
  "https://api.github.com/repos/status-base/statusbase-nuxt",
  {
    pick: ["stargazers_count"],
    server: false,
  }
)
</script>

<template>
  <a
    rel="noopener"
    class="bg-white rounded-lg p-2 shadow-lg shadow-purple-100 text-gray-400 hover:text-gray-700 transition flex items-center"
    style="font-family: Arial, Helvetica, sans-serif; height: 54px"
    href="https://github.com/status-base/statusbase-nuxt"
    target="_blank"
    aria-label="Star status-base/statusbase-nuxt on GitHub"
  >
    <div class="mr-2 inline-flex">
      <IconGitHub class="w-7 h-7 md:w-9 md:h-9"></IconGitHub>
    </div>
    <div class="flex-col mr-3 md:mr-6">
      <h3 style="font-size: 9px" class="uppercase">Star on</h3>
      <h2 class="!leading-4 font-semibold md:text-xl">GitHub</h2>
    </div>
    <div class="flex flex-col items-center mr-2">
      <IconUp class="w-3 h-3 mt-1 transform -rotate-90"></IconUp>
      <span class="text-sm">{{ data?.stargazers_count ?? "-" }}</span>
    </div>
  </a>
</template>
