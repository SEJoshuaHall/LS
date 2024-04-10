=begin

Write a method that takes two strings as arguments, determines the longest of the two strings, and then returns the result of concatenating the shorter string, the longer string, and the shorter string once again. You may assume that the strings are of different lengths.

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

Problem:

  Inputs:
  - two strings, one longer than the other

  Outputs:
  -  One concatenated string

  Rules/Requirements:
  -  Start with shorter string, then longer string then shorter string again
  -  No rule regarding adding spaces or punctuation

  Questions:
  -  None

  Mental Model: 
  -  Method takes two strings, determines which is longer, and concatenants them as follows: shorter, then longer, then shorter again, and returns the new string.

Examples:
  short_long_short('abc', 'defgh') == "abcdefghabc"
  short_long_short('abcde', 'fgh') == "fghabcdefgh"
  short_long_short('', 'xyz') == "xyz"

Data:
  - Input strings (2)
  - Output string (1)
  
Algorithm:
define method which takes two strings as input
determine which string is shortest and set to `short` variable
determine which is longer and set to `long` variable
concat and return `short` + `long` + `short`

Code:
=end

def short_long_short(str_1, str_2)
  if str_1.length > str_2.length
    long = str_1
    short = str_2
  else
    long = str_2
    short = str_1
  end
  result = "#{short}#{long}#{short}"
end


p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"