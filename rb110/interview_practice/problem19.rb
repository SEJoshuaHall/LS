=begin
Create a method that takes an array of integers as an argument and returns the integer that appears an odd number of times. There will always be exactly one such integer in the input array.

PROBLEM
Find the integer in a given array which appears an odd number of times

DATA
Input: array of integers
Output: a selected integer

ALGORITHM
select the element which appears an odd number of times
  iterate over array until we find a number whose count is odd and return that number

=end

def odd_fellow(arr)
  arr.each do |int|
    if arr.count(int).odd?
      return int
    end
  end
end

p odd_fellow([4]) == 4
p odd_fellow([7, 99, 7, 51, 99]) == 51
p odd_fellow([7, 99, 7, 51, 99, 7, 51]) == 7
p odd_fellow([25, 10, -6, 10, 25, 10, -6, 10, -6]) == -6
p odd_fellow([0, 0, 0]) == 0