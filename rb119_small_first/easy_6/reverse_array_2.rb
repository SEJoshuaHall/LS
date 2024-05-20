=begin

PROBLEM
Take an array and return a new array with the elements reversed.


EXAMPLES
reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true


DATA
Input: array
Output new array


ALGORYTHM
create shallow copy of array
find the size of array
swap first and last, second and second to last, etc until reach middle


CODE
=end

def reverse(array)
  array_copy = array.dup
  left_idx = 0
  right_idx = -1

  while left_idx < array.size / 2 do
    array_copy[left_idx], array_copy[right_idx] = array_copy[right_idx], array_copy[left_idx]
    left_idx += 1
    right_idx -= 1
  end
  array_copy
end


p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

p list = [1, 3, 2]                      # => [1, 3, 2]
p new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true

