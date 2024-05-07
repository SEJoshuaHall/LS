=begin

PROBLEM
Take argument string and return new string with every letter swapcased. May not use #swapcase.


EXAMPLES
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'


DATA
Input: string
Output: string


ALGORYTHM
loop over every character swapping the cases, use hash for brute version


CODE
=end

#Regex Version
def swapcase(str)
  str_2 = str.dup
  index = 0
  loop do
    if (str_2[index])=~(/[a-z]/)
      str_2[index] = str_2[index].upcase!
    elsif (str_2[index])=~(/[A-Z]/)
      str_2[index] = str_2[index].downcase!
    end
    index += 1
    break if index >= str_2.length
  end
  str_2
end


p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

#Bruteforce Version
def swapcase(str)
  uphash = Hash[('a'..'z').zip('A'..'Z')]
  downhash = Hash[('A'..'Z').zip('a'..'z')]
  arr = str.chars.map do |char|
    if uphash.keys.include?(char)
      char = uphash[char]
    elsif downhash.keys.include?(char)
      char = downhash[char]
    end
    char
  end
  arr.join
end


p swapcase('PascalCase') == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'