<script setup lang="ts">
//@ts-ignore
import Banner from "assets/banner.png"
</script>
<template>
  <div class="w-screen flex flex-col items-center">
    <img class="w-full h-64 object-fill" :src="Banner" />
    <div class="w-full max-w-screen-lg">
      <NuxtPage />
    </div>
  </div>
</template>
