=begin

PROBLEM
take a string with special characters, replace the special characters with spaces, but only have 1 consecutive space.


EXAMPLES
cleanup("---what's my +*& line?") == ' what s my line '


DATA
input: string
array of characters for iterating
output: string

ALGORYTHM
split string into individual characters
set a variable for final string
set a holding variable with latest character
if character is alphabetical, append to final
  if character is not alphabetical and previous is not space, append space


CODE
=end

def cleanup(text)
  valid = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']
  text_arr = text.chars
  result = ''
  last = ''
  text_arr.each do |e|
    if valid.include?(e.downcase)
      result << e
      last = e
    elsif last == ' '
      result
    else
      result << ' '
      last = ' '
    end
  end
  result
end

p cleanup("---what's my +*& line?") == ' what s my line '