=begin

PROBLEM
Take a number, if thw first half is the same as the second half, return it, otherwise, double and return it


EXAMPLES
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10


DATA
integer
to string to split and compare
if not double, then multiply by 2


ALGORYTHM



CODE
=end

def twice(int)
  str = int.to_s
  half = str.length / 2
  if (str[0, half] + str[0, half]) == str
    return int
  else
    int *= 2
  end
end


p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10