
def negative(int)
  int = int * -1 if int > 0
  int
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0