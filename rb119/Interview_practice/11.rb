=begin
take str, return array with str and int.

EXAMPLE

DATA
input str
all substrings to 1/2 length
output str, int

ALG
set substrings to []
get substrings
  0 to 1/2 input length - 1 do |length|
    concat to substrings str slice 0 for length 
iterate over substrings
  if input length / substring length times substring == input
    return array [sub, length]
[input string, length]

=end

def repeated_substring(str)
  subs = []
  (1..(str.length / 2)).each do |length|
    subs << str.slice(0, length)
  end
  subs.each do |sub|
    if sub * (str.length / sub.length) == str
      return [sub, (str.length / sub.length)]
    end
  end
  [str, 1]
end

p repeated_substring('xyzxyzxyz') == ['xyz', 3]
p repeated_substring('xyxy') == ['xy', 2]
p repeated_substring('xyz') == ['xyz', 1]
p repeated_substring('aaaaaaaa') == ['a', 8]
p repeated_substring('superduper') == ['superduper', 1]