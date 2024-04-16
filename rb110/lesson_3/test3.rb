def deep_clone(arr)
  arr.map { |el| el.is_a?(Array) ? deep_clone(el) : el }
end

arr = ['a', 'b', 'c', 'd']
arr2 = deep_clone(arr)

p arr
p arr2
arr[0] = 'e'
p arr
p arr2
arr2[1] = 'f'
p arr
p arr2
