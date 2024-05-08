def rotate_array(arr)
  result = arr.dup
  moving = result.shift
  result << moving
end

def rotate_rightmost_digits(int, int2)
    arr = int.to_s.chars
    rotating = arr[-int2..-1]
    rotated = rotate_array(rotating)
    arr[-int2..-1] = rotated
    arr.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917