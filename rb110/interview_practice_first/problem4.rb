=begin
Problem 4
Create a method that takes an array of integers as an argument and returns an array of two numbers that are closest together in value. If there are multiple pairs that are equally close, return the pair that occurs first in the array.

PROBLEM
Taking array of integers, finding two closest values, returning the first pair of close values

DATA
Input: array of integers
Output: array of 2 integers from the original array

ALGORITHM
Nested iteration problem

initialize result array of two integers (first pair)
iterate over input array
  for each integer we iterate over other integers
    find the difference and compare with the difference in the current result array, if smaller replace return array with this pair
return result array

=end

def closest_numbers(arr)
  result = [arr[0], arr[1]]
  arr.each_with_index do |int1, idx1|
    arr.each_with_index do |int2, idx2|
      next if idx2 == idx1
      if (int2 - int1).abs < (result[0] - result[1]).abs
        result = [int1, int2]
      end
    end
  end
  result
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 22, 7, 17]) == [12, 7]