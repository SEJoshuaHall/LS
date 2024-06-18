=begin
Write a method that takes two sorted Arrays as arguments, and returns a new Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array. You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.

PROBLEM
Taking two arrays, which are sorted, return one sorted combined array.

Rules:
1. we cannot use sort, 
2. must build one element at a time.
3. must not modify input arrays

EXAMPLE

DATA
Input: 2 arrays
Output: array

ALG
set result array
first array index counter
second aray index counter
loop
  compare elements at indexes, and concat smaller to the result array
break when at the end of an index
add remaining elements of other index
return result

=end

def merge(arr1, arr2)
  result = []
  arr1_counter = 0
  arr2_counter = 0
  loop do
    if arr1[arr1_counter] <= arr2[arr2_counter]
      result << arr1[arr1_counter]
      arr1_counter += 1
    else
      result << arr2[arr2_counter]
      arr2_counter += 1
    end
    break if arr1_counter == (arr1.length) || arr2_counter == (arr2.length)
  end


  if arr1_counter >= arr1.length
    result += arr2[arr2_counter..-1]
  else
    result += arr1[arr1_counter..-1]
  end
    result
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]