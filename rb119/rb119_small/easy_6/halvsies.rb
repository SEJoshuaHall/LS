def halvsies(arr)
  return [arr, []] unless arr.length > 1
  half = (arr.length + 1) / 2
  result = arr.slice!(0, half)
  [result, arr]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]