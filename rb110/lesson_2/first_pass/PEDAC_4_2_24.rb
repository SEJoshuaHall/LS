=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1


# PROBLEM
Need to find the highest value number when deleting one digit from an input

INPUT: Integer
OUTPUT: Integer


# EXAMPLES
delete_digit(791983) == 91983
delete_digit(152) == 52
delete_digit(1001) == 101
delete_digit(10) == 1


# DATA
Array of digits


# ALGORITHM
Generate all possible numbers from input 
  convert to string
  convert to array of characters
  loop over selecting all but one at index to increase with each iteration
    convert to integer
    add to array
append numbers to array
return largest number
  sort array
  
=end


# CODE
def subarrays(arr)
  arr2 = []
  idx = 0
  loop do 
    
    break if idx == arr.length
  end
  arr2.sort do |a, b|
    a <=> b
  end
end

def delete_digit(int)
  int.to_s
  arr = int.char
  arr = subarrays(arr)
  arr.pop
end


