def multiply_list(arr1, arr2)
  arr1.map.with_index {|e, i| e * arr2[i]}
end


def multiply_list(arr1, arr2)
  arr1.zip(arr2).map {|sub| sub.inject(:*)}
end


p multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]