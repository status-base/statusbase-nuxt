<script setup lang="ts">
//@ts-ignore
import Banner from "assets/banner.png"
</script>
<template>
  <div class="w-full flex flex-col items-center relative">
    <img class="w-full h-54 object-cover" :src="Banner" />
    <div class="max-w-screen-md absolute top-0">
      <NuxtPage />
    </div>
  </div>
</template>
