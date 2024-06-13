=begin
PROBLEM
take a matrix, and transpose it. Return a new 3d array with the columns and rows swapped from the input array.

DATA
Input: 3 element, 3d matrix
Output: 3 element, 3d matrix

ALG
set return array with three enpty subarrays
0 to 2 do 
iterate over subarrays 3 times, getting and appending each element to a corresponding subarray
return subarray
=end

def transpose(matrix)
  result = [[], [], []]
  (0..2).each do |index|
    matrix.each do |element|
      result[index] << element[index]
    end
  end
  result
end 

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

def transpose!(matrix)
  holding = matrix.dup
  matrix = [[], [], []]
  (0..2).each do |index|
    holding.each do |element|
      matrix[index] << element[index]
    end
  end
  matrix
end 

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p transpose!(matrix) == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
