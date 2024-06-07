
def reverse!(array)
  left_idx = 0
  right_idx = -1

  while left_idx < array.length / 2
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
    left_idx += 1
    right_idx -= 1
  end

  array
end


list = [1,2,3,4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true