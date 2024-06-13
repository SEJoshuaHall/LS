=begin
PROBLEM
take single int, return sum of all multiples of 7 and 11 that are less than the argument

Rules, count every number once, even if both 7 and 11

EXAMPLES
if 0 or less, return 0

DATA
input integer
output integer

alg
set result
2 to input - 1 do
  if % 7 or 11 is 0
  result += num
  end
end

=end

def seven_eleven(int)
  result = 0
  return result if int < 2
  (2..(int - 1)).each do |num|
    if num % 11 == 0 || num % 7 == 0
      result += num
    end
  end
  result
end

p seven_eleven(10) == 7
p seven_eleven(11) == 7
p seven_eleven(12) == 18
p seven_eleven(25) == 75
p seven_eleven(100) == 1153
p seven_eleven(0) == 0
p seven_eleven(-100) == 0