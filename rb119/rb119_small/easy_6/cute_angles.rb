DEGREE = "\u00B0"

def dms(total_degrees)
  degrees, remainder = total_degrees.divmod(1)
  minutes, remainder = (remainder * 60).divmod(1)
  seconds = (remainder * 60).round
  "#{degrees}#{DEGREE}#{sprintf("%02d", minutes)}\'#{sprintf("%02d", seconds)}\""
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")