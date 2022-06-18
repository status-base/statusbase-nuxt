import { defineNuxtPlugin } from "#app"

export default defineNuxtPlugin(() => {
  const moduleOptions = {
    scriptUrl: "https://umami-zernonia.vercel.app/umami.js",
    websiteId: "9d53c455-d1a9-48b1-8c7d-145650db4f62",
    domains: "nuxt.statusbase.io",
  }
  const options = { ...moduleOptions }

  loadScript(options)
})

function loadScript(options: any) {
  const head = document.head || document.getElementsByTagName("head")[0]
  const script = document.createElement("script")

  script.async = true
  script.defer = true
  script.dataset.websiteId = options.websiteId
  script.dataset.domains = options.domains
  script.src = options.scriptUrl

  head.appendChild(script)
}
