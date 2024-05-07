=begin

PROBLEM
take 2 arrays, multiply every elements of each array by every element of the other array and return as array sorted from smallest to largest


EXAMPLES
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]


DATA
Input 2 arrays
output 1 array


ALGORYTHM
loop over each element of first ayyay multiplying by each element of second array and adding to result array
sort and return result array


CODE
=end

def multiply_all_pairs(arr, arr2)
  result = []
  arr.each do |num|
    result << arr2.map do |num2|
      num * num2
    end
  end
  result.flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]