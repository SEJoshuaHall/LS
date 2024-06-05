=begin

PROBLEM
Create method to convert integers to strings. 
Assume 0 or positive, unsigned number.

EXAMPLES
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

DATA
Input: integer
hash to hold digits and corresponding numbers
array to hold digits
Output: string

ALGORYTHM
Create conversion hash
create new array of integer digits
loop through array selecting corresponding string value for each element and append those elements in new string variable
return string variable

CODE
=end


def integer_to_string(int)
  result = ''
  conversion_hsh = {1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 0 => '0'}
  integer_arr = int.digits.reverse
  integer_arr.each do |e|
    result << conversion_hsh[e]
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'