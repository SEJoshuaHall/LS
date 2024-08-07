=begin
Create a method that takes a string argument and returns a copy of the string with every second character in every third word converted to uppercase. Other characters should remain the same.

PROBLEM
Taking a string, returning a copy in which every second character of every third word is upcased.

DATA
Input: string of words
Output: new string of words

ALGORITHM
convert string to array of words
initialize arr_2 array to hold new words for new string
iterate over the words
  find every third word
  iterate over letters
    find every second letter and mutate it to upcase
    return new word
  build new array with unmodified and modified words
join and return the new string 

=end
def upcase_every_second(word)
  new_word = ''
  word.chars.each_with_index do |char, idx|
    if idx.odd?
      new_word << char.upcase!
    else
      new_word << char
    end
  end
  new_word
end

def to_weird_case(str)
  arr = str.split(' ')
  arr_2 = []
  arr.each_with_index do |word, idx|
    if (idx + 1) % 3 == 0
      arr_2 << upcase_every_second(word)
    else
      arr_2 << word
    end
  end
  arr_2.join(' ')
end


original = 'Lorem Ipsum is simply dummy text of the printing world'
expected = 'Lorem Ipsum iS simply dummy tExT of the pRiNtInG world'
p to_weird_case(original) == expected

original = 'It is a long established fact that a reader will be distracted'
expected = 'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case(original) == expected

p to_weird_case('aaA bB c') == 'aaA bB c'

original = "Mary Poppins' favorite word is supercalifragilisticexpialidocious"
expected = "Mary Poppins' fAvOrItE word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS"
p to_weird_case(original) == expected