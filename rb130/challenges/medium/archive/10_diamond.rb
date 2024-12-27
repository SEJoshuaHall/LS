# frozen_string_literal: true

# This class prints out diamonds!
class Diamond
  class << self
    ALPHABET = ('A'..'Z').to_a

    def make_diamond(letter)
      letter.upcase!
      nth_letter = get_nth(letter)
      width = nth_letter * 2 - 1
      result = top(letter, nth_letter, width)
      result += bottom(letter, nth_letter, width)
      result.join('')
    end

    private

    def get_nth(letter)
      nth = 0
      ALPHABET.each_with_index do |array_letter, index|
        nth = index + 1 if array_letter == letter
      end
      nth
    end

    def top(_letter, nth_letter, width)
      result = []
      current_spaces = width / 2
      result << "#{' ' * current_spaces}A#{' ' * current_spaces}\n"
      ALPHABET.each_with_index do |letter, index|
        next if index.zero?
        break if index >= nth_letter

        current_spaces -= 1
        result << "#{' ' * current_spaces}#{letter}#{' ' * (index * 2 - 1)}#{letter}#{' ' * current_spaces}\n"
      end
      result
    end

    def bottom(letter, nth_letter, _width)
      result = []
      current_spaces = 1
      current_index = nth_letter - 2
      until current_index <= 0
        result << "#{' ' * current_spaces}#{ALPHABET[current_index]}#{' ' * (current_index * 2 - 1)}#{ALPHABET[current_index]}#{' ' * current_spaces}\n"
        current_index -= 1
        current_spaces += 1
      end

      result << "#{' ' * current_spaces}A#{' ' * current_spaces}\n" unless letter == 'A'
      result
    end
  end
end
