=begin

Create a method that takes a single integer argument and returns the sum of all the multiples of 7 or 11 that are less than the argument. If a number is a multiple of both 7 and 11, count it just once.

For example, the multiples of 7 and 11 that are below 25 are 7, 11, 14, 21, and 22. The sum of these multiples is 75.

If the argument is negative, return 0.

PROBLEM
if argument is less than 7, return 0
  from 7 to argument, add all multiples of 7 and 11 that are less than the argument and return result

DATA
Input: integer
Output: integer

ALGORITHM
set result = 0
if argument is >7
  7 up to argument minus 1
  check if multiple of 7 or 11 and if so add to result
return result

=end

def seven_eleven(int)
  result = 0
  if int >7
    7.upto(int-1) do |num|
      if num % 7 == 0 || num % 11 == 0
        result += num
      end
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