=begin
Given an array of integers, consider the "running sum" of each element: the sum of all the elements up to and including that element. For instance:
[1, 5, 3]
the running sum of 1 is 1
the running sum of 5 is (1 + 5) = 6
the running sum of 3 is (1 + 5 + 3) = 9

Return the percentage of running sums in the array that are even, rounded to two decimal places. You can use `Array#round` with `2` as an argument to perform this rounding.

PROBLEM
Take an array of integers, transform each integer to the running sum of the integers, return the percentage of running sums that are even, rounded to 2 decimal places.

EXAMPLES
if there are no integers in the input, output 1.0

DATA
Input: array of integers
Tansformed into running sums
Output: integer rounded to 2 digits representing percentage of even numbers in the transformed array

AGLORITHM
set running total variable to 0
Map the input array to running sums variable
  for each value return that value + prior value, but skip the first
select the evens count and save as evens_count
divide even count by total count and return as float rounded to 2

=end

def evenPercent(arr)
  return 1.00 if arr == []
  running_total = 0
  arr.map! do |num|
    running_total += num
  end
  evens = arr.select {|num| num.even?}.count
  (evens / arr.count.to_f).round(2)
end

p evenPercent([1, 2, 4]) == 0
p evenPercent([1, 3]) == 0.50
p evenPercent([1, 5, 3]) == 0.33
p evenPercent([2, 4, 6]) == 1.00
p evenPercent([12]) == 1.00
p evenPercent([13]) == 0.00
p evenPercent([]) == 1.00
