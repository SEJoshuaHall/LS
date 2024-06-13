=begin
PROBLEM
take a string, return copy with every second character of every third word upcased

EXAMPLE

DATA
input: string
output: transformed string

ALG
split string into words
iterate over every third word
  if word.length > 1
    upcase at index 2
join and return new string
=end

def to_weird_case(str)
  words = str.split
  words.each_with_index do |word, idx|
    if (idx + 1) % 3 == 0
      if word.length > 1
        word = word.chars.each_with_index do |char, idx|
          word[idx] = word[idx].upcase if idx.odd?
        word
        end
      end
    end
  end
  words.join(" ")
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