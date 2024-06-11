=begin
PROBLEM
take an integer, find the next multiple of 7 which meets the following requirements and return it, or if none, return an error
REQs
odd
multiple of 7
every digit uniq

EXAMPLES

DATA
input integer
output integer

ALG
find next odd multiple of 7
  counter to 1
  increment counter checking if odd and if %7 = 0
helper
  find self or next multiple of 14 with uniq digits
  error if greater than 9 digits
  
=end
def find_next_odd(int)
  loop do
    int += 1
    break if int % 7 == 0 && int.odd?
  end
  int
end

def featured(int)
  int = find_next_odd(int)
  loop do
    if int.digits.uniq.count == int.digits.count
      break
    elsif int > 10000000000
      return "Error, no number meets the qualifications."
    end
    int = int + 14
  end
  int
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements