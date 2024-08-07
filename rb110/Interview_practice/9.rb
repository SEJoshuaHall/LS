=begin
PROBLEM
take 2 string args, return num times second occurs in first

Rules
overlapping do not count
return 0 if empty input string

EXAMPLES

DATA
input 2 strings
output int representing count of second in first

ALG
gsub with !
count !

=end

def count_substrings(str1, str2)
  str1.gsub(str2, '!').count('!')
end

p count_substrings('babab', 'bab') == 1
p count_substrings('babab', 'ba') == 2
p count_substrings('babab', 'b') == 3
p count_substrings('babab', 'x') == 0
p count_substrings('babab', 'x') == 0
p count_substrings('', 'x') == 0
p count_substrings('bbbaabbbbaab', 'baab') == 2
p count_substrings('bbbaabbbbaab', 'bbaab') == 2
p count_substrings('bbbaabbbbaabb', 'bbbaabb') == 1