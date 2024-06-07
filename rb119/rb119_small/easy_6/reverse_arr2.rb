def reverse(arr)
  array = arr.dup
  left_idx = 0
  right_idx = -1

  while left_idx < array.length / 2
    array[left_idx], array[right_idx] = array[right_idx], array[left_idx]
    left_idx += 1
    right_idx -= 1
  end

  array
end

p reverse([1,2,3,4]) == [4,3,2,1]          # => true
p reverse(%w(a b e d c)) == %w(c d e b a)  # => true
p reverse(['abc']) == ['abc']              # => true
p reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
p list.object_id != new_list.object_id  # => true
p list == [1, 3, 2]                     # => true
p new_list == [2, 3, 1]                 # => true