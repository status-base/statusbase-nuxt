import dayjs from "dayjs/esm"
import utc from "dayjs/esm/plugin/utc"
import isToday from "dayjs/esm/plugin/isToday"

export default defineNuxtPlugin(() => {
  dayjs.extend(utc)
  dayjs.extend(isToday)

  return {
    provide: {
      dayjs,
    },
  }
})
