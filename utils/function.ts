export const formatUptime = (data: number) => {
  if (data >= 0) {
    return (data * 100).toFixed(2) + "%"
  } else {
    return "No data available"
  }
}

export const isSameDate = (a: string | Date, b: string | Date) => {
  let adt = new Date(a)
  let bdt = new Date(b)
  return adt.getDate() === bdt.getDate() && adt.getMonth() === bdt.getMonth() && adt.getFullYear() === bdt.getFullYear()
}

export const statusColor = (uptime: number, type = "bg") => {
  if (uptime >= 0.9) {
    return `${type}-purple-500`
  } else if (uptime >= 0.5) {
    return `${type}-yellow-400`
  } else if (uptime >= 0) {
    return `${type}-red-400`
  } else {
    return `${type}-gray-200`
  }
}

export const statusString = (uptime: number, type = "state") => {
  if (uptime >= 0.9) {
    return type === "state" ? "success" : "Fully operational"
  } else if (uptime >= 0.5) {
    return type === "state" ? "warning" : "Partial Outage"
  } else if (uptime >= 0) {
    return type === "state" ? "danger" : "Major Outage"
  } else {
    return type === "state" ? "unknown" : "Unknown"
  }
}
