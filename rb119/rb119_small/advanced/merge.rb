=begin
PROBLEM
without using sort, take 2 arrays as input and build a new sorted array with all elements from the two input arrays

EXAMPLE

DATA
input: 2 arrays, sorted
output: 1 combined array, sorted

ALG
initialize variables to track current indices of each input array
set result array
loop
  compare 1st index of both inputs
    if 1st greater, concat to result and increment index counter
    else concat second and increment second index counter
  break when either counter reaches its corresponding length
  concat remainder of other

=end

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  return arr1 if arr2.empty?
  arr1_idx = 0
  arr2_idx = 0
  result = []
  loop do
    if arr1[arr1_idx] < arr2[arr2_idx]
      result << arr1[arr1_idx]
      arr1_idx += 1
    else
      result << arr2[arr2_idx]
      arr2_idx += 1
    end
    if arr1_idx >= arr1.count
      until arr2_idx >= arr2.count
        result << arr2[arr2_idx]
        arr2_idx += 1
      end
      return result
    elsif arr2_idx >= arr2.count
      until arr1_idx >= arr1.count
        result << arr1[arr1_idx]
        arr1_idx += 1
      end
      return result
    end
  end
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]