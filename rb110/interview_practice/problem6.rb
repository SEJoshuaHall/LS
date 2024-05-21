=begin
Create a method that takes a string argument and returns a hash in which the keys represent the lowercase letters in the string, and the values represent how often the corresponding letter occurs in the string.

PROBLEM
Take a string, count the lowercase letters, and return a hash with the letters and keys and their count as values

DATA
Input string
Array of characters
array of lowercase letters
Return hash

ALGORITHM
set array to the characters from the initial string
set lowercase letters array
set result hash
iterate through characters array
  if character is letter (helper)
    update the hash with this letter
      if letter exists, update the count
      add the letter with count
hash

=end

def lowercase_letter?(letter)
  valid = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)
  valid.include?(letter)
end

def count_letters(str)
  chars_arr = str.chars
  result = {}
  chars_arr.each do |char|
    if lowercase_letter?(char)
      if result.include?(char)
        result[char] += 1
      else
        result[char] = 1
      end
    end
  end
  result
end


expected = {'w' => 1, 'o' => 2, 'e' => 3, 'b' => 1, 'g' => 1, 'n' => 1}
p count_letters('woebegone') == expected

expected = {'l' => 1, 'o' => 1, 'w' => 1, 'e' => 4, 'r' => 2,
            'c' => 2, 'a' => 2, 's' => 2, 'u' => 1, 'p' => 2}
p count_letters('lowercase/uppercase') == expected

expected = {'u' => 1, 'o' => 1, 'i' => 1, 's' => 1}
p count_letters('W. E. B. Du Bois') == expected

p count_letters('x') == {'x' => 1}
p count_letters('') == {}
p count_letters('!!!') == {}