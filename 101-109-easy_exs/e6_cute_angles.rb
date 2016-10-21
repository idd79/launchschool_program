# Cute angles

def dms(angle)
  total_seconds = angle.abs * 3600
  degrees, r = total_seconds.divmod(3600)
  minutes, seconds = r.divmod(60)
  return format("%d°%02d'%02d\"", degrees, minutes, seconds) if angle >= 0
  format("%d°%02d'%02d\"", -1 * degrees, minutes, seconds)
end

puts dms(30)
puts dms(76.73)
puts dms(93.034773)
puts dms(-254.6)
puts dms(0)
puts dms(360)
puts dms(-76.73)

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
