=begin

PROBLEM
Take 2 strings, find which one is shorter, return concatenated string 'shorterlongershorter'. May assume different lengths.

EXAMPLES
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

DATA
Input: 2 strings
Output: 1 string

ALGORYTHM
determine length and assign to variables short and long
concatenate and return new string 'shorterlongershorter'

CODE
=end

def short_long_short(str, str_2)
  long = str.length > str_2.length ? str : str_2
  short = str.length < str_2.length ? str : str_2
  "#{short}#{long}#{short}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"