=begin
PEDAC
PROBLEM
write a recursive method for computing the nth fib number.

EXAMPLES
4
3                     2
2      1              1 0 
1 0 

DATA
input int
output int representing input number in fib sequence

ALG
for each recursion
  input is current evaluating index
  1 or recursion, which gets added
=end


def fibonacci(n)
  return 1 if n < 3
  n = fibonacci(n - 1) + fibonacci(n - 2)
end


p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765