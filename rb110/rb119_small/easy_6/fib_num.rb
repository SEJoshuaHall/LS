=begin
PROBLEM
Find the index of the first fib number which contains the number of digits in the argument.
Rules: the problem assumes that index starts at 1, not 0.

DATA
Input: integer representing digit requirement
counter for current index
variables for previous 2 numbers
Output: integer representing index number

ALG
set previous_fib to 1
set current_fib to 1
set current_index to 1
iterate
  check if current_index contains required number of digits
  set previous to current and current to sum
  increment index
return current_index

=end
def find_fibonacci_index_by_length(int)
  previous_fib = 1
  current_fib = 1
  current_index = 2
  loop do
    break if current_fib.to_s.length >= int
    previous_fib, current_fib = current_fib, previous_fib + current_fib
    current_index += 1
  end
  current_index
end

p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847

