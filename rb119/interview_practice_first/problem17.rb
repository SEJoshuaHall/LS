=begin
Create a method that takes an array of integers as an argument. The method should determine the minimum integer value that can be appended to the array so the sum of all the elements equal the closest prime number that is greater than the current sum of the numbers. For example, the numbers in [1, 2, 3] sum to 6. The nearest prime number greater than 6 is 7. Thus, we can add 1 to the array to sum to 7.

Notes:

The array will always contain at least 2 integers.
All values in the array must be positive (> 0).
There may be multiple occurrences of the various numbers in the array.

PROBLEM
Take array of integers, find the sum of the integers, and find the next biggest prime number, and return the difference between that prime number and the sum of all the integers in the provided array.

DATA
Input: array of integers
sum of integers
next prime
Output: integer which is the difference between integer and sum

ALGORITHM
Set sum of integers
set counter to 1
loop checking for prime
  if prime, return counter
  else, next
end

=end
def is_prime?(int)
  result = true
  2.upto(int - 1) do |num|
    if int % num == 0
      result = false
    end
  end
  result
end

def nearest_prime_sum(arr)
  sum = arr.inject(:+)
  counter = 1
  loop do
    if is_prime?(sum+counter)
      return counter
    else
      counter += 1
    end
  end
end

p nearest_prime_sum([1, 2, 3]) == 1        # Nearest prime to 6 is 7
p nearest_prime_sum([5, 2]) == 4           # Nearest prime to 7 is 11
p nearest_prime_sum([1, 1, 1]) == 2        # Nearest prime to 3 is 5
p nearest_prime_sum([2, 12, 8, 4, 6]) == 5 # Nearest prime to 32 is 37

# Nearest prime to 163 is 167
p nearest_prime_sum([50, 39, 49, 6, 17, 2]) == 4