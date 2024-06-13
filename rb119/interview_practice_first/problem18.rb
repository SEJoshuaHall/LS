=begin
Create a method that takes an array of integers as an argument. Determine and return the index N for which all numbers with an index less than N sum to the same value as the numbers with an index greater than N. If there is no index that would make this happen, return -1.

If you are given an array with multiple answers, return the index with the smallest value.

The sum of the numbers to the left of index 0 is 0. Likewise, the sum of the numbers to the right of the last element is 0.

PROBLEM
find the first index of the integer in the provided array for which all integers to the left summed equal all integers to the right summed

EXAMPLES

DATA
Input: array of integers
result initialized to -1
Output: integer representing an index

ALGORITHM
set result to -1
iterate over each element by index
  sum to the left and sum to the right and if equal, set result to index and break
return result

=end

def equal_sum_index(arr)
  result = -1
  arr.each_with_index do |_, ind|
    if ind == 0 && arr[ind+1..-1].inject(:+) == 0
      result = 0
      break
    elsif arr[0..ind-1].inject(:+) == arr[ind+1..-1].inject(:+)
      result = ind
    end
  end
  result
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0