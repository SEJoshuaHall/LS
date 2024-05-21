=begin
Create a method that returns the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. You may assume that the input string contains only alphanumeric characters.

PROBLEM
Take a string and return an integer representing the number of alphanumeric characters which occur more than once

EXAMPLES

DATA
Input: string
duplicate string
array of string characters
Output: integer

ALGORITHM
duplicate the string
set array to string characters
set result to 0
iterate over characters
  if found in dup >1
    increment count
    replace in dup with *
return count
=end

def distinct_multiples(str)
  dup = str.downcase.dup
  arr = dup.chars
  result = 0
  arr.each do |char|
    if dup.count(char) > 1
      result += 1
      dup.gsub!(char, '*')
    end
  end
  result
end

p distinct_multiples('xyz') == 0               # (none)
p distinct_multiples('xxyypzzr') == 3          # x, y, z
p distinct_multiples('xXyYpzZr') == 3          # x, y, z
p distinct_multiples('unununium') == 2         # u, n
p distinct_multiples('multiplicity') == 3      # l, t, i
p distinct_multiples('7657') == 1              # 7
p distinct_multiples('3141592653589793') == 4  # 3, 1, 5, 9
p distinct_multiples('2718281828459045') == 5  # 2, 1, 8, 4, 5