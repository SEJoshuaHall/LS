
def triangle(angle1, angle2, angle3)
  if angle1 + angle2 + angle3 != 180 ||
    angle1 <= 0 ||
    angle2 <= 0 ||
    angle3 <= 0
    return :invalid
  elsif angle1 == 90 || angle2 == 90 || angle3 == 90
    return :right
  elsif angle1 > 90 || angle2 > 90 || angle3 > 90
    return :obtuse
  else
    return :acute
  end
end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid