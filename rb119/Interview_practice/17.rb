=begin
PROBLEM
take arr of ints, sum them, and find the difference between result and next greater prime

EXMPLES
DATA
input array of ints
output int

ALG
set sums to sum of input
set current to sums
loop 
  current += 1
  if is_prime?(current)
    return diff current sums
  end
end

is_prime
  2..current - 1 do num
    if current % num == 0
      return false
  true

=end

def is_prime?(int)
  (2..(int - 1)).each do |divisor|
    if int % divisor == 0
      return false
    end
  end
  true
end

def nearest_prime_sum(arr)
  sums = arr.inject(:+)
  current = sums
  loop do
    current += 1
    if is_prime?(current)
      return current - sums
    end
  end
end


p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4