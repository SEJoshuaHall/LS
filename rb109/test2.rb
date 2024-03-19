def non_mutating_delete(arr)
  length = arr.count
  new_array = []
  select = 0
  loop do 
    new_array << arr[select]
    select += 1
    break if select == length - 1
  end
  new_array
end

arr = ['a', 'b', 'c', 'd']
p non_mutating_delete(arr) # should return ['a', 'b', 'c']
# works correctly

arr2 = ['a', 'b', 'c', 'c']
p non_mutating_delete(arr2) # should return ['a', 'b', 'c']
# but actually returns ['a', 'b']

arr3 = ['a', 'a', 'a', 'a'] # should return ['a', 'a', 'a']
p non_mutating_delete(arr3)
# but actually returns []