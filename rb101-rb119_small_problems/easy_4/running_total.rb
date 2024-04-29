=begin

PROBLEM
take array, return new array with each element being the running total from original array.


EXAMPLES
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []


DATA
Input: array
Output: new array



ALGORYTHM
def method running_total
initialize running_total variable
map over elements of array
add element to running_total
return running_total



CODE
=end

def running_total(arr)
  running_total = 0
  arr.map do |e|
    running_total += e
  end
end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

#Each with object

def running_total(arr)
    running_total = 0
  arr.each_with_object([]) do |e, o|
    o << running_total += e
  end
end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []

