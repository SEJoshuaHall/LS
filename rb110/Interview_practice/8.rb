=begin
take str as arg, return int representing length of longest vowel substring

EXAMPLE

DATA
input: string
output: int representing num sequential vowels

ALG
set vowels array
set sub_str array
set switch to false
set current to str
iterate over input chars
if vowel
  set switch to true
  concat char to current
else
  if switch true
    concat current to sub_str
    set switch to false
    reset current
end
concat current to sub_str unless empty
get sub_str max count

=end
def longest_vowel_substring(str)
  vowels = %w(a e i o u)
  sub_str = []
  switch = false
  current = ''
  str.chars.each do |char|
    if vowels.include?(char)
      switch = true
      current << char
    else
      if switch == true
        sub_str << current
        switch = false
        current = ''
      end
    end
  end
  sub_str << current unless current == ''
  sub_str == [] ? 0 : sub_str.map{|str| str.length}.max
end

p longest_vowel_substring('cwm') == 0
p longest_vowel_substring('many') == 1
p longest_vowel_substring('launchschoolstudents') == 2
p longest_vowel_substring('eau') == 3
p longest_vowel_substring('beauteous') == 3
p longest_vowel_substring('sequoia') == 4
p longest_vowel_substring('miaoued') == 5