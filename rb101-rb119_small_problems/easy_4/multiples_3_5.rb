=begin

PROBLEM
returns sum of all multiples of 3 or 5 that lie between 1 and input number. Input must be reater than 1.


EXAMPLES
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168


DATA
Input: integer
Output: integer


ALGORYTHM
set sum variable
set counter to supplied number
loop
break if 1
if counter % 3 == 0 of % 5 == 0
  add to sum variable
counter subtract 1
end
return sum

CODE
=end

def multisum(int)
  sum = 0
  counter = int
  loop do
    break if counter <= 1
    if counter % 5 == 0 || counter % 3 == 0
      sum += counter
    end
    counter -= 1
  end
  sum
end

p multisum(3) == 3
p multisum(5) == 8
p multisum(10) == 33
p multisum(1000) == 234168