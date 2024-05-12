=begin

PROBLEM
Write a method that takes a sentence string as input, and returns the same string with any sequence of the words 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.


EXAMPLES
word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'


DATA
Input: string
Output: string


ALGORYTHM
take string and substitute digits for words


CODE

def word_to_digit(str)
  str.gsub!('one', '1')
  str.gsub!('two', '2')
  str.gsub!('three', '3')
  str.gsub!('four', '4')
  str.gsub!('five', '5')
  str.gsub!('six', '6')
  str.gsub!('seven', '7')
  str.gsub!('eight', '8')
  str.gsub!('nine', '9')
  str.gsub!('zero', '0')
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'

Further Exploration
Using the provided initial solution:
- Use regex
- Replace regardless of case
- remove ' ' between numbers
- if 11, 10, or 7 digit number, format as phone number: +1 (123) 456-7890, (123) 456-7890, 456-7890

=end
