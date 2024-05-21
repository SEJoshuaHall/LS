=begin
Create a method that takes a string as an argument and returns true if the string is a pangram, false if it is not.

Pangrams are sentences that contain every letter of the alphabet at least once. For example, the sentence "Five quacking zephyrs jolt my wax bed." is a pangram since it uses every letter at least once. Note that case is irrelevant.

PROBLEM
take a string and check to see if it contains every letter of the alphabet

DATA
Input: string
array of alphabet
Output: boolean

ALGORITHM
initialize array of alphabet
iterate over alphabet checking if input includes each letter
  if a false, return fales, else return true

=end

def is_pangram(str)
  result = true
  alpha = %w(q w e r t y u i o p a s d f g h j k l z x c v b n m)
  alpha.each do |char| 
    unless str.include?(char)
      result = false
    end 
  end
  result
end


p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true