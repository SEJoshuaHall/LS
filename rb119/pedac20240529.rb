=begin
We're receiving a set of messages in code. The messages are sets of text strings, like:
"alakwnwenvocxzZjsf"
Write a method to decode these strings into numbers. The decoded number should be the number of lowercase characters between the first two uppercase characters. If there aren't two uppercase characters, the number should be 0.

Test cases:
p decode(['ZoL', 'heLlo', 'XX']) == [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) == [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) == [8, 1]
p decode([]) == []

PROBLEM
count the number of spaces between first and second uppercase letters in string in input array and return array with those numbers, use 0 if none

DATA
Input: array of strings
Output: array of numbers

ALG
transform input arrays
  set counter to 0
  set count to false
  iterate over string
    if uppercase and count false
      count true
    if lowercase and count counter += 1
    if uppercase and count true
      return counter
    end
  end
  return array




=end

def check_two_upcase(string)
  counter = 0
  string.chars.each do |letter|
    if letter == letter.upcase
      counter += 1
    end
  end
  counter > 1
end

def decode(words_arr)
  words_arr.map do |string|
    if !check_two_upcase(string)
      0
    else
      counter = 0
      count = false
      upper = 0
      string.chars.each do |letter|
        if letter == letter.upcase
          if count == false
            count = true
          else
            break
          end
        else
          if count == false
            next
          else
            counter += 1
          end
        end
      end
      counter
    end
  end
end

p check_two_upcase("XX")
p decode(['ZoL', 'heLlo', 'XX']) #== [1, 0, 0]
p decode(['foUrsCoreAnd', 'seven', '']) #== [2, 0, 0]
p decode(['lucYintheskyWith', 'dIaMonDs']) #== [8, 1]
p decode([]) == []
