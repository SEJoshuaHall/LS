=begin

Create a method that takes a non-empty string as an argument. The string consists entirely of lowercase alphabetic characters. The method should return the length of the longest vowel substring. The vowels of interest are "a", "e", "i", "o", and "u".

PROBLEM
Take a string of lowercase, alphabetical chars, return length of largest vowel substring.


DATA
input: string
vowels array
array of string characters
Output: integer

ALGORITHM
set vowels array
set strings array
iterate over the string by index
if index starts with vowel
  set counter
  check next index
   if vowel, increment counter and repeat
   else take slice through that counter and add to array
return max sub array length

=end

def longest_vowel_substring(str)
  vowels = %w(a e i o u)
  strings = []
  result = 0
  0.upto(str.length) do |num|
    counter = num + 1
    if vowels.include?(str[num])
      num.upto(str.length) do |num_2|
        if vowels.include?(str[counter])
          counter += 1
        else
          break
        end
      end
      strings << str[num, (counter - num)]
    end
  end
  unless strings.empty?
    strings.each do |str|
      if str.length > result
        result = str.length
      end
    end
  end
  result
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('manaay') == 2
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5