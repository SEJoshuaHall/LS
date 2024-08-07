=begin
PROBLEM
take arr ints as arg, find the digit for which all digits before and after sum to the same number, and return it, or -1 if none

EXAMPLES

DATA
input array
output int

ALG
find count
iterate with index
  if i == first 
  else, not last
  if 0..i-1 == i+1..-1
    return i
  else last
-1

=end
def equal_sum_index(int)
  last = int.count - 1
  int.each_with_index do |num, idx|
    if idx == 0
      if 0 == int.inject(:+) - num
        return idx
      end
    elsif idx != last && int[0...idx].inject(:+) == int[idx+1..-1].inject(:+)
      return idx
    elsif idx == last && int[0...idx].inject(:+) == num
      return idx
    end
  end
  -1
end

p equal_sum_index([1, 2, 4, 4, 2, 3, 2]) == 3
p equal_sum_index([7, 99, 51, -48, 0, 4]) == 1
p equal_sum_index([17, 20, 5, -60, 10, 25]) == 0

# The following test case could return 0 or 3. Since we're
# supposed to return the smallest correct index, the correct
# return value is 0.
p equal_sum_index([0, 20, 10, -60, 5, 25]) == 0