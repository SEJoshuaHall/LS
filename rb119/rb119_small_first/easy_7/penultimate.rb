=begin

PROBLEM
select and return next to last word from input string, words are any sequence of non-blank characters. Assume at least two words for argument string.


EXAMPLES
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'


DATA



ALGORYTHM



CODE
=end

def penultimate(str)
  arr = str.split(' ')
  arr[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'