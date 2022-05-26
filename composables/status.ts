export const useGridCount = () => {
  const { $device } = useNuxtApp()
  return useState<number>("grid-count", () => ($device?.isDesktop ? 45 : $device?.isTablet ? 30 : 20))
}
