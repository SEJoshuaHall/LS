# def rotate_array(arr)
#   result = []
#   1.upto(arr.count - 1) do |index|
#     result << arr[index]
#   end
#   result << arr[0]
#   result
# end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integers(int)
  rotate_array(int.to_s.chars).join.to_i
end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# p rotate_string("test")

p rotate_integers(123)
