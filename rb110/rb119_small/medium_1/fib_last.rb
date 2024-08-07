def fibonacci(int)
  return 1 if int == 1 || int == 2
  two_before, one_before = 1, 1
  (int - 2).times do |num|
    two_before, one_before = one_before % 10, two_before % 10 + one_before % 10
  end
  one_before
end

def fibonacci_last(int)
  fibonacci(int) % 10
end

p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4