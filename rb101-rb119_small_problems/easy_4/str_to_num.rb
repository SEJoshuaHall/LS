=begin

PROBLEM
Convert a string containing numbers to an integer. Can assume only numbers are entered.


EXAMPLES
string_to_integer('4321') == 4321
string_to_integer('570') == 570


DATA
Input: string
Array to hold characters from string
Hash of string characters and corresponding integers
array to hold the corresponding integers
Output: integer

ALGORYTHM
split string into array of characters
loop over array
use the hash to find the corresponding integers and append to new array
By index from reverse, multiply by decimal place and add to total  

CODE
=end

def string_to_integer(str)
  str = str.chars
  num_lookup = {'1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9, '0' => 0}
  counter = 0
  nums = []
  idx = 1
  total = 0
  str.each do |e|
    nums << num_lookup[e]
  end
  loop do
    total += (nums[-idx] * (10**(idx - 1)))
    idx += 1
    break if idx > nums.length
  end
  total
end

p string_to_integer('4321') == 4321
p string_to_integer('570') == 570