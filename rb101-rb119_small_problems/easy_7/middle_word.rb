=begin

PROBLEM
Take a string are return the middle word. Words are separated by spaces. return empty when no words, return word when only one word, when even number of words, choose the first of the two in the middle


EXAMPLES
'' || ' ' => ''
'one' => 'one'
'one two' => 'one'
'one two three' => 'two'


DATA
Input: string
Outputs: string

ALGORYTHM
if one word, return word
if no words return ''
if two or more words, return middle, rounding down


CODE
=end

def mid(str)
  result = ''
  mid = 0
  if str == ' ' || str == ''
    result = ''
  elsif str != ' ' && str != ''
    arr = str.split(' ')
    middle = ((arr.count) -1) /2
    result = arr[middle]
  end
  result
end

p mid('') == ''
p mid(' ') == ''
p mid('one') == 'one'
p mid('one two') == 'one'
p mid('one two three') == 'two'