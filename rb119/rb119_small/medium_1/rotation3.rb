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

def max_rotation(int)
  length = int.to_s.length
  length.downto(2) do |num_digits|
    int = rotate_rightmost_digits(int, num_digits)
  end
  int
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845