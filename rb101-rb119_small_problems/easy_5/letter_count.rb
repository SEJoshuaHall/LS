=begin

PROBLEM
Take a string with one or more space separated words and return hash with number of words of different sizes.
Questions: What is a word? What format should the hash take? What do I do with punctuation? Is there an order required for the hash? Can I assume no duplicate spaces?

EXAMPLES
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

DATA
Input: string
array for holding words
Output: hash

ALGORYTHM
CONVERT string to array with individual words
INITIALIZE hash
BUILD hash with keys of word lengths and values of number of words of that length
RETURN hash

CODE
=end

def word_sizes(str)
  hsh = {}
  str = str.split(' ')
  str.each do |word|
    if hsh.has_key?(word.length)
      hsh[word.length] += 1
    else
      hsh[word.length] = 1
    end
  end
  hsh
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}