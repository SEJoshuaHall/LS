=begin

write a program to manage robot factory settings
all robot names must be unique, even when reset
generate random names with AA111 formatting and keep track to prevent duplicates

=end

class Robot
  LETTERS = ("A".."Z").to_a
  DIGITS = (0..9).to_a

  @@used_names = []

  attr_reader :name

  def initialize
    @name = get_name
  end

  def reset
    @name = get_name
  end

  def get_name
    new_name = ''
    loop do
      new_name_chars = []
      2.times do
        new_name_chars << LETTERS.sample
      end
      3.times do
        new_name_chars << DIGITS.sample
      end
      new_name = new_name_chars.join('')
      break unless @@used_names.include?(new_name)
    end
    @@used_names << new_name
    new_name
  end
end


