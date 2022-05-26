export const useCustomHead = (
  title = "StatusBase",
  description = "Free & Open Source uptime monitoring tool and beautiful status pages with incidents reports. Powered by Nuxt Content!",
  image = "https://statusbase.vercel.app/og.png"
) => {
  useHead({
    title,
    htmlAttrs: { lang: "en" },
    viewport: "width=device-width, initial-scale=1",
    charset: "utf-8",
    link: [{ rel: "icon", href: "/favicon.png" }],
    meta: [
      {
        name: "description",
        content: description,
      },
      { name: "twitter:card", content: "summary_large_image" },
      { name: "twitter:site", content: "@zernonia" },
      { name: "twitter:title", content: title },
      {
        name: "twitter:description",
        content: description,
      },
      { name: "twitter:image", content: image },
      { property: "og:type", content: "website" },
      { property: "og:title", content: title },
      { property: "og:url", content: "https://statusbase.vercel.app/" },
      { property: "og:image", content: image ?? image },
      {
        property: "og:description",
        content: description,
      },
    ],
  })
}
