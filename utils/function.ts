export const formatUptime = (data: number) => {
  return ((data ?? 0) * 100).toFixed(2) + "%"
}

export const isSameDate = (a: string | Date, b: string | Date) => {
  let adt = new Date(a)
  let bdt = new Date(b)
  return adt.getDate() === bdt.getDate() && adt.getMonth() === bdt.getMonth() && adt.getFullYear() === bdt.getFullYear()
}

export const statusColor = (uptime: number, type = "bg") => {
  if (uptime >= 0.75) {
    return `${type}-purple-500`
  } else if (uptime >= 0.5) {
    return `${type}-yellow-400`
  } else if (uptime >= 0) {
    return `${type}-red-400`
  } else {
    return `${type}-gray-200`
  }
}

export const statusString = (uptime: number, type = "bg") => {
  if (uptime >= 0.75) {
    return "success"
  } else if (uptime >= 0.5) {
    return "warning"
  } else if (uptime >= 0) {
    return "danger"
  } else {
    return "unknown"
  }
}
