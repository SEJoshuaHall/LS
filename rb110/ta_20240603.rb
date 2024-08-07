=begin
// Write a function, snakecase, that transforms each word in a sentence to alternate between lower (even index value) and upper (odd index value) cases when the word before or after it  begins with "s". -- Joshua

PROBLEM
Take a string, iterate over words, and if the word prior or after starts with s, transform to upper/lowercase as described

EXAMPLES
Examples confirm my understanding

DATA
Input: string of words
Output: transformed string of words

ALG
convert string to array of words
Outer loop
  iterates over words by index
    if index > 0 and index - 1 word starts with s or S || index less than count and index + 1 word starts with s or S
      call helper method: alternate_case
join words and return

HELPER alternate_case
  takes word
  splits to characters
  set new word to result
  iterate over characters by index, and if off, concat upcase to result, else concat downcase...


// Test cases

=end

def alternate_case(word)
  arr_chars = word.chars
  result = ''
  arr_chars.each_with_index do |char, idx|
    if idx.even?
      result << char.downcase
    else
      result << char.upcase
    end
  end
  result
end

def snakecase(string)
  array_words = string.split
  result = []
  array_words.each_with_index do |word, idx|
    if idx > 0
      if array_words[idx - 1].start_with?('s') || array_words[idx - 1].start_with?('S')
        result << alternate_case(word)
      else
        result << word
      end
    elsif idx < array_words.length
      if array_words[idx + 1].start_with?('s') || array_words[idx + 1].start_with?('S')
        result << alternate_case(word)
      else
        result << word
      end
    else
      result << word
    end
  end
  result.join(" ")
end

p snakecase("Snakes slither silently")
p snakecase("simple sentence structure")
p snakecase("apples are sweet")
p snakecase("swiftly swimming swans")
p snakecase("the sun sets slowly")
p snakecase("A quick brown fox")

# console.log(snakecase("Snakes slither silently")); // "sNaKeS sLiThEr sIlEnTlY"
# # console.log(snakecase("simple sentence structure")); // "sImPlE sEnTeNcE sTrUcTuRe"
# console.log(snakecase("apples are sweet")); // "apples aRe sweet"
# console.log(snakecase("swiftly swimming swans")); // "sWiFtLy sWiMmInG sWaNs"
# console.log(snakecase("the sun sets slowly")); // "tHe sUn sEtS sLoWlY"
# console.log(snakecase("A quick brown fox")); // "A quick brown fox"