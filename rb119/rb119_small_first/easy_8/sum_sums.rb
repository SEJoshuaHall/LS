=begin

PROBLEM
given array of integers, return sum of the sums of the leading integer plus the leaing integer and the second integer, plus the leading integer and the second integer, and the third integer, etc.


EXAMPLES
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35


DATA
Input: array
Working array of all necessary combinations
Output: integer that is the sum of all integers from working array


ALGORYTHM
create working array
build working array of all combinations
  create iteration count and set to 1
  loop over input array summing all from index 0 to current and adding to working


CODE
=end

def sum_of_sums(arr)
  working_arr = []
  arr.each_index do |i|
    working_arr << (arr[0..i].reduce(:+))
  end
  result = working_arr.reduce(:+)
end


p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35