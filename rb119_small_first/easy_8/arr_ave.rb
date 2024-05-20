=begin

PROBLEM
Take array of integers, return average of all numbers. Array will never be empty and integers will always be positive. Use iteration, not Array#sum.


EXAMPLES
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40


DATA



ALGORYTHM



CODE
=end

def average(arr)
  count = arr.count
  sum_value = 0
  arr.each do |num|
    sum_value += num
  end
  result = sum_value.to_f / count.to_f
end

puts average([1, 6]) #== 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) #== 25
puts average([9, 47, 23, 95, 16, 52]) #== 40