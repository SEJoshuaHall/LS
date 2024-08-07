# def interleave(arr1, arr2)
#   result = []
#   loop do
#     result << arr1.shift
#     result << arr2.shift
#     break if arr1.empty?
#   end
#   result
# end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']