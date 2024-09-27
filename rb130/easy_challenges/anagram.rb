class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    result = arr.select {|word| word.downcase != @word.downcase && word.downcase.chars.sort.join('') == @word.downcase.chars.sort.join('') }
  end
end