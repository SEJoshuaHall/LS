# def palindrome?(str)
#   str == str.reverse
# end

def palindrome?(str_or_arr)
  str_or_arr == str_or_arr.reverse
end

p palindrome?(['m','a','d','a','m']) == true
p palindrome?(['M','','d','a','m']) == false          # (case matters)

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true