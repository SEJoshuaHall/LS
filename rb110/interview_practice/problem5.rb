=begin
Create a method that takes a string argument and returns the character that occurs most often in the string. If there are multiple characters with the same greatest frequency, return the one that appears first in the string. When counting characters, consider uppercase and lowercase versions to be the same.

PROBLEM
Take a string and return the character which occurs most often. 
Rules: case agnostic, if there are multiple characters with the greatest frequencey, return the first

EXAMPLES
ignore case, return lowercase
not returning slaces

DATA
Input is a string
array of characters
hash to represent number of each character
Output is a character string

ALGORITHM
Initialize a hash
convert string to array of characters
iterate over the characters updating the hash with the character as key and teh number of occurances as value
return the key with the greatest value

=end

def most_common_char(str)
  char_hsh = {}
  arr_chars = str.downcase.chars
  result = ''
  arr_chars.each do |char|
    if char_hsh.include?(char)
      char_hsh[char] += 1
    else
      char_hsh[char] = 1
    end
  end
  num = char_hsh.values.max
  char_hsh.each_pair do |k,v|
    if v == num
      result << k
      break
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