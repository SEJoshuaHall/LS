=begin
PROBLEM
take str, return hash where keys represent lowercase letters in str, and values their occurance

EXAMPLE
Rules
Ignore non-alpha chars
Ignore uppercase chars
if empty, return empty hash

DATA
input: string
array of lowercase letters
Output: hash

ALG
set result hash
set lowercase letter array
iterate over letters
  count occurance
  if > 0
    set as hash k, v
return result

=end

def count_letters(str)
  result = {}
  alpha = ('a'..'z').to_a
  alpha.each do |letter|
    if str.count(letter) > 0
      result[letter] = str.count(letter)
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