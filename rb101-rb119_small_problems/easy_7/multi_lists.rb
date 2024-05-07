=begin

PROBLEM
take two arrays, multiple each element from the first array with the corresponding element of the second array at the same index and return a new array.


EXAMPLES
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]


DATA
Input: 2 arrays
Output: array


ALGORYTHM
Loop over first array by index and multiply by second at same index and return results to third at same index


CODE
=end

def multiply_list(arr, arr2)
  result = []
  arr.each_index {|i| result << arr[i] * arr2[i]}
  result
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]