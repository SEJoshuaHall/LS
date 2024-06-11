=begin
PROBLEM
take an array of 3 integers, determine if they form a valid triangle and if so, which type

DATA
input: array of 3 ints
Output: symbol representing type of triangle

ALG
order input array
check if valid
  no 0
  smallest 2 greater than largest
check equilateral
  all sides =
check iso
  2 sides =
scalene

=end
def triangle(*args)
  sides = [*args].sort
  return :invalid if sides[0] <= 0 || sides[0] + sides[1] <= sides[2]
  return :equilateral if sides[0] == sides[1] && sides[1] == sides[2]
  return :isosceles if sides[0] == sides[1] || sides[1] == sides[2]
  :scalene
end


p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid