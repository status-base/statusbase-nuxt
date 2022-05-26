import dayjs from "dayjs/esm"
import utc from "dayjs/esm/plugin/utc"

export default defineNuxtPlugin(() => {
  dayjs.extend(utc)

  return {
    provide: {
      dayjs,
    },
  }
})
