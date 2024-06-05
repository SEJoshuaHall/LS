=begin

PROBLEM
Given a string of words separated by spaces, swap the first and last letters of each word.


EXAMPLES
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'


DATA
input: string
arrays to hold data
Output: string


ALGORYTHM
split string by ' ' and add to array
loop over array swapping first and last letter of each word
add words back to string


CODE
=end

def swap(str)
  arr = str.split(' ')
  arr = arr.map do |word|
    word_arr = word.chars
    last = word_arr.pop
    first = word_arr.shift
    word = word_arr.join
    "#{last}#{word}#{first}"
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'