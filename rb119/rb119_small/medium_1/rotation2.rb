def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_integers(int)
  rotate_array(int.to_s.chars).join.to_i
end

def rotate_rightmost_digits(number, digits)
  number = number.to_s.chars
  number[-digits..-1] = rotate_array(number[-digits..-1])
  number.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
