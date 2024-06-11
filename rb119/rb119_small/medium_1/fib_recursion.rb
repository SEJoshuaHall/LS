=begin
PROBLEM
write a recursive method for finding the nth fib. number.

EXAMPLES
F(1) = 1
F(2) = 1
F(n) = F(n - 1) + F(n - 2) where n > 2

def sum(n)
  return 1 if n == 1
  n + sum(n - 1)
end

DATA
Input: integer representing number of iterations
variables for last two numbers
Output: final number in fib sequence at input iteration

3rd
return 2nd

ALG


=end
def fibonacci(int)
  return int if int < 2
  fibonacci(int - 1) + fibonacci(int -2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765