=begin

PROBLEM
take an array and form two arrays with the first half (round up) in the first array and the second in the second. Return nested in a new array.


EXAMPLES
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]


DATA
Input: array
Output: nested array with two inner arrays


ALGORYTHM
duplicate original array
take half the length of input array
until counter is half length, append to new array
  nest new array and remaining dup array togethr in return array


CODE
=end
def halvsies(array)
  working_array = array.dup
  half = (array.length + 1) / 2
  first_array = []
  until half == 0
    first_array << working_array.shift
    half -= 1
  end
  [first_array, working_array]
end


p halvsies([1, 2, 3, 4, 5]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]