=begin
PROBLEM
take string of digits, return number of even substrings

EXAMPLE
DATA
input string of digits
output int representing number of evens

ALG
set result to 0
convert to array of digits
iterate by index
  if even, result += (idx + 1)
result

=end

def even_substrings(str)
  result = 0
  arr = str.to_i.digits.reverse
  arr.each_with_index do |num, idx|
    if num.even?
      result += (idx + 1)
    end
  end
  result
end

p even_substrings('1432') == 6
p even_substrings('3145926') == 16
p even_substrings('2718281') == 16
p even_substrings('13579') == 0
p even_substrings('143232') == 12
