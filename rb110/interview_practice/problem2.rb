=begin

Create a method that takes an array of integers as an argument. The method should return the minimum sum of 5 consecutive numbers in the array. If the array contains fewer than 5 elements, the method should return nil.

PROBLEM
Take an array of integers, return nil if fewer than 5 integers, else return the sum of the 5 consecutive integers which produce the smallest sum value.

EXAMPLES
largest negative number is considered smallest for this exercise

DATA
Input array of integers
Array of all possible consecutive numbers
Output: integer or nil

ALGORITHM
check for 5 or more integers, or return nil
create array of subarrays which are every consecutive 5 integers from the input array
  populate subarray with 5 elements beginning with each index and breaking when there are 4 indices left (each with index)
iterate over the subarrays and transform them (map) to their sum
take the minimum value and return it

=end

def minimum_sum(arr)
  return nil unless arr.count > 4
  sub_arr = []
  arr.each_with_index do |int, idx|
    break if arr.count - 4 == idx
    sub_arr << arr[idx..idx+4]
  end
  sub_arr.map! {|sub| sub.inject(:+)}
  sub_arr.min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, -5]) == 9
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10