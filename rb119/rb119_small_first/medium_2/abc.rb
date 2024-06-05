=begin

PROBLEM
Blocks use two letters. Each block can only be used 1 time. Take word and return whether it can be spelled with given blocks.


EXAMPLES

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

DATA
Hash of blocks and times used


ALGORYTHM
create blocks hash with letters and true false for used
iterate over given word and turn blocks on when letter is found
if already true, return false
  if letter not found, return false


CODE
=end



def block_word?(word)
  blocks = [['BO', false], ['XY', false], ['DQ',  false], ['CP',  false], ['NA',  false], ['GT',  false], ['RE',  false], ['FS',  false], ['JW',  false], ['HU',  false], ['VI',  false], ['LY',  false], ['ZM', false]]
  result = true
  letters = word.upcase.chars
  letters.each do |letter|
    blocks.map do |sub|
      if sub[0].include?(letter)
        if sub[1]
          result = false
        else
          sub[1] = true
        end
      end
    end
  end
  result
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true