=begin
Sort the given array of strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"]  -->  ["fine", "Hello", "I'm", "there"]
["C", "d", "a", "B"]              -->  ["a", "B", "C", "d"]

PROBLEM
Take an array of strings, and return the array with the elements sorted in alphabetical order. Ignore case.

EXAMPLE
Punctuation is to remain unchanged, strings must remain unchanged. Unsure whether to return modified or new array.

DATA
Input: array of strings
Output: array of sorted strings

ALGORITHM
Call a sort method on the array

=end
def sortme(arr)
  arr.sort! {|a, b| a.downcase <=> b.downcase}
end

p sortme(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]
p sortme(["C", "d", "a", "B"]) == ["a", "B", "C", "d"]
