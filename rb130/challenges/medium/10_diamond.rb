=begin

PROBLEM
Take a letter, output a diamond:
Center each line
Start with A, and each line increments letter until letter is reached, at which point decrement letter back to A to print the bottom half

EXAMPLE
             "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"

DATA
Constant array of uppercase letters.
Input: letter
Output: STDOUT diamond

ALGORITHM
SET alpabet constant



=end

class Diamond

  ALPHABET = (A..Z).to_a
  def make_diamond

  end

  private

  def top_half

  end

  def bottom_half

  end
end

puts Diamond::ALPHABET