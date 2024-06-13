=begin
take str, return true if pangram

pangrams contain every letter of the alphabet at least once

ALG
=end

def is_pangram (str)
  ('a'..'z').to_a.each do |letter|
    if !str.downcase.include?(letter) 
      return false
    end
  end
  true
end

p is_pangram('The quick, brown fox jumps over the lazy dog!') == true
p is_pangram('The slow, brown fox jumps over the lazy dog!') == false
p is_pangram("A wizard’s job is to vex chumps quickly in fog.") == true
p is_pangram("A wizard’s task is to vex chumps quickly in fog.") == false
p is_pangram("A wizard’s job is to vex chumps quickly in golf.") == true

my_str = 'Sixty zippers were quickly picked from the woven jute bag.'
p is_pangram(my_str) == true