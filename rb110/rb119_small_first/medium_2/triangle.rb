=begin

PROBLEM
check 3 side1egers to determine if their lengths can be a valid triangle and if so, which type


EXAMPLES
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid


DATA



ALGORYTHM



CODE
=end

def triangle(side1, side2, side3)
  if side1 <= 0 || side2 <= 0 || side3 <= 0 ||
    side1 + side2 <= side3 ||
    side2 + side3 <= side1 ||
    side3 + side1 <= side2
    return :invalid
  elsif side1 == side2 && side1 == side3
    return :equilateral
  elsif (side1 == side2) || (side2 == side3) || (side3 == side1)
    return :isosceles
  else
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid