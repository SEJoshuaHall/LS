=begin

PROBLEM
take an array of strings, and return array of same string values except with vowels removed (not 'y').


EXAMPLES
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']


DATA
Input: array of strings
Output: array of strings


ALGORYTHM
Iterate over array of strings, delete vowels, and return new array of strings


CODE
=end

def remove_vowels(array_of_strings)
  array_of_strings.map { |string| string.delete 'aeiouAEIOU' }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']