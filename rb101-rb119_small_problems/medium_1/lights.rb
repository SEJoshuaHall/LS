=begin

PROBLEM
take an integer (i), and a series of switches from 1 to i, and for 1 number of times, iterate. Light start off. Round 1 toggle every 1, round 2, every 2, round three, every 3, etc. Return array of switches lighted.


EXAMPLES
toggle(5) == [1, 4]
toggle(10) == [1, 4, 9]


DATA
input: integer of number of lights and number of rounds
hash to hold switches and states
output: array of on lights


ALGORYTHM
build switches hash to hold all switches in off position
take integer and for 1..int set values to off
build switching method
  take hash and integer
  set counter
  iterate through 1..i
  switch every (i) light
    helper method
    call key
    check state and switch
  return hash 
return keys of all on switches in array


CODE
=end

def switching!(num, switches)
round = 1
  num.times do
    iterating_num = round
    until iterating_num > num do
      (switches[iterating_num] == :off) ? (switches[iterating_num] = :on) : (switches[iterating_num] = :off)
      iterating_num += round
    end
    round += 1
  end
  switches
end

def toggle(int)
  list =*(1..int)
  lights = list.each_with_object({}) { |k, h| h[k] = :off }
  lights = switching!(int, lights)
  result = []
  lights.each do |k, v|
    if v == :on
      result << k
    end
  end
  result
end


p toggle(5) == [1, 4]
p toggle(10) == [1, 4, 9]