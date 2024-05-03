=begin

PROBLEM
Calculate the index (starting at 1) of the first Fibonacci number that has the number of digits specified in the argument.


EXAMPLES
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847


DATA
Input: integer representing number of digits in target Fibonacci number
Array to hold fibonacci numbers as they are calculated
Output: integer representing index of target number


ALGORYTHM
build fibonacci array starting with 1, 1, 2
LOOP
increment index
check if last number is as long as the given number
if not, calculate next number and remove oldest number
if so, return index


CODE
=end

def find_fibonacci_index_by_length(length)
  fib = [1, 1, 2]
  index = 3
  loop do
    index += 1
    if fib.last.to_s.size == length
      break
    else
      fib << fib[-2] + fib[-1]
      fib.shift
    end
    break if fib.last.to_s.size == length
  end
  index
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847