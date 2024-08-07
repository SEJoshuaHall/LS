=begin

PROBLEM
Write a method to take an integer and computer the fibonacci number from that integer.


EXAMPLES
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501


DATA
Variable to hold total
Variable to hold iteration
Variable to hold last two variables


ALGORYTHM
if less that 2 return self
set counter
set previous two array
until counter == int
  add two previous, add to total, add to end of array while deleting first array element
return total


CODE
=end

def fibonacci(int)
  counter = 2
  previous = [1, 1]
  total = 0
  if int < 2
    total = int
  elsif int == 2
    total = 1
  else
    until counter == int
      total = (previous[0] + previous[1])
      previous[0] = previous[1]
      previous[1] = total
      counter += 1
    end
  end
  total
end

# p fibonacci(4) #== 3
# p fibonacci(20) #== 6765
# p fibonacci(100) #== 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501


def fibonacci_last(int)
  fibonacci(int).to_s.chars.last.to_i
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
