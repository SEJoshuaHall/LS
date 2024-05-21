=begin

Create a method that takes two strings as arguments and returns true if some portion of the characters in the first string can be rearranged to match the characters in the second. Otherwise, the method should return false.

You may assume that both string arguments only contain lowercase alphabetic characters. Neither string will be empty.

PROBLEM
Take two strings, and if you can spell the second string with the characters from the first, return true

DATA
Input: 2 strings
Output: boolean

ALGORITHM
iterate over second string characters
if character is in first string, convert to * in first string
else return false
return true

=end

def unscramble(str, str2)
  result = true
  str2.chars.each do |char|
    if str.include?(char)
      str.sub!(char, '*')
    else
      result = false
    end
  end
  result
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true