
def largest_prime(int)
  divisor = 2
  result = 0
  loop do
    if int % divisor == 0
      result = divisor
      int /= divisor
    else
      divisor += 1
    end
    break if divisor > int
  end
  result
end

p largest_prime(600851475143)
