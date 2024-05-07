=begin

PROBLEM
take a string, and return a string with each consonant doubled in place and all the rest unchanged


EXAMPLES
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""


DATA
input: string
output: string


ALGORYTHM
split by character, loop over and twice add character to new working string which is returned


CODE
=end

def double_consonants(str)
  result = ''
  str.chars.map do |e|
    if ('bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ').include?(e)
      result << "#{e}#{e}"
    else
      result << "#{e}"
    end
  end
  result
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""