class Octal
  VALID = ['0', '1', '2', '3', '4', '5', '6', '7']
  def initialize(octal)
    @octal = octal.chars.reverse
  end

  def to_decimal
    return 0 if @octal.any? {|char| !VALID.include?(char)}
    result = 0
    @octal.each_with_index do |char, idx|
      result += char.to_i * (8 ** idx)
    end
    result
  end
end

