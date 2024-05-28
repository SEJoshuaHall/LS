=begin

PROBLEM
Method takes string and removed duplicates without using squeeze.


EXAMPLES
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''


DATA
Input: string
array of characters from original string
Output: string


ALGORYTHM
CONVERT to array of characters
SET new string variable
If character is not the same as previous, append
RETURN string


CODE
=end

def crunch(string)
  array_chars = string.chars
  result = ''
  array_chars.map do |char|
    if result != '' && result[-1] == char
      next
    else
      result << char
    end
  end
  result
end


p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''