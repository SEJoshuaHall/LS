=begin

Create a method that takes an array of numbers as an argument. For each number, determine how many numbers in the array are smaller than it, and place the answer in an array. Return the resulting array.

When counting numbers, only count unique values. That is, if a number occurs multiple times in the array, it should only be counted once.

PROBLEM
Take an array of numbers, iterate over it, for each number, transform it into a number representing how many unique other numbers are smaller than it.

Examples


DATA
Input: array
Output: array

ALGORITHM
Create a new array equal to the result of iterating over the input array
  Take the uniq values of the array and count how many are smaller that the current element. (map)
    counter
Return the new array

=end

def smaller_numbers_than_current(arr)
  arr.map do |int|
    count = 0
    arr.uniq.each do |e|
      if e < int
        count += 1
      end
    end
    count
  end
end

p smaller_numbers_than_current([8, 1, 2, 2, 3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([7, 7, 7, 7]) == [0, 0, 0, 0]
p smaller_numbers_than_current([6, 5, 4, 8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]

my_array = [1, 4, 6, 8, 13, 2, 4, 5, 4]
result   = [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current(my_array) == result