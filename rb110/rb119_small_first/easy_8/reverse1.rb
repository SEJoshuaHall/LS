=begin

PROBLEM
take string and return new string with words in reverse order


EXAMPLES
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''


DATA
input: string
output: string


ALGORYTHM
split into array of words
add words in reverse to new string and return


CODE
=end

def reverse_sentence(str)
  array = []
  if str.match?(/\S/)
    array = str.split(' ')
    array.reverse!
  end
  array.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''