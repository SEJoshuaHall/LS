# Given a string and an integer i, write a method that splits the string up into a sentence of strings, where each string in the sentence contains a character of the argued string and every ith character after it:

=begin

PROBLEM
Each character in the input string will begin a word in the putput sentence. The next letter in the word will by the i number later, and so forth until the end.

Input: string
Output: strings

Requirements:
return error message if integer is '0'
return '' if input is ''

EXAMPLES
p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""

DATA
Need an array of strings to hold the data while it is being constructed.

ALGORITHM
Convert input string into array of characters
Create array to hold results
Iterate over the array by index forming new strings using initial letter plus the ith consecutive number until end of string
This will require two loops, first covers every letter, second selected every ith letter after the index
Convert array of strings to a string with a seperator ' '

CODE
=end

def fragment(str, ith)
  holding_arr = []
  str_arr = str.chars
  current_char = 0
  new_word = ''
  if ith < 1
    return "i cannot be less than 1"
  elsif str.empty?
    return ''
  else
    loop do
      iterating_char = current_char
      loop do
        p iterating_char
        new_word << str_arr[iterating_char]
        iterating_char += ith
        break if iterating_char > str.length
      end
      holding_arr << new_word
      current_char += 1
      break if current_char > str.length
    end
  end
  str_arr.join(' ')
end

p fragment("abcde", 1) == "abcde bcde cde de e"
p fragment("a b c d e", 2) == "ace bd ce d e"
p fragment("mary had a little lamb", 3) == "mydila ahatem raltlb ydila hatem altlb dila atem ltlb ila tem tlb la em lb a m b"
p fragment("abcde", 0) == "i cannot be less than 1"
p fragment("abcde", 100) == "a b c d e"
p fragment("", 1) == ""