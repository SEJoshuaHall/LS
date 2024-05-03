=begin

PROBLEM
Take an array and search value and return true if the array includes the search value and false otherwise.


EXAMPLES
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false


DATA
Input: array and integer/nil
Output: boolean


ALGORYTHM
loop through array comparing each element with the given element, return true if there is a match and false otherwise


CODE
=end

def include?(array, integer)
  result = false
  array.each do |e|
    if e == integer
      result = true
    end
  end
  result
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false