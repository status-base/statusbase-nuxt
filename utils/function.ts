export const formatUptime = (data: number) => {
  return ((data ?? 0) * 100).toFixed(2) + "%"
}
