def zip(array_1, array_2)
  result = []
  (0...array_1.size).each do |index|
    result << [array_1[index], array_2[index]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]