=begin

PROBLEM
take 2 ints, first is count, second is first num of sequence. Return array containing the same number of elements as count, with values of each element being multiples of the starting number


EXAMPLES
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []


DATA



ALGORYTHM



CODE
=end

def sequence(int, int2)
  result = []
  counter = 1
  current = int2
  until counter > int do
    result << current
    current += int2
    counter += 1
  end
  result
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 100) == []