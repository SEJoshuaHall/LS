=begin

PROBLEM
Method takes floating point that represents angle between 0 and 360 degrees and returns a string that represents that angle in degrees, minutes, and seconds.


EXAMPLES
# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")


DATA
Input: floating point number
array of 3 values
Output: string


ALGORYTHM
assign whole number to degrees
divide 60 by decimal and assign whole number to minutes
repeat and assign to seconds
form string and return


CODE
=end

DEGREE = "\xC2\xB0"

def dms(float)
  float = float % 360
  degrees = float.truncate(0)
  float -= degrees
  minutes = (60 * float).truncate(0)
  float = (60 * float) - ((60 * float).truncate(0))
  seconds = (60 * float).truncate(0)
  "#{degrees}#{DEGREE}#{sprintf('%02d', minutes)}'#{sprintf('%02d', seconds)}\""
end

puts dms(400) #== %(30°00'00")
puts dms(30) #== %(30°00'00")
puts dms(76.73) #== %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) #== %(93°02'05")
puts dms(0) #== %(0°00'00")
puts dms(360) #== %(360°00'00") || dms(360) == %(0°00'00")