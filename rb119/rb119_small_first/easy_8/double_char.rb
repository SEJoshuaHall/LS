=begin

PROBLEM
take a string, and return a string with each character doubled in place


EXAMPLES
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''


DATA
input: string
output: string


ALGORYTHM
split by character, loop over and twice add character to new working string which is returned


CODE
=end

def repeater(str)
  result = ''
  str.chars.map {|e| result << "#{e}#{e}"} .join
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''