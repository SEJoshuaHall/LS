=begin

PROBLEM
take an integer, return array of integers, in sequence, between 1 and the arg


EXAMPLES
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]


DATA
Input int
Output arr of ints


ALGORYTHM
set counter
add counter to new arr and increment
break when counter == arg
return arr


CODE
=end

def sequence(int)
  counter = 1
  arr = []
  until counter > int do
    arr << counter
    counter += 1
  end
  arr
end

p sequence(5) == [1, 2, 3, 4, 5]
p sequence(3) == [1, 2, 3]
p sequence(1) == [1]