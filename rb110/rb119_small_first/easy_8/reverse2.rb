=begin

PROBLEM
Take a string argument, return the same string but with words of 5 or more characters reversed.


EXAMPLES
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS


DATA
Input: string
holding array
Output string


ALGORYTHM



CODE
=end

def reverse_words(str)
  arr = str.split
  arr.map do |word|
    if word[4] != nil
      word.reverse!
    end
  end
  arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS