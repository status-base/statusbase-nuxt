import { defineConfig } from "windicss/helpers"

export default defineConfig({
  plugins: [require("windicss/plugin/typography")],
  safelist: [
    "bg-purple-500",
    "bg-yellow-400",
    "bg-red-400",
    "bg-gray-200",
    "text-purple-500",
    "text-yellow-400",
    "text-red-400",
    "text-gray-200",
  ],
})
