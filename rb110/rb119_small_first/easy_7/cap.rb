=begin

PROBLEM
Return a new string with first letter of each word capitalized.


EXAMPLES
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


DATA
Input: string
Array of words to capitalize
Output: string


ALGORYTHM
split string by spaces
upcase all but in quotes
concat into new string


CODE
=end

def word_cap(str)
  str_2 = str.dup.downcase
  str_2 = str_2.gsub(/\b\S/) {|match| match.upcase}
  str_2.gsub(/"\S/) {|match| match.downcase}
end
  
p 'one'
p word_cap('four score and seven') == 'Four Score And Seven' 
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'


def word_cap2(str)
  arr = str.split
  result = arr.map do |word|
    word.capitalize
  end
  result.join(" ")
end
  
p 'two'
p word_cap2('four score and seven') == 'Four Score And Seven' 
p word_cap2('the javaScript language') == 'The Javascript Language'
p word_cap2('this is a "quoted" word') == 'This Is A "quoted" Word'
