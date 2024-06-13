=begin
Create a method that takes an array of numbers, all of which are the same except one. Find and return the number in the array that differs from all the rest.

The array will always contain at least 3 numbers, and there will always be exactly one number that is different.

PROBLEM
Find the number in the array which occurs exactly once

DATA
Input: array
Output: selected integer which occurs once

ALGORITHM
iterate over the array and return the value for which count equals 1

=end

def what_is_different(arr)
  arr.each do |int|
    if arr.count(int) == 1
      return int
    end
  end
end

p what_is_different([0, 1, 0]) == 1
p what_is_different([7, 7, 7, 7.7, 7]) == 7.7
p what_is_different([1, 1, 1, 1, 1, 1, 1, 11, 1, 1, 1, 1]) == 11
p what_is_different([3, 4, 4, 4]) == 3
p what_is_different([4, 4, 4, 3]) == 3