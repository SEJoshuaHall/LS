=begin

PROBLEM
Define method to return sum of ascii values of all characters in string.

EXAMPLES
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

DATA
input: string
result variable
output: integer

ALGORYTHM
take a string
split to array
loop over array, find and add ascii value to new result variable and return


CODE
=end

def ascii_value(str)
  str = str.chars
  result = 0
  str.each do |e|
    result += e.ord
  end
  result
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0