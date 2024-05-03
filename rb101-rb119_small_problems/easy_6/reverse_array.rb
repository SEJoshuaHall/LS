=begin

PROBLEM
Method takes an argument and reverses its elements in place. Mutating, not a new array. Cannot use `reverse`.



EXAMPLES
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
list == ["abc"] # true

list = []
reverse!(list) == [] # true
list == [] # true


DATA
1 Array which is to be mutated


ALGORYTHM

sort by index in reverse



CODE
=end

def reverse!(array)
  left_idx = 0
  right_idx = -1

  while left_idx < array.size / 2
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
    left_idx += 1
    right_idx -= 1
  end
  array
end

list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1] # true
list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
reverse!(list) == [] # true
p list == [] # true