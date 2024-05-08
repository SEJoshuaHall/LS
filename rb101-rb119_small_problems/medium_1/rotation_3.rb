def rotate_array(arr)
  result = arr.dup
  moving = result.shift
  result << moving
end

def max_rotation(int)
  length = int.to_s.length
  counter = length
  result = int.to_s.chars
  until counter == 0
    rotating = result[-counter..-1]
    rotated = rotate_array(rotating)
    result[-counter..-1] = rotated
    counter -= 1
  end
  result.join.to_i
end


p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845