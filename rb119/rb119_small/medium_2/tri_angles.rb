def triangle(*args)
  angles = [*args].sort
  return :invalid if angles[0] <= 0 || angles.inject(:+) != 180
  return :acute if angles[2] < 90
  return :right if angles[2] == 90
  return :obtuse if angles[2] > 90
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid