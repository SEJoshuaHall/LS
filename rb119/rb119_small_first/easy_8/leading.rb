=begin

PROBLEM
write method to take a string and return all consecutive substrings which start with the first character in an array of string


EXAMPLES
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']


DATA
Input: string
Output: array of strings


ALGORYTHM
set counter
set result array
until counter = length
  substring element 1 to counter slice << to result
increment counter
return result


CODE
=end

def leading_substrings(str)
  counter = 1
  result = []
  until counter == str.length+1
    result << str.slice(0, counter)
    counter += 1
  end
  result
end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']