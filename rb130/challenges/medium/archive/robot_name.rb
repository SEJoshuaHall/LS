# frozen_string_literal: true

# Creates a unique name each time a robot is manufactured or reset.
class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = (0..9).to_a

  @used_names = []
  attr_reader :name

  def reset
    @name = new_name
  end

  def new_name
    new_name = ''
    loop do
      new_name_chars = []
      2.times { new_name_chars << LETTERS.sample }
      3.times { new_name_chars << DIGITS.sample }
      new_name = new_name_chars.join('')
      break unless self.class.used_names.include?(new_name)
    end
    self.class.used_names << new_name
    new_name
  end

  private

  class << self
    attr_accessor :used_names
  end

  def initialize
    @name = new_name
  end
end
