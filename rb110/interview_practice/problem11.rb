=begin
Create a method that takes a nonempty string as an argument and returns an array consisting of a string and an integer. If we call the string argument s, the string component of the returned array t, and the integer component of the returned array k, then s, t, and k must be related to each other such that s == t * k. The values of t and k should be the shortest possible substring and the largest possible repeat count that satisfies this equation.

You may assume that the string argument consists entirely of lowercase alphabetic letters.


PROBLEM
Find the fsmallest substring which when repeated equals the entire string
return array with that substring and the integer representing how many times that array appears in the string

DATA
Input: string
Output: array with substring, and integer

ALGORITHM
set counter
take counter elements slice of array from beginning
take length of input / counter and multiply by substring to determine if it equals string
  if so, return substring and counter
  else increment counter and repeat


=end

def repeated_substring(str)
  counter = 1
  loop do
    if str[0, counter] * (str.length / counter) == str
      break
    else
      counter += 1
    end
  end
  [str[0, counter], (str.length / counter)]
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]