# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

=begin
PROBLEM
Select the palindromes within a given string.
Call upcase on those palindromes.
Return the new string.

input: string
output: new string

Rules
Empty strings return empty. Uppercase words remain uppercase. Spaces and punctuation should remain unchanged.

DATA
Input: string
Array: holding words from input string
Output: string

ALGORITHM
Convert string to array of words
Loop through array 
1. identifying words which are the same backwords,
2. uppercasing them destructively
Convert back to string with appropriate spaces and return

CODE


def change_me(str)
  return '' if str == ''
  arr = str.split
  counter = 0
  loop do
    arr[counter] = arr[counter].upcase if arr[counter].downcase == arr[counter].downcase.reverse
    counter += 1
    break if counter >= arr.length
  end
  new_str = arr.join(' ')
end

p change_me("We will meet at Noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

----------------------------------------------------------------------------------------------------------

ASSIGNMENT

Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

PROBLEM
input is a string, output is an array of substrings which contains only and all case-sensitive palindromes from the input.

Questions
1. Should the return be an array of substrings?
2. Are we modifying the input string in any way?
3. Should we include substrings which are not bound by spaces?
4. Will inputs always be strings?
5. What do you mean by palindromes are case-sensitive?

Rules
- palindrones are case sensitive
- substrings are not bound by spaces
- return empty array when input is empty string
- return empty array when input contains no palindromes

EXAMPLES
Test cases:

palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") == []
palindrome_substrings("") == []

DATA
Output is an array of substrings

=end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    reult << substring if is_palindrome?(substring)
  end
  result
end

def substrings(str)
  result = []
  starting_index = 0

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

