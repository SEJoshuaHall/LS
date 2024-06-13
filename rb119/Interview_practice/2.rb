=begin
PROBLEM
take array of integers, return min sum of 5 consecutive nums

EXAMPLE
If fewer than 5, return nil

DATA
input array
array of slices of all sets of 5 consecutive numbers
output: total of the sum of 5 consecutive nums

ALG
return nil if count < 5
result = all slices of 5 consecutive nums
  length - 4 times do 
    take starting to 5 and push to subarray in result
transform result to sums, and return min

=end
def minimum_sum(arr)
  return nil if arr.count < 5
  result = []
  (arr.length - 4).times do |start|
    result << arr[start, 5]
  end
  result.map {|sub| sub.inject(:+)}.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10