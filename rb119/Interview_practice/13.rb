=begin

take 2 strs, return true if chars in 1st can be rearranged to make 2nd

alg
get 2nd uniq
iterate over uniq
  if count 1st < 2nd return false
true

=end

def unscramble(str1, str2)
  unique = str2.chars.uniq
  unique.each do |letter|
    if str1.chars.count(letter) < str2.chars.count(letter)
      return false
    end
  end
  true
end

p unscramble('ansucchlohlo', 'launchschool') == true
p unscramble('phyarunstole', 'pythonrules') == true
p unscramble('phyarunstola', 'pythonrules') == false
p unscramble('boldface', 'coal') == true