=begin
PROBLEM
check if a given string of all uppercase letters can be spelled with the given blocks

DATA
input: string
Hash with blocks
array of block numbers from word letters
output: boolean

ALG
initialize hash blocks
initialize word array to string input chars
iterate over word array transforming to block numbers from hash
  select from blocks the key whos value contains the character from the word array
check if word uniq is equal to word and return result

=end

BLOCKS = {1 => ['B', 'O'],
          2 => ['X', 'K'],
          3 => ['D', 'Q'],
          4 => ['C', 'P'],
          5 => ['N', 'A'],
          6 => ['G', 'T'],
          7 => ['R', 'E'],
          8 => ['F', 'S'],
          9 => ['J', 'W'],
          10 => ['H', 'U'],
          11 => ['V', 'I'],
          12 => ['L', 'Y'],
          13 => ['Z', 'M']}.freeze

def block_word?(string)
  word_arr = string.chars
  word_arr.map! do |char|
    block = BLOCKS.select {|k, v| v.include?(char.upcase)}.to_a
  end
  word_arr.flatten.uniq == word_arr.flatten
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true