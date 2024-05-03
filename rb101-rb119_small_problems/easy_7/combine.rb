def interleave(arr_1, arr_2)
  counter = 0
  result = []
  loop do
    result << arr_1[counter]
    result << arr_2[counter]
    counter += 1
    break if counter >= arr_1.size
  end
  result
end


p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']