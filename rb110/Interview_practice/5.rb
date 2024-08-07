=begin
PROBLEM
take a string, downcase, and return the character which appears the most offen

EXAMPLES

DATA
input string
output character

ALG
dup downcased string
set alphabet array
iterate over alpha, counting chars in str, and return max

=end

def most_common_char(str)
  arr = str.downcase.chars
  count = 0
  result = ''
  arr.each do |letter|
    if arr.count(letter) > count
      result = letter
      count = arr.count(letter)
    end
  end
  result
end

p most_common_char('Hello World') == 'l'
p most_common_char('Mississippi') == 'i'
p most_common_char('Happy birthday!') == 'h'
p most_common_char('aaaaaAAAA') == 'a'

my_str = 'Peter Piper picked a peck of pickled peppers.'
p most_common_char(my_str) == 'p'

my_str = 'Peter Piper repicked a peck of repickled peppers. He did!'
p most_common_char(my_str) == 'e'