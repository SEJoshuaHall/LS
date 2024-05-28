=begin
Create a method that takes an array of integers as an argument and returns the number of identical pairs of integers in that array. For instance, the number of identical pairs in [1, 2, 3, 2, 1] is 2: there are two occurrences each of both 2 and 1.

If the array is empty or contains exactly one value, return 0.

If a certain number occurs more than twice, count each complete pair once. For instance, for [1, 1, 1, 1] and [2, 2, 2, 2, 2], the method should return 2. The first array contains two complete pairs while the second has an extra 2 that isn't part of the other two pairs.

PROBLEM
Count occurances of each integer in a given array and return total pairs

DATA
Input: array of integers
array to uniq values
Output: integer

ALGORITHM
initialize return variable to 0
initialize unique values array to uniq values of the input array
iterate over each uniq values and count them in input
  divide by two and round down
  update result with the return value
return result

=end
def pairs(arr)
  result = 0
  uniq = arr.uniq
  uniq.each do |int|
    result += (arr.count(int)/2).floor
  end
  result
end

p pairs([3, 1, 4, 5, 9, 2, 6, 5, 3, 5, 8, 9, 7]) == 3
p pairs([2, 7, 1, 8, 2, 8, 1, 8, 2, 8, 4]) == 4
p pairs([]) == 0
p pairs([23]) == 0
p pairs([997, 997]) == 1
p pairs([32, 32, 32]) == 1
p pairs([7, 7, 7, 7, 7, 7, 7]) == 3