=begin

Write a method that takes an array of consecutive letters as input and returns the missing letter.

PROBLEM
We receive an array of letters in the alphabet in order, and are to return the first letter which is missing in the array

EXAMPLES
Rules
Return opposite case from input case
No need to begin at 'a'
If empty, return empty

DATA
Input: array of letters in order, not necessarily beginning with a
Output: string of 1 letter, first letter missing, and opposite case

ALG
set uppercase and lowercase arrays
set start variable to false
loop over arrays
  when we hit the first match, set variable start to true
  when we hit the first non-match, return that letter swapcase


def determine_missing_letter(arr)
  return arr if arr.empty?
  alphabet = ('A'..'Z').to_a
  alphabet << ('a'..'z').to_a
  alphabet.flatten!
  start = false
  alphabet.each do |letter|
    if arr.include?(letter) && start == false
      start = true
    elsif start == true && !arr.include?(letter)
      return letter.swapcase
    end
  end
end


p determine_missing_letter(['a','b','c','d','f']) == 'E'
p determine_missing_letter(['o','q','r','s']) == 'P'
p determine_missing_letter(['H','J','K','L']) == 'i'
p determine_missing_letter([]) == []

=end
=begin
Given a word, return a copy of that word, removing every vowel after the first three:

PROBLEM
Take a string, and remove all vowels after the first three

EXAMPLES
y is a vowel

DATA
Input: string
Output: modified string

ALGORITHM
set counter to 0
set vowels array
convert string to array of characters
map the characters
  if vowel, counter += 1
    if counter >=3
      return ''
    end
  end
join array


def three_vowels(string)
  counter = 0
  vowels = %w(a e i o u y)
  arr_chars = string.chars.map do |char|
    if vowels.include?(char)
      if counter >= 3
        char = ''
      else
        counter += 1
      end
    end
    char
  end
  arr_chars.join
end


p three_vowels("tropical") == "tropical"
p three_vowels("tropicalia") == "tropical"
p three_vowels("BliMp123") == "BliMp123"
p three_vowels("eyelash2!!!") == "eyelsh2!!!"

=end

def sym(nested_array)
  array_index = 0
  sym_diff = []
  a = nested_array[array_index].uniq

  loop do |array|
    a = sym_diff if array_index > 0
    b = nested_array[array_index + 1].uniq
    a.each do |num1|
      sym_diff << num1 unless b.include?(num1)
    end
    b.each do |num2|
      sym_diff << num2 unless a.include?(num2)
    end
    p sym_diff
    array_index +=1
    break if array_index >= nested_array.size - 1
  end

  sym_diff.sort
end

# p sym([[1, 2, 3], [5, 2, 1, 4]]) == [3, 4, 5]
# p sym([[1, 2, 3, 3], [5, 2, 1, 4]]) == [3, 4, 5]
# p sym([[1, 2, 3], [5, 2, 1, 4, 5]]) == [3, 4, 5]
p sym([[1, 2, 5], [2, 3, 5], [3, 4, 5]]) #== [1, 4, 5]
# p sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3]]) == [2, 3, 4, 6, 7]
# p sym([[3, 3, 3, 2, 5], [2, 1, 5, 7], [3, 4, 6, 6], [1, 2, 3], [5, 3, 9, 8], [1]]) == [1, 2, 4, 5, 6, 7, 8, 9]