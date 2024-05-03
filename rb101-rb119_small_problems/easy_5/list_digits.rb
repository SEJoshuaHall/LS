=begin

PROBLEM
Convert a positive integer to a list of digits in the number.


EXAMPLES
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

12345


DATA
Input: integer
Output: array of integers

ALGORYTHM
Repeatedly get the remainder from dividing by 10 and prepend to array


CODE
=end

def digit_list(int)
  arr = []
  until int < 1
    arr.prepend(int % 10)
    int = int / 10
  end
  arr
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true