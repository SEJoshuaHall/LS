def multiply(int1, int2)
  int1 * int2
end

def square(int)
  multiply(int, int)
end

# p square(5) == 25
# p square(-8) == 64

def power(int, power)
  iteration = 1
  current = int
  loop do
    current = multiply(current, int)
    iteration += 1
    break if iteration >= power
  end
  current
end

p power(3, 3) == 27